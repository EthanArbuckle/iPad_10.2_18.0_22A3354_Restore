@implementation PPMockRTLocationOfInterest

- (PPMockRTMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)visits
{
  return self->_visits;
}

- (void)setVisits:(id)a3
{
  objc_storeStrong((id *)&self->_visits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

+ (id)mockLocationOfInterestWithSubThoroughfare:(id)a3 thoroughfare:(id)a4 subLocality:(id)a5 locality:(id)a6 administrativeArea:(id)a7 administrativeAreaCode:(id)a8 postalCode:(id)a9 country:(id)a10 countryCode:(id)a11 longitude:(double)a12 latitude:(double)a13 visits:(id)a14
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;

  v36 = a14;
  v35 = a11;
  v22 = a10;
  v23 = a9;
  v24 = a8;
  v25 = a7;
  v26 = a6;
  v27 = a5;
  v28 = a4;
  v29 = a3;
  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setSubThoroughfare:", v29);

  objc_msgSend(v30, "setThoroughfare:", v28);
  objc_msgSend(v30, "setSubLocality:", v27);

  objc_msgSend(v30, "setLocality:", v26);
  objc_msgSend(v30, "setAdministrativeArea:", v25);

  objc_msgSend(v30, "setAdministrativeAreaCode:", v24);
  objc_msgSend(v30, "setPostalCode:", v23);

  objc_msgSend(v30, "setCountry:", v22);
  objc_msgSend(v30, "setCountryCode:", v35);

  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setLatitude:", a13);
  objc_msgSend(v31, "setLongitude:", a12);
  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "setAddress:", v30);
  objc_msgSend(v32, "setLocation:", v31);
  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setMapItem:", v32);
  objc_msgSend(v33, "setVisits:", v36);

  return v33;
}

@end
