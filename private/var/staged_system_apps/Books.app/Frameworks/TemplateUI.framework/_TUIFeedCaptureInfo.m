@implementation _TUIFeedCaptureInfo

- (void)dealloc
{
  objc_super v3;

  -[NSURL stopAccessingSecurityScopedResource](self->_url, "stopAccessingSecurityScopedResource");
  v3.receiver = self;
  v3.super_class = (Class)_TUIFeedCaptureInfo;
  -[_TUIFeedCaptureInfo dealloc](&v3, "dealloc");
}

- (_TUIFeedCaptureInfo)initWithURL:(id)a3 packagesURL:(id)a4
{
  NSURL *v6;
  id v7;
  _TUIFeedCaptureInfo *v8;
  _TUIFeedCaptureInfo *v9;
  NSURL *url;
  NSURL *v11;
  void **p_packagesURL;
  void *v13;
  void *v14;
  void *v15;
  NSURL *v16;
  TUIManager *v17;
  TUIManager *manager;
  TUIViewRegistry *v19;
  TUIElementRegistry *v20;
  TUIFilterRegistry *v21;
  TUIDynamicRegistry *v22;
  TUIResourceRegistry *v23;
  TUIResourceLoader *v24;
  TUIImageResourceCache *v25;
  void *v26;
  void *v27;
  void *v28;
  TUIImageResourceCache *v29;
  TUITemplateFactory *v30;
  void *v31;
  TUITemplateFactory *v32;
  TUITemplateFactory *factory;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSString *title;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *i;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  NSMutableArray *v73;
  id v74;
  _TUIFeedCaptureInfo *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  void *j;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  uint64_t v91;
  void *k;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  TUIFeedContent *content;
  NSArray *v98;
  NSArray *sectionLoaders;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  uint64_t v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  TUIFeedEntry *waitForLoadEntry;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  void *v117;
  void *v118;
  NSMutableArray *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  NSURL *v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD v137[4];
  _TUIFeedCaptureInfo *v138;
  id v139;
  NSMutableArray *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  char v145;
  objc_super v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];

  v6 = (NSURL *)a3;
  v7 = a4;
  v146.receiver = self;
  v146.super_class = (Class)_TUIFeedCaptureInfo;
  v8 = -[_TUIFeedCaptureInfo init](&v146, "init");
  v9 = v8;
  if (v8)
  {
    url = v8->_url;
    v8->_url = v6;
    v11 = v6;

    p_packagesURL = (void **)&v9->_packagesURL;
    objc_storeStrong((id *)&v9->_packagesURL, a4);
    -[NSURL startAccessingSecurityScopedResource](v9->_url, "startAccessingSecurityScopedResource");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v11, 1));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByStandardizingPath"));
    objc_msgSend(v13, "setPath:", v15);

    v16 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
    v17 = objc_alloc_init(TUIManager);
    manager = v9->_manager;
    v9->_manager = v17;

    v19 = objc_alloc_init(TUIViewRegistry);
    -[TUIManager setViewRegistry:](v9->_manager, "setViewRegistry:", v19);

    v20 = objc_alloc_init(TUIElementRegistry);
    -[TUIManager setElementRegistry:](v9->_manager, "setElementRegistry:", v20);

    v21 = objc_alloc_init(TUIFilterRegistry);
    -[TUIManager setFilterRegistry:](v9->_manager, "setFilterRegistry:", v21);

    v22 = objc_alloc_init(TUIDynamicRegistry);
    -[TUIManager setDynamicRegistry:](v9->_manager, "setDynamicRegistry:", v22);

    v23 = objc_alloc_init(TUIResourceRegistry);
    -[TUIManager setResourceRegistry:](v9->_manager, "setResourceRegistry:", v23);

    v24 = -[TUIResourceLoader initWithProtocolClasses:]([TUIResourceLoader alloc], "initWithProtocolClasses:", 0);
    -[TUIManager setResourceLoader:](v9->_manager, "setResourceLoader:", v24);

    v25 = [TUIImageResourceCache alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager resourceLoader](v9->_manager, "resourceLoader"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager filterRegistry](v9->_manager, "filterRegistry"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = -[TUIImageResourceCache initWithLoader:filters:customImageBundle:](v25, "initWithLoader:filters:customImageBundle:", v26, v27, v28);
    -[TUIManager setImageResourceCache:](v9->_manager, "setImageResourceCache:", v29);

    v30 = [TUITemplateFactory alloc];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager elementRegistry](v9->_manager, "elementRegistry"));
    v32 = -[TUITemplateFactory initWithRegistry:](v30, "initWithRegistry:", v31);
    factory = v9->_factory;
    v9->_factory = v32;

    v126 = objc_alloc_init((Class)BCULayerRenderer);
    v34 = objc_msgSend(objc_alloc((Class)BCUCoverEffects), "initWithRenderer:", v126);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager filterRegistry](v9->_manager, "filterRegistry"));
    v125 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "templateImageFilters"));
    objc_msgSend(v35, "registerImageFilters:", v36);

    v37 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v16, "URLByAppendingPathComponent:", CFSTR("feed.json")));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v37));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v38, 0, 0));

    v41 = objc_opt_class(NSString, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("title")));
    v43 = TUIDynamicCast(v41, v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    title = v9->_title;
    v9->_title = (NSString *)v44;

    v47 = objc_opt_class(NSString, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("packages")));
    v49 = TUIDynamicCast(v47, v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);

    v122 = (void *)v50;
    if (v50)
    {
      v51 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v50, v37));

      v7 = (id)v51;
    }
    v124 = (void *)v37;
    if (!v7)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:isDirectory:](v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("packages"), 1));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "URLByResolvingSymlinksInPath"));

    }
    v145 = 0;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v55 = objc_msgSend(v53, "fileExistsAtPath:isDirectory:", v54, &v145);

    if ((v55 & 1) == 0)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("~/Library/FeedViewer/Packages"), "stringByExpandingTildeInPath"));
      v57 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v56));

      v7 = (id)v57;
    }
    v58 = objc_msgSend(v7, "copy");
    v59 = *p_packagesURL;
    *p_packagesURL = v58;

    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v127 = v7;
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 1, 0));

    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v142;
      do
      {
        for (i = 0; i != v63; i = (char *)i + 1)
        {
          if (*(_QWORD *)v142 != v64)
            objc_enumerationMutation(v61);
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[TUITemplateBundle bundleWithURL:requireInfoPlist:](TUITemplateBundle, "bundleWithURL:requireInfoPlist:", *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)i), 0));
          v67 = v66;
          if (v66)
            objc_msgSend(v66, "registerPackagesWithFactory:", v9->_factory);

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
      }
      while (v63);
    }

    v69 = objc_opt_class(NSArray, v68);
    v123 = v39;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("sections")));
    v71 = TUIDynamicCast(v69, v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);

    v73 = objc_opt_new(NSMutableArray);
    v74 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v72, "count"));
    v137[0] = _NSConcreteStackBlock;
    v137[1] = 3221225472;
    v137[2] = sub_71E64;
    v137[3] = &unk_23F3F0;
    v75 = v9;
    v138 = v75;
    v120 = v74;
    v139 = v120;
    v119 = v73;
    v140 = v119;
    v121 = v72;
    objc_msgSend(v72, "enumerateObjectsUsingBlock:", v137);
    v128 = v16;
    v76 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:isDirectory:](v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("dynamic-state"), 1));
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v118 = (void *)v76;
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v76, 0, 1, 0));

    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v133, v148, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v134;
      do
      {
        for (j = 0; j != v80; j = (char *)j + 1)
        {
          if (*(_QWORD *)v134 != v81)
            objc_enumerationMutation(v78);
          v83 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIFeedCaptureDynamicStateProvider imageResourceProviderWithURL:](_TUIFeedCaptureDynamicStateProvider, "imageResourceProviderWithURL:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)j)));
          if (v83)
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager dynamicRegistry](v9->_manager, "dynamicRegistry"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "kind"));
            objc_msgSend(v84, "registerStateProvider:forKind:", v83, v85);

          }
        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v133, v148, 16);
      }
      while (v80);
    }

    v86 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:isDirectory:](v128, "URLByAppendingPathComponent:isDirectory:", CFSTR("images"), 1));
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v117 = (void *)v86;
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v86, 0, 1, 0));

    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v130;
      do
      {
        for (k = 0; k != v90; k = (char *)k + 1)
        {
          if (*(_QWORD *)v130 != v91)
            objc_enumerationMutation(v88);
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIFeedCaptureImageResourceProvider imageResourceProviderWithURL:](_TUIFeedCaptureImageResourceProvider, "imageResourceProviderWithURL:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)k)));
          if (v93)
          {
            v94 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager resourceRegistry](v9->_manager, "resourceRegistry"));
            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "kind"));
            objc_msgSend(v94, "registerImageProvider:forKind:", v93, v95);

          }
        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
      }
      while (v90);
    }

    v96 = objc_claimAutoreleasedReturnValue(+[TUIFeedContent feedContentWithEntries:stackName:](TUIFeedContent, "feedContentWithEntries:stackName:", v120, 0));
    content = v75->_content;
    v75->_content = (TUIFeedContent *)v96;

    v98 = (NSArray *)-[NSMutableArray copy](v119, "copy");
    sectionLoaders = v75->_sectionLoaders;
    v75->_sectionLoaders = v98;

    v101 = objc_opt_class(NSNumber, v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("wait-for-section")));
    v103 = TUIDynamicCast(v101, v102);
    v104 = (void *)objc_claimAutoreleasedReturnValue(v103);

    if (v104)
    {
      v106 = objc_msgSend(v104, "unsignedIntegerValue");
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](v75->_content, "entries"));
      v108 = objc_msgSend(v107, "count");

      if (v106 < v108)
      {
        v109 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](v75->_content, "entries"));
        v110 = objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "objectAtIndexedSubscript:", objc_msgSend(v104, "unsignedIntegerValue")));
        waitForLoadEntry = v75->_waitForLoadEntry;
        v75->_waitForLoadEntry = (TUIFeedEntry *)v110;

      }
    }
    v112 = objc_opt_class(NSNumber, v105);
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("suspend-updates-until-exceeding-height")));
    v114 = TUIDynamicCast(v112, v113);
    v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
    v75->_suspendUpdatesUntilExceedingHeight = objc_msgSend(v115, "BOOLValue");

    v7 = v127;
    v6 = v128;
  }

  return v9;
}

- (void)updateSectionsFromJSON:(id)a3
{
  NSURL *url;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  url = self->_url;
  v5 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](url, "URLByAppendingPathComponent:", CFSTR("feed.json")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v14));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, 0));

  v9 = objc_opt_class(NSArray, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sections")));
  v11 = TUIDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_72110;
  v15[3] = &unk_23F418;
  v15[4] = self;
  v16 = v12;
  v13 = v12;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v15);

}

- (TUIManager)manager
{
  return self->_manager;
}

- (TUITemplateFactory)factory
{
  return self->_factory;
}

- (NSString)title
{
  return self->_title;
}

- (TUIFeedContent)content
{
  return self->_content;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)packagesURL
{
  return self->_packagesURL;
}

- (TUIFeedEntry)waitForLoadEntry
{
  return self->_waitForLoadEntry;
}

- (BOOL)suspendUpdatesUntilExceedingHeight
{
  return self->_suspendUpdatesUntilExceedingHeight;
}

- (NSArray)sectionLoaders
{
  return self->_sectionLoaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionLoaders, 0);
  objc_storeStrong((id *)&self->_waitForLoadEntry, 0);
  objc_storeStrong((id *)&self->_packagesURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
