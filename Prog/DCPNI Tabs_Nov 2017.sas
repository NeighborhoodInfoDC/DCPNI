/**************************************************************************
 Program:  BPKPresentationResults.sas
 Library:  BridgePk
 Project:  NeighborhoodInfo DC
 Author:   J.Dev
 Created:  3/20/17
 Version:  SAS 9.2
 Environment:  Local Windows session
 
 Description:  Prepare data for initial 11th Street Bridge Park Data Room
			   Presentation on 3/27/2017, from ACS, Realprop, and Police

**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( ACS )
%DCData_lib( Realprop )
%DCData_lib( Police )
%DCData_lib( TANF )


%macro Compile_dcpni_data (geo, geosuf, subgeo, ngbhd);

data compile_dcpni_&geosuf;
	merge 
		RealProp.num_units_&geosuf 
			(keep= &geo units_sf_2000 units_sf_2001 units_sf_2002 
				units_sf_2003 units_sf_2004 units_sf_2005 units_sf_2006 units_sf_2007 
				units_sf_2008 units_sf_2009 units_sf_2010 units_sf_2011 units_sf_2012 
				units_sf_2013 units_sf_2014 units_sf_2015 units_sf_2016

				units_condo_2000 units_condo_2001 units_condo_2002
				units_condo_2003 units_condo_2004 units_condo_2005 units_condo_2006 units_condo_2007 
				units_condo_2008 units_condo_2009 units_condo_2010 units_condo_2011 units_condo_2012 
				units_condo_2013 units_condo_2014 units_condo_2015 units_condo_2016)
					
		RealProp.sales_sum_&geosuf 
			(keep= &geo sales_sf_2000 sales_sf_2001
					sales_sf_2002 sales_sf_2003 sales_sf_2004 sales_sf_2005 
					sales_sf_2006 sales_sf_2007 sales_sf_2008 sales_sf_2009 
					sales_sf_2010 sales_sf_2011 sales_sf_2012 sales_sf_2013
					sales_sf_2014 sales_sf_2015 sales_sf_2016 

					r_mprice_sf_2000 
					r_mprice_sf_2001 r_mprice_sf_2002 r_mprice_sf_2003 r_mprice_sf_2004
					r_mprice_sf_2005 r_mprice_sf_2006 r_mprice_sf_2007 r_mprice_sf_2008
					r_mprice_sf_2009 r_mprice_sf_2010 r_mprice_sf_2011 r_mprice_sf_2012
					r_mprice_sf_2013 r_mprice_sf_2014 r_mprice_sf_2015 r_mprice_sf_2016

					sales_condo_2000 sales_condo_2001
					sales_condo_2002 sales_condo_2003 sales_condo_2004 sales_condo_2005 
					sales_condo_2006 sales_condo_2007 sales_condo_2008 sales_condo_2009 
					sales_condo_2010 sales_condo_2011 sales_condo_2012 sales_condo_2013
					sales_condo_2014 sales_condo_2015 sales_condo_2016

					r_mprice_condo_2000
					r_mprice_condo_2001 r_mprice_condo_2002 r_mprice_condo_2003 r_mprice_condo_2004
					r_mprice_condo_2005 r_mprice_condo_2006 r_mprice_condo_2007 r_mprice_condo_2008
					r_mprice_condo_2009 r_mprice_condo_2010 r_mprice_condo_2011 r_mprice_condo_2012
					r_mprice_condo_2013 r_mprice_condo_2014 r_mprice_condo_2015 r_mprice_condo_2016)


		Police.Crimes_sum_&geosuf
			(keep=&geo 
				crimes_pt1_property_2000 crimes_pt1_property_2001 
				crimes_pt1_property_2002 crimes_pt1_property_2003 crimes_pt1_property_2004 
				crimes_pt1_property_2005 crimes_pt1_property_2006 crimes_pt1_property_2007 
				crimes_pt1_property_2008 crimes_pt1_property_2009 crimes_pt1_property_2010
				crimes_pt1_property_2011 crimes_pt1_property_2012 crimes_pt1_property_2013
				crimes_pt1_property_2014 crimes_pt1_property_2015 crimes_pt1_property_2016 
				crimes_pt1_violent_2000 crimes_pt1_violent_2001 
				crimes_pt1_violent_2002 crimes_pt1_violent_2003 crimes_pt1_violent_2004 
				crimes_pt1_violent_2005 crimes_pt1_violent_2006 crimes_pt1_violent_2007 
				crimes_pt1_violent_2008 crimes_pt1_violent_2009 crimes_pt1_violent_2010 
				crimes_pt1_violent_2011 crimes_pt1_violent_2012 crimes_pt1_violent_2013 
				crimes_pt1_violent_2014 crimes_pt1_violent_2015 crimes_pt1_violent_2016 
				crime_rate_pop_2000 crime_rate_pop_2001 crime_rate_pop_2002 crime_rate_pop_2003 
				crime_rate_pop_2004 crime_rate_pop_2005 crime_rate_pop_2006 crime_rate_pop_2007 
				crime_rate_pop_2008 crime_rate_pop_2009 crime_rate_pop_2010 crime_rate_pop_2011 
				crime_rate_pop_2012 crime_rate_pop_2013 crime_rate_pop_2014 crime_rate_pop_2015 
				crime_rate_pop_2016)
		
		Tanf.Fs_sum_&geosuf
			(keep=&geo 
			fs_client_2000 fs_client_2001 fs_client_2002 fs_client_2003 fs_client_2004
			fs_client_2005 fs_client_2006 fs_client_2007 fs_client_2008 fs_client_2009
			fs_client_2010 fs_client_2011 fs_client_2012 fs_client_2013 fs_client_2014
			fs_client_2015 fs_client_2016)

		Tanf.Tanf_sum_&geosuf
			(keep=&geo 
			tanf_client_2000 tanf_client_2001 tanf_client_2002 tanf_client_2003 tanf_client_2004
			tanf_client_2005 tanf_client_2006 tanf_client_2007 tanf_client_2008 tanf_client_2009
			tanf_client_2010 tanf_client_2011 tanf_client_2012 tanf_client_2013 tanf_client_2014
			tanf_client_2015 tanf_client_2016)
		;
	by &geo;
	if &geo in ( &subgeo);
run;

proc summary data=compile_dcpni_&geosuf;
	var _numeric_;
	by &geo;
	output out=compile_dcpni_sum_&geosuf sum=;
	run;

data compile_dcpni_sum_final_&geosuf
	(drop=crimes_pt1_property_2000 crimes_pt1_property_2001 
			crimes_pt1_property_2002 crimes_pt1_property_2003 crimes_pt1_property_2004 
			crimes_pt1_property_2005 crimes_pt1_property_2006 crimes_pt1_property_2007 
			crimes_pt1_property_2008 crimes_pt1_property_2009 crimes_pt1_property_2010
			crimes_pt1_property_2011 crimes_pt1_property_2012 crimes_pt1_property_2013
			crimes_pt1_property_2014 crimes_pt1_property_2015 crimes_pt1_property_2016 
			crimes_pt1_violent_2000 crimes_pt1_violent_2001 
			crimes_pt1_violent_2002 crimes_pt1_violent_2003 crimes_pt1_violent_2004 
			crimes_pt1_violent_2005 crimes_pt1_violent_2006 crimes_pt1_violent_2007 
			crimes_pt1_violent_2008 crimes_pt1_violent_2009 crimes_pt1_violent_2010 
			crimes_pt1_violent_2011 crimes_pt1_violent_2012 crimes_pt1_violent_2013 
			crimes_pt1_violent_2014 crimes_pt1_violent_2015 crimes_pt1_violent_2016 
			crime_rate_pop_2000 crime_rate_pop_2001 crime_rate_pop_2002 crime_rate_pop_2003 
			crime_rate_pop_2004 crime_rate_pop_2005 crime_rate_pop_2006 crime_rate_pop_2007 
			crime_rate_pop_2008 crime_rate_pop_2009 crime_rate_pop_2010 crime_rate_pop_2011 
			crime_rate_pop_2012 crime_rate_pop_2013 crime_rate_pop_2014 crime_rate_pop_2015 
			crime_rate_pop_2016);

	set compile_dcpni_sum_&geosuf;

		property_crime_rate_2000 = crimes_pt1_property_2000 / crime_rate_pop_2000;
		property_crime_rate_2001 = crimes_pt1_property_2001 / crime_rate_pop_2001;
		property_crime_rate_2002 = crimes_pt1_property_2002 / crime_rate_pop_2002;
		property_crime_rate_2003 = crimes_pt1_property_2003 / crime_rate_pop_2003;
		property_crime_rate_2004 = crimes_pt1_property_2004 / crime_rate_pop_2004;
		property_crime_rate_2005 = crimes_pt1_property_2005 / crime_rate_pop_2005;
		property_crime_rate_2006 = crimes_pt1_property_2006 / crime_rate_pop_2006;
		property_crime_rate_2007 = crimes_pt1_property_2007 / crime_rate_pop_2007;
		property_crime_rate_2008 = crimes_pt1_property_2008 / crime_rate_pop_2008;
		property_crime_rate_2009 = crimes_pt1_property_2009 / crime_rate_pop_2009;
		property_crime_rate_2010 = crimes_pt1_property_2010 / crime_rate_pop_2010;
		property_crime_rate_2011 = crimes_pt1_property_2011 / crime_rate_pop_2011;
		property_crime_rate_2012 = crimes_pt1_property_2012 / crime_rate_pop_2012;
		property_crime_rate_2013 = crimes_pt1_property_2013 / crime_rate_pop_2013;
		property_crime_rate_2014 = crimes_pt1_property_2014 / crime_rate_pop_2014;
		property_crime_rate_2015 = crimes_pt1_property_2015 / crime_rate_pop_2015;
		property_crime_rate_2016 = crimes_pt1_property_2016 / crime_rate_pop_2016;
		violent_crime_rate_2000 = crimes_pt1_violent_2000 / crime_rate_pop_2000;
		violent_crime_rate_2001 = crimes_pt1_violent_2001 / crime_rate_pop_2001;
		violent_crime_rate_2002 = crimes_pt1_violent_2002 / crime_rate_pop_2002;
		violent_crime_rate_2003 = crimes_pt1_violent_2003 / crime_rate_pop_2003;
		violent_crime_rate_2004 = crimes_pt1_violent_2004 / crime_rate_pop_2004;
		violent_crime_rate_2005 = crimes_pt1_violent_2005 / crime_rate_pop_2005;
		violent_crime_rate_2006 = crimes_pt1_violent_2006 / crime_rate_pop_2006;
		violent_crime_rate_2007 = crimes_pt1_violent_2007 / crime_rate_pop_2007;
		violent_crime_rate_2008 = crimes_pt1_violent_2008 / crime_rate_pop_2008;
		violent_crime_rate_2009 = crimes_pt1_violent_2009 / crime_rate_pop_2009;
		violent_crime_rate_2010 = crimes_pt1_violent_2010 / crime_rate_pop_2010;
		violent_crime_rate_2011 = crimes_pt1_violent_2011 / crime_rate_pop_2011;
		violent_crime_rate_2012 = crimes_pt1_violent_2012 / crime_rate_pop_2012;
		violent_crime_rate_2013 = crimes_pt1_violent_2013 / crime_rate_pop_2013;
		violent_crime_rate_2014 = crimes_pt1_violent_2014 / crime_rate_pop_2014;
		violent_crime_rate_2015 = crimes_pt1_violent_2015 / crime_rate_pop_2015;
		violent_crime_rate_2016 = crimes_pt1_violent_2016 / crime_rate_pop_2016;

run;

proc export data=compile_dcpni_sum_final_&geosuf (where=(&geo=&subgeo))
	outfile="D:\DCData\Libraries\DCPNI\data\dcpnitabs_&ngbhd..csv"
	dbms=csv replace;
	run;


%mend Compile_dcpni_data;


%Compile_dcpni_data (geo2010, tr10, "11001009601", kenilworth);
%Compile_dcpni_data (geo2010, tr10, "11001009602", parkside);
%Compile_dcpni_data (geo2010, tr10, "11001009601", "11001009602", kenilworthparkside);
%Compile_dcpni_data (geo2010, tr10, "11001009907", benningterrace);
%Compile_dcpni_data (geo2010, tr10, "11001007804", lincolnheights);
%Compile_dcpni_data (ward2012, wd12, "6", ward6);
%Compile_dcpni_data (ward2012, wd12, "7", ward7);
%Compile_dcpni_data (ward2012, wd12, "8", ward8);
%Compile_dcpni_data (city, city, "1", city);






