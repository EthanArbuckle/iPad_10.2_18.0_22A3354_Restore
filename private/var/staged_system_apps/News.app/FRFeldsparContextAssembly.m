@implementation FRFeldsparContextAssembly

- (FRFeldsparContextAssembly)initWithContext:(id)a3 privateDataUpdateCoordinator:(id)a4
{
  id v7;
  id v8;
  FRFeldsparContextAssembly *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FRFeldsparContextAssembly;
  v9 = -[FRFeldsparContextAssembly init](&v11, "init");
  if (v9)
  {
    if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100080564();
      if (!v8)
      {
LABEL_5:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10008049C();
      }
    }
    else if (!v8)
    {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&v9->_feldsparContext, a3);
    objc_storeStrong((id *)&v9->_privateDataUpdateCoordinator, a4);
  }

  return v9;
}

- (void)loadInRegistry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  FRFeldsparContextAssembly *v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[4];
  id v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeldsparContextAssembly feldsparContext](self, "feldsparContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_1000187C8;
  v110[3] = &unk_1000DD4F0;
  v7 = v5;
  v111 = v7;
  v8 = objc_msgSend(v6, "registerProtocol:factory:", &OBJC_PROTOCOL___FRFeldsparContext, v110);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_1000187C0;
  v108[3] = &unk_1000DD518;
  v10 = v7;
  v109 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "registerProtocol:factory:", &OBJC_PROTOCOL___FCFavoritesPersonalizer, v108));
  v12 = objc_msgSend(v11, "inScope:", 2);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_10005B97C;
  v106[3] = &unk_1000DD540;
  v14 = v10;
  v107 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "registerProtocol:name:factory:", &OBJC_PROTOCOL___FCAutoFavoritesPreparer, CFSTR("legacy"), v106));
  v16 = objc_msgSend(v15, "inScope:", 2);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_1000187B8;
  v104[3] = &unk_1000DD568;
  v18 = v14;
  v105 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "registerProtocol:factory:", &OBJC_PROTOCOL___FCPersonalizationAllowlistProvider, v104));
  v20 = objc_msgSend(v19, "inScope:", 2);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_10005B984;
  v102[3] = &unk_1000DD590;
  v22 = v18;
  v103 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "registerProtocol:factory:", &OBJC_PROTOCOL___FCPersonalizationBundleIDMappingProvider, v102));
  v24 = objc_msgSend(v23, "inScope:", 2);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_10005B98C;
  v100[3] = &unk_1000DD5B8;
  v26 = v22;
  v101 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "registerProtocol:factory:", &OBJC_PROTOCOL___FCPersonalizationURLMappingProvider, v100));
  v28 = objc_msgSend(v27, "inScope:", 2);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeldsparContextAssembly feldsparContext](self, "feldsparContext"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cloudContext"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "notificationController"));
  v32 = objc_msgSend(v31, "shouldUseNewsUINotificationHandling");

  if ((v32 & 1) == 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_1000187B0;
    v98[3] = &unk_1000DD5E0;
    v99 = v26;
    v34 = objc_msgSend(v33, "registerProtocol:factory:", &OBJC_PROTOCOL___TSNotificationManagerType, v98);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v37 = objc_opt_class(FRAppActivityMonitor, v36);
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_1000186A4;
  v96[3] = &unk_1000DD608;
  v38 = v26;
  v97 = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "registerClass:factory:", v37, v96));
  v40 = objc_msgSend(v39, "inScope:", 3);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_1000187A8;
  v94[3] = &unk_1000DD630;
  v42 = v38;
  v95 = v42;
  v43 = objc_msgSend(v41, "registerProtocol:factory:", &OBJC_PROTOCOL___TSAppMonitorManagerType, v94);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_10005B994;
  v92[3] = &unk_1000DD658;
  v45 = v42;
  v93 = v45;
  v46 = objc_msgSend(v44, "registerProtocol:factory:", &OBJC_PROTOCOL___NUSpotlightManager, v92);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v49 = objc_opt_class(FRArticleContentPool, v48);
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_10000D8E0;
  v90[3] = &unk_1000DD680;
  v50 = v45;
  v91 = v50;
  v51 = objc_msgSend(v47, "registerClass:factory:", v49, v90);

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v54 = objc_opt_class(FRAnalyticsController, v53);
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_1000078B8;
  v88[3] = &unk_1000DD6A8;
  v55 = v50;
  v89 = v55;
  v56 = objc_msgSend(v52, "registerClass:factory:", v54, v88);

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_10000AFE4;
  v86[3] = &unk_1000DD6D0;
  v58 = v55;
  v87 = v58;
  v59 = objc_msgSend(v57, "registerProtocol:factory:", &OBJC_PROTOCOL___NYSessionAccessing, v86);

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_100007B5C;
  v84[3] = &unk_1000DD6F8;
  v85 = v58;
  v61 = v58;
  v62 = objc_msgSend(v60, "registerProtocol:factory:", &OBJC_PROTOCOL___TSPrefetchedArticlesServiceType, v84);

  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "cloudContext"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v66 = objc_opt_class(FRTodayAgent, v65);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_10005B99C;
  v82[3] = &unk_1000DD720;
  v67 = v63;
  v83 = v67;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "registerClass:factory:", v66, v82));
  v69 = objc_msgSend(v68, "inScope:", 2);

  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v71 = objc_msgSend(v70, "registerProtocol:factory:", &OBJC_PROTOCOL___FRLimitedPersonalizationDataGeneratorType, &stru_1000DD760);

  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v74 = objc_opt_class(FRBackgroundFetchManager, v73);
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_10005BB70;
  v79[3] = &unk_1000DD788;
  v80 = v67;
  v81 = self;
  v75 = v67;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "registerClass:factory:", v74, v79));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "inScope:", 2));
  v78 = objc_msgSend(v77, "withConfiguration:", &stru_1000DD7C8);

}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator
{
  return self->_privateDataUpdateCoordinator;
}

- (void)setPrivateDataUpdateCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, 0);
  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end
