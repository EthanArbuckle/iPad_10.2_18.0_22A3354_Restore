@implementation BKDisplayController

- (unsigned)taskPortForContextID:(unsigned int)a3 displayUUID:(id)a4
{
  return sub_1000358C4(*(uint64_t *)&a3);
}

- (void)applySceneHostSettingsToHostingChain:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *lock_sceneHostSettingsByContextID;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  os_unfair_lock_t lock;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10);
        lock_sceneHostSettingsByContextID = self->_lock_sceneHostSettingsByContextID;
        if (v11)
          v13 = *(unsigned int *)(v11 + 8);
        else
          v13 = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13, lock));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](lock_sceneHostSettingsByContextID, "objectForKeyedSubscript:", v14));

        if (v15)
        {
          v16 = v15;

          v8 = v16;
        }
        if (v11)
          objc_storeStrong((id *)(v11 + 16), v8);

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v7 = v17;
    }
    while (v17);
  }
  else
  {
    v8 = 0;
  }

  os_unfair_lock_unlock(lock);
}

- (CGPoint)convertReferenceLocation:(CGPoint)a3 toCAScreenLocationForDisplayUUID:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  sub_10000F7A0(a4);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertCAScreenLocation:(CGPoint)a3 toContextID:(unsigned int)a4 displayUUID:(id)a5
{
  double v5;
  double v6;
  CGPoint result;

  if (self)
  {
    v5 = sub_10000F560(*(uint64_t *)&a4, a5, a3.x, a3.y);
  }
  else
  {
    v6 = 0.0;
    v5 = 0.0;
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setSceneHostSettings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lock_sceneHostSettingsByContextID;
  int v10;
  id v11;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = BKLogTouchEvents(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "setSceneHostSettings: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  lock_sceneHostSettingsByContextID = self->_lock_sceneHostSettingsByContextID;
  self->_lock_sceneHostSettingsByContextID = v8;

  os_unfair_lock_unlock(&self->_lock);
}

+ (BKDisplayController)sharedInstance
{
  if (qword_100117220 != -1)
    dispatch_once(&qword_100117220, &stru_1000E98C0);
  return (BKDisplayController *)(id)qword_100117228;
}

- (BOOL)contextIDAtCAScreenLocation:(CGPoint)a3 displayUUID:(id)a4 options:(id)a5 securityAnalysis:(id *)a6 results:(id *)a7
{
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BKDisplayController *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  unsigned __int8 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  float v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  BKDisplayController *v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  float v95;
  float v96;
  float v97;
  BOOL v98;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint8_t buf[16];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;

  y = a3.y;
  x = a3.x;
  v13 = a4;
  *(_OWORD *)&a7->var0 = 0u;
  *(_OWORD *)&a7->var3 = 0u;
  *(_OWORD *)&a7->var5.m11 = 0u;
  *(_OWORD *)&a7->var5.m13 = 0u;
  *(_OWORD *)&a7->var5.m21 = 0u;
  *(_OWORD *)&a7->var5.m23 = 0u;
  *(_OWORD *)&a7->var5.m31 = 0u;
  *(_OWORD *)&a7->var5.m33 = 0u;
  *(_OWORD *)&a7->var5.m41 = 0u;
  *(_OWORD *)&a7->var5.m43 = 0u;
  *(_OWORD *)&a7->var6.m11 = 0u;
  *(_OWORD *)&a7->var6.m13 = 0u;
  *(_OWORD *)&a7->var6.m21 = 0u;
  *(_OWORD *)&a7->var6.m23 = 0u;
  *(_OWORD *)&a7->var6.m31 = 0u;
  *(_OWORD *)&a7->var6.m33 = 0u;
  *(_OWORD *)&a7->var6.m41 = 0u;
  *(_OWORD *)&a7->var6.m43 = 0u;
  *(_OWORD *)&a7->var7 = 0u;
  if (a6)
    *a6 = 0;
  v14 = a5;
  v15 = v13;
  if (self)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](CAWindowServer, "serverIfRunning"));
    v17 = v16;
    if (v15)
    {
      v18 = (BKDisplayController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayWithUniqueId:", v15));
    }
    else
    {
      v19 = sub_10000F6DC();
      v18 = (BKDisplayController *)objc_claimAutoreleasedReturnValue(v19);
    }
    self = v18;

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayController hitTestAtPosition:options:](self, "hitTestAtPosition:options:", v14, x, y));

  if (!v20)
    goto LABEL_71;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCAWindowServerHitTestContextId));
  a7->var0 = objc_msgSend(v21, "unsignedIntValue");

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCAWindowServerHitTestSlotId));
  a7->var1 = objc_msgSend(v22, "unsignedIntValue");

  a7->var2 = sub_1000358C4(a7->var0);
  if (a6)
  {
    v103 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKSWindowServerHitTestSecurityAnalysis securityAnalysisFromCAHitTestDictionary:errorString:](BKSWindowServerHitTestSecurityAnalysis, "securityAnalysisFromCAHitTestDictionary:errorString:", v20, &v103));
    v24 = v103;
    v25 = v23;
    *a6 = v25;
    if (v24)
    {
      v26 = BKLogTouchEvents(v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (a7->var1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCAWindowServerHitTestDetectedOcclusion));
    v30 = objc_opt_class(NSNumber, v29);
    v31 = v28;
    v32 = v31;
    if (v30)
    {
      if ((objc_opt_isKindOfClass(v31, v30) & 1) != 0)
        v33 = v32;
      else
        v33 = 0;
    }
    else
    {
      v33 = 0;
    }
    v34 = v33;

    v35 = objc_msgSend(v34, "BOOLValue");
    a7->var7 = v35;
    a7->var3 = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCAWindowServerHitTestCumulativeOpacity));
    v38 = objc_opt_class(NSNumber, v37);
    v39 = v36;
    v40 = v39;
    if (v38)
    {
      if ((objc_opt_isKindOfClass(v39, v38) & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
    }
    else
    {
      v41 = 0;
    }
    v42 = v41;

    if (v42)
    {
      objc_msgSend(v42, "floatValue");
      a7->var4 = v43;
      a7->var3 |= 2uLL;
    }
    v102 = v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCAWindowServerHitTestCumulativeLayerTransform));
    v46 = objc_opt_class(NSValue, v45);
    v47 = v44;
    v48 = v47;
    if (v46)
    {
      if ((objc_opt_isKindOfClass(v47, v46) & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
    }
    else
    {
      v49 = 0;
    }
    v50 = v49;

    if (v50)
    {
      objc_msgSend(v50, "CATransform3DValue");
      v51 = v109;
      *(_OWORD *)&a7->var5.m31 = v108;
      *(_OWORD *)&a7->var5.m33 = v51;
      v52 = v111;
      *(_OWORD *)&a7->var5.m41 = v110;
      *(_OWORD *)&a7->var5.m43 = v52;
      v53 = v105;
      *(_OWORD *)&a7->var5.m11 = *(_OWORD *)buf;
      *(_OWORD *)&a7->var5.m13 = v53;
      v54 = v107;
      *(_OWORD *)&a7->var5.m21 = v106;
      *(_OWORD *)&a7->var5.m23 = v54;
      a7->var3 |= 0x10uLL;
    }
    v101 = v50;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCAWindowServerHitTestCumulativeContentsTransform));
    v57 = objc_opt_class(NSValue, v56);
    v58 = v55;
    v59 = v58;
    if (v57)
    {
      if ((objc_opt_isKindOfClass(v58, v57) & 1) != 0)
        v60 = v59;
      else
        v60 = 0;
    }
    else
    {
      v60 = 0;
    }
    v61 = v60;

    if (v61)
    {
      objc_msgSend(v61, "CATransform3DValue");
      v62 = v109;
      *(_OWORD *)&a7->var6.m31 = v108;
      *(_OWORD *)&a7->var6.m33 = v62;
      v63 = v111;
      *(_OWORD *)&a7->var6.m41 = v110;
      *(_OWORD *)&a7->var6.m43 = v63;
      v64 = v105;
      *(_OWORD *)&a7->var6.m11 = *(_OWORD *)buf;
      *(_OWORD *)&a7->var6.m13 = v64;
      v65 = v107;
      *(_OWORD *)&a7->var6.m21 = v106;
      *(_OWORD *)&a7->var6.m23 = v65;
      a7->var3 |= 0x20uLL;
    }
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("hitTestInsecureFiltered"), v61));
    v68 = objc_opt_class(NSNumber, v67);
    v69 = v66;
    v70 = v69;
    if (v68)
    {
      if ((objc_opt_isKindOfClass(v69, v68) & 1) != 0)
        v71 = v70;
      else
        v71 = 0;
    }
    else
    {
      v71 = 0;
    }
    v72 = v71;

    if (v72)
    {
      a7->var8 = objc_msgSend(v72, "BOOLValue");
      a7->var3 |= 4uLL;
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCAWindowServerHitTestLayerBackgroundAverage));
    v75 = objc_opt_class(NSNumber, v74);
    v76 = v73;
    v77 = v76;
    if (v75)
    {
      if ((objc_opt_isKindOfClass(v76, v75) & 1) != 0)
        v78 = v77;
      else
        v78 = 0;
    }
    else
    {
      v78 = 0;
    }
    v79 = v78;

    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCAWindowServerHitTestLayerBackgroundStandardDeviation));
    v82 = objc_opt_class(NSNumber, v81);
    v83 = v80;
    v84 = v83;
    v85 = self;
    if (v82)
    {
      if ((objc_opt_isKindOfClass(v83, v82) & 1) != 0)
        v86 = v84;
      else
        v86 = 0;
    }
    else
    {
      v86 = 0;
    }
    v87 = v86;

    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("hitTestBackgroundAverageContrastThreshold")));
    v90 = objc_opt_class(NSNumber, v89);
    v91 = v88;
    v92 = v91;
    if (v90)
    {
      if ((objc_opt_isKindOfClass(v91, v90) & 1) != 0)
        v93 = v92;
      else
        v93 = 0;
    }
    else
    {
      v93 = 0;
    }
    v94 = v93;

    if (v79 && v87 && v94)
    {
      objc_msgSend(v79, "floatValue");
      a7->var9 = v95;
      objc_msgSend(v87, "floatValue");
      a7->var10 = v96;
      objc_msgSend(v94, "floatValue");
      a7->var11 = v97;
      a7->var3 |= 8uLL;
    }

    self = v85;
  }
  if (a7->var0 && a7->var2 + 1 > 1)
  {
    v98 = 1;
  }
  else
  {
LABEL_71:
    v98 = 0;
    a7->var0 = 0;
  }

  return v98;
}

- (unsigned)hostContextIDForEmbeddedContextID:(unsigned int)a3 displayUUID:(id)a4
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](CAWindowServer, "serverIfRunning", *(_QWORD *)&a3, a4));
  LODWORD(v4) = objc_msgSend(v5, "contextIdHostingContextId:", v4);

  return v4;
}

- (BKDisplayController)init
{
  BKDisplayController *v2;
  BKDisplayController *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *lock_sceneHostSettingsByContextID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKDisplayController;
  v2 = -[BKDisplayController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lock_sceneHostSettingsByContextID = v3->_lock_sceneHostSettingsByContextID;
    v3->_lock_sceneHostSettingsByContextID = v4;

  }
  return v3;
}

- (BOOL)displayIsBlanked:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = sub_10000F5CC(a3, (uint64_t)"BKDisplayIsDisplayBlanked");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "isBlanked");

  return v5;
}

- (id)addDisplayBlankingObserver:(id)a3
{
  uint64_t v4;
  id v5;
  BSCompoundAssertion *observerAssertion;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:](BSCompoundAssertion, "assertionWithIdentifier:", CFSTR("backboardd.display-blanking")));
    v8 = self->_observerAssertion;
    self->_observerAssertion = v7;

    observerAssertion = self->_observerAssertion;
  }
  v9 = objc_msgSend((id)objc_opt_class(v5, v4), "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion acquireForReason:withContext:](observerAssertion, "acquireForReason:withContext:", v10, v5));

  return v11;
}

- (void)setSceneHostSettings:(id)a3 forContextID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = BKLogTouchEvents(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2114;
    v12 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setSceneHostSettingsForContextID:%X %{public}@", (uint8_t *)v10, 0x12u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_sceneHostSettingsByContextID, "setObject:forKeyedSubscript:", v6, v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeSceneHostSettingsForContextID:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];

  v3 = *(_QWORD *)&a3;
  v5 = BKLogTouchEvents(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "removeSceneHostSettingsForContextID:%X", (uint8_t *)v8, 8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_lock_sceneHostSettingsByContextID, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- ($F7CACAAF0F09BFB3533BE937C26B5F66)geometryForDisplayUUID:(SEL)a3
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  $F7CACAAF0F09BFB3533BE937C26B5F66 *result;
  id v10;

  v5 = a4;
  retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr->var3.origin = 0u;
  retstr->var3.size = 0u;
  v6 = v5;
  v10 = v6;
  if (!v6
    || (v7 = objc_msgSend(v6, "isEqualToString:", BKSDisplayUUIDMainKey), v10, v8 = v10, v7))
  {
    v8 = 0;
  }
  sub_10000F834(v8, retstr, &retstr->var0.height, &retstr->var1, &retstr->var2, (uint64_t)&retstr->var3);

  return result;
}

- ($446564691F179F0A09753BCCEB4D3730)transformLayerPropertiesForDisplay:(SEL)a3 displayInterfaceOrientation:(id)a4
{
  double b;
  double a;
  double c;
  double d;
  double ty;
  double tx;
  void *v14;
  $446564691F179F0A09753BCCEB4D3730 *result;
  float64x2_t v16;
  int8x16_t v17;
  CGAffineTransform *v18;
  float64x2_t v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform t1;
  CGAffineTransform v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  a = CGAffineTransformIdentity.a;
  b = CGAffineTransformIdentity.b;
  c = CGAffineTransformIdentity.c;
  d = CGAffineTransformIdentity.d;
  tx = CGAffineTransformIdentity.tx;
  ty = CGAffineTransformIdentity.ty;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "uniqueId"));
  -[BKDisplayController geometryForDisplayUUID:](self, "geometryForDisplayUUID:", v14);

  v16 = 0u;
  v17 = vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL);
  switch(a5)
  {
    case 4:
      v19 = (float64x2_t)v17;
      CGAffineTransformMakeRotation(&v20, -1.57079633);
      t1.a = CGAffineTransformIdentity.a;
      t1.b = b;
      t1.c = c;
      t1.d = d;
      t1.tx = tx;
      t1.ty = ty;
      v18 = &v20;
LABEL_7:
      result = ($446564691F179F0A09753BCCEB4D3730 *)CGAffineTransformConcat(&v24, &t1, v18);
      a = v24.a;
      b = v24.b;
      c = v24.c;
      d = v24.d;
      v16 = v19;
      goto LABEL_8;
    case 3:
      v19 = (float64x2_t)v17;
      CGAffineTransformMakeRotation(&v21, 1.57079633);
      t1.a = CGAffineTransformIdentity.a;
      t1.b = b;
      t1.c = c;
      t1.d = d;
      t1.tx = tx;
      t1.ty = ty;
      v18 = &v21;
      goto LABEL_7;
    case 2:
      CGAffineTransformMakeRotation(&v22, -3.14159265);
      t1.a = CGAffineTransformIdentity.a;
      t1.b = b;
      t1.c = c;
      t1.d = d;
      t1.tx = tx;
      t1.ty = ty;
      result = ($446564691F179F0A09753BCCEB4D3730 *)CGAffineTransformConcat(&v24, &t1, &v22);
      v16 = 0u;
      a = v24.a;
      b = v24.b;
      c = v24.c;
      d = v24.d;
LABEL_8:
      tx = v24.tx;
      ty = v24.ty;
      break;
  }
  retstr->var0.a = round(a);
  retstr->var0.b = round(b);
  retstr->var0.c = round(c);
  retstr->var0.d = round(d);
  retstr->var0.tx = round(tx);
  retstr->var0.ty = round(ty);
  retstr->var1.origin.x = 0.0;
  retstr->var1.origin.y = 0.0;
  retstr->var1.size = (CGSize)vdivq_f64(v16, (float64x2_t)vdupq_lane_s64(0, 0));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_sceneHostSettingsByContextID, 0);
  objc_storeStrong((id *)&self->_observerAssertion, 0);
}

@end
