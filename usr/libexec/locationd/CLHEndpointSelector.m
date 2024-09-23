@implementation CLHEndpointSelector

- (CLHEndpointSelector)init
{
  CLHEndpointSelector *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLHEndpointSelector;
  v2 = -[CLHEndpointSelector init](&v4, "init");
  if (v2)
  {
    v2->_appEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.apple.com/au"));
    v2->_batchEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.apple.com/pds/pd"));
    v2->_cellWifiEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.apple.com/hcy/pbcwloc"));
    v2->_indoorEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.apple.com/incs"));
    v2->_passEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.apple.com/pbu"));
    v2->_poiEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.ls.apple.com/hvr/aploc"));
    v2->_pressureEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.apple.com/psr"));
    v2->_traceEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.apple.com/hvr/trc"));
    v2->_altimeterEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-carry.ls.apple.com/hvr/alt"));
    v2->_ionosphereEndpoint = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://gsp10-ssl.apple.com/hvr/ion"));
    -[CLHEndpointSelector refresh](v2, "refresh");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHEndpointSelector;
  -[CLHEndpointSelector dealloc](&v3, "dealloc");
}

- (void)refresh
{
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_appEndpoint, CFSTR("CLAppleCollectionServer_App"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_batchEndpoint, CFSTR("CLAppleCollectionServer_Tracks"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_cellWifiEndpoint, CFSTR("CLAppleCollectionServer_CellWifi"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_indoorEndpoint, CFSTR("CLAppleCollectionServer_Indoor"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_passEndpoint, CFSTR("CLAppleCollectionServer_Pass"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_poiEndpoint, CFSTR("CLAppleCollectionServer_Poi"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_pressureEndpoint, CFSTR("CLAppleCollectionServer_Pressure"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_traceEndpoint, CFSTR("CLAppleCollectionServer_Trace"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_altimeterEndpoint, CFSTR("CLAppleCollectionServer_Altimeter"));
  -[CLHEndpointSelector updateEndpoint:withKey:](self, "updateEndpoint:withKey:", &self->_ionosphereEndpoint, CFSTR("CLAppleCollectionServer_Ionosphere"));
}

- (void)updateEndpoint:(id *)a3 withKey:(id)a4
{
  _BOOL4 v6;
  _BOOL4 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::string *p_p;
  id v12;
  id v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  std::string __p;

  memset(&__p, 0, sizeof(__p));
  sub_1001E4804(&v14);
  v6 = sub_1000BD5F0(v14, (uint64_t)a4, &__p);
  v7 = v6;
  v8 = v15;
  if (!v15)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (v7)
      goto LABEL_6;
  }
  else
  {
LABEL_5:
    if (v6)
    {
LABEL_6:

      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      v12 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p));
      goto LABEL_13;
    }
  }
  v13 = objc_msgSend(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"), "defaultForKey:defaultValue:", a4, 0);
  if (!v13)
    goto LABEL_14;

  v12 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v13);
LABEL_13:
  *a3 = v12;
LABEL_14:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (id)jsonObject
{
  _QWORD v4[10];
  _QWORD v5[10];

  v4[0] = CFSTR("CLAppleCollectionServer_App");
  v5[0] = -[NSURL absoluteString](self->_appEndpoint, "absoluteString");
  v4[1] = CFSTR("CLAppleCollectionServer_Tracks");
  v5[1] = -[NSURL absoluteString](self->_batchEndpoint, "absoluteString");
  v4[2] = CFSTR("CLAppleCollectionServer_CellWifi");
  v5[2] = -[NSURL absoluteString](self->_cellWifiEndpoint, "absoluteString");
  v4[3] = CFSTR("CLAppleCollectionServer_Indoor");
  v5[3] = -[NSURL absoluteString](self->_indoorEndpoint, "absoluteString");
  v4[4] = CFSTR("CLAppleCollectionServer_Pass");
  v5[4] = -[NSURL absoluteString](self->_passEndpoint, "absoluteString");
  v4[5] = CFSTR("CLAppleCollectionServer_Poi");
  v5[5] = -[NSURL absoluteString](self->_poiEndpoint, "absoluteString");
  v4[6] = CFSTR("CLAppleCollectionServer_Pressure");
  v5[6] = -[NSURL absoluteString](self->_pressureEndpoint, "absoluteString");
  v4[7] = CFSTR("CLAppleCollectionServer_Trace");
  v5[7] = -[NSURL absoluteString](self->_traceEndpoint, "absoluteString");
  v4[8] = CFSTR("CLAppleCollectionServer_Altimeter");
  v5[8] = -[NSURL absoluteString](self->_altimeterEndpoint, "absoluteString");
  v4[9] = CFSTR("CLAppleCollectionServer_Ionosphere");
  v5[9] = -[NSURL absoluteString](self->_ionosphereEndpoint, "absoluteString");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 10);
}

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[CLHEndpointSelector jsonObject](self, "jsonObject"), 2, 0), 4);
}

- (NSURL)appEndpoint
{
  return self->_appEndpoint;
}

- (NSURL)batchEndpoint
{
  return self->_batchEndpoint;
}

- (NSURL)cellWifiEndpoint
{
  return self->_cellWifiEndpoint;
}

- (NSURL)indoorEndpoint
{
  return self->_indoorEndpoint;
}

- (NSURL)passEndpoint
{
  return self->_passEndpoint;
}

- (NSURL)poiEndpoint
{
  return self->_poiEndpoint;
}

- (NSURL)pressureEndpoint
{
  return self->_pressureEndpoint;
}

- (NSURL)traceEndpoint
{
  return self->_traceEndpoint;
}

- (NSURL)altimeterEndpoint
{
  return self->_altimeterEndpoint;
}

- (NSURL)ionosphereEndpoint
{
  return self->_ionosphereEndpoint;
}

@end
