@implementation Vr3QrKl7Yn9l4CTz

- (Vr3QrKl7Yn9l4CTz)init
{
  Vr3QrKl7Yn9l4CTz *v2;
  uint64_t v3;
  PJXBDBF1h0EU80dy *cacheManager;
  uint64_t v5;
  ASCoreDataManager *coreDataManager;
  uint64_t v7;
  _TtC3asd21PrecomputationManager *precomputationManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)Vr3QrKl7Yn9l4CTz;
  v2 = -[Vr3QrKl7Yn9l4CTz init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[PJXBDBF1h0EU80dy sharedInstance](PJXBDBF1h0EU80dy, "sharedInstance"));
    cacheManager = v2->_cacheManager;
    v2->_cacheManager = (PJXBDBF1h0EU80dy *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[ASCoreDataManager sharedInstance](ASCoreDataManager, "sharedInstance"));
    coreDataManager = v2->_coreDataManager;
    v2->_coreDataManager = (ASCoreDataManager *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[PrecomputationManager shared](_TtC3asd21PrecomputationManager, "shared"));
    precomputationManager = v2->_precomputationManager;
    v2->_precomputationManager = (_TtC3asd21PrecomputationManager *)v7;

  }
  return v2;
}

- (Vr3QrKl7Yn9l4CTz)initWithfOZWnqN9bY6jwOMf:(id)a3
{
  id v5;
  Vr3QrKl7Yn9l4CTz *v6;
  Vr3QrKl7Yn9l4CTz *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Vr3QrKl7Yn9l4CTz;
  v6 = -[Vr3QrKl7Yn9l4CTz init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cacheManager, a3);

  return v7;
}

- (void)sFFfMcUAtN14Bjc5
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeAllUserData", v4, 2u);
  }
  -[Vr3QrKl7Yn9l4CTz y6doGzfhnVRCi9Iy](self, "y6doGzfhnVRCi9Iy");
  -[Vr3QrKl7Yn9l4CTz m2fzkz0hfx3YgwiD](self, "m2fzkz0hfx3YgwiD");
  -[Vr3QrKl7Yn9l4CTz hiMi2bftgysHNCmu](self, "hiMi2bftgysHNCmu");
  -[Vr3QrKl7Yn9l4CTz p3IhAuuUciVQl4AK](self, "p3IhAuuUciVQl4AK");
  -[Vr3QrKl7Yn9l4CTz qvdJFx0260C4oDQI](self, "qvdJFx0260C4oDQI");
}

- (void)qvdJFx0260C4oDQI
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[Vr3QrKl7Yn9l4CTz cacheManager](self, "cacheManager"));
  v2 = objc_msgSend(v3, "y5rP3YRqGjztRrd0:", 0);

}

- (void)gCEWuNTdkAWg8Jj5
{
  -[Vr3QrKl7Yn9l4CTz m2fzkz0hfx3YgwiD](self, "m2fzkz0hfx3YgwiD");
  -[Vr3QrKl7Yn9l4CTz qvdJFx0260C4oDQI](self, "qvdJFx0260C4oDQI");
  -[Vr3QrKl7Yn9l4CTz jzyh7hNN2V5AZJR1](self, "jzyh7hNN2V5AZJR1");
}

- (void)jzyh7hNN2V5AZJR1
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Vr3QrKl7Yn9l4CTz cacheManager](self, "cacheManager"));
  v5 = 0;
  objc_msgSend(v2, "ax7Szgk7yfiKNgSDError:", &v5);
  v3 = v5;

  if (v3)
  {
    v4 = (void *)qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D6F3C(v4);

  }
}

- (void)y6doGzfhnVRCi9Iy
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeBindings", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Vr3QrKl7Yn9l4CTz cacheManager](self, "cacheManager"));
  objc_msgSend(v4, "removeAllBindings");

}

- (void)m2fzkz0hfx3YgwiD
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint8_t buf[16];

  v3 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeDFCs", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Vr3QrKl7Yn9l4CTz cacheManager](self, "cacheManager"));
  v7 = 0;
  objc_msgSend(v4, "nYOW3DfIUVSEf2Hm:rTZQrPNUbDSIifrh:", &off_1004F5050, &v7);
  v5 = v7;

  if (v5)
  {
    v6 = (void *)qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D6F3C(v6);

  }
  -[PrecomputationManager notifyCachesWereRemovedWithCompletionHandler:](self->_precomputationManager, "notifyCachesWereRemovedWithCompletionHandler:", &stru_1004CEA78);
}

- (void)ppirDXSrO0poQaQJ
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[Vr3QrKl7Yn9l4CTz cacheManager](self, "cacheManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ASDConfigurationManager shared](_TtC3asd23ASDConfigurationManager, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "payloadWorkflowTTLs"));
  objc_msgSend(v4, "vG2DGmxZUkQniiFzWithTTLDict:completion:", v3, &stru_1004CEAB8);

}

- (void)zs3Lq7W446m0cZJL
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[8];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Vr3QrKl7Yn9l4CTz coreDataManager](self, "coreDataManager"));
  v6 = 0;
  objc_msgSend(v2, "mILKmibfRWMwFVWD:iZGmRj7VI4MJ9lO1:AndError:", CFSTR("DB_R115061196"), 0, &v6);
  v3 = v6;

  v4 = qword_1005185D0;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D703C(v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[ASCleanupManager] JSON Bags purged successfully.", v5, 2u);
  }

}

- (void)p3IhAuuUciVQl4AK
{
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t v6[16];

  v3 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeG", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Vr3QrKl7Yn9l4CTz cacheManager](self, "cacheManager"));
  v5 = objc_msgSend(v4, "removeAllGeocodings");

}

- (void)hiMi2bftgysHNCmu
{
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t v6[16];

  v3 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeR", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Vr3QrKl7Yn9l4CTz cacheManager](self, "cacheManager"));
  v5 = objc_msgSend(v4, "removeRavioli");

}

- (PJXBDBF1h0EU80dy)cacheManager
{
  return self->_cacheManager;
}

- (ASCoreDataManager)coreDataManager
{
  return self->_coreDataManager;
}

- (_TtC3asd21PrecomputationManager)precomputationManager
{
  return self->_precomputationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomputationManager, 0);
  objc_storeStrong((id *)&self->_coreDataManager, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
}

@end
