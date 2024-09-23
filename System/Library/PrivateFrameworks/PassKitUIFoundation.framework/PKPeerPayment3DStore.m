@implementation PKPeerPayment3DStore

+ (PKPeerPayment3DStore)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (PKPeerPayment3DStore *)(id)sharedInstance_store;
}

void __38__PKPeerPayment3DStore_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PKPeerPayment3DStore _init]([PKPeerPayment3DStore alloc], "_init");
  v1 = (void *)sharedInstance_store;
  sharedInstance_store = (uint64_t)v0;

}

- (PKPeerPayment3DStore)init
{

  return 0;
}

- (id)_init
{
  PKPeerPayment3DStore *v2;
  PKPeerPayment3DStore *v3;
  NSCache *v4;
  NSCache *cache;
  NSMutableArray *v6;
  NSMutableArray *activeScenes;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *sceneLoadingQueue;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKPeerPayment3DStore;
  v2 = -[PKPeerPayment3DStore init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cache = v3->_cache;
    v3->_cache = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    activeScenes = v3->_activeScenes;
    v3->_activeScenes = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("passkituifoundation.3dstore.loading", v9);
    sceneLoadingQueue = v3->_sceneLoadingQueue;
    v3->_sceneLoadingQueue = (OS_dispatch_queue *)v10;

    +[PKPeerPayment3DScene staticRollPitch](PKPeerPayment3DScene, "staticRollPitch");
    *(_QWORD *)v3->_lastRollPitch = v12;
    +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:");
    *(_OWORD *)v3->_anon_30 = v13;
    *(_OWORD *)&v3->_anon_30[16] = v14;
    *(_OWORD *)&v3->_anon_30[32] = v15;
    *(_OWORD *)&v3->_anon_30[48] = v16;
    v17 = *(_OWORD *)&v3->_anon_30[16];
    *(_OWORD *)v3->_anon_80 = *(_OWORD *)v3->_anon_30;
    *(_OWORD *)&v3->_anon_80[16] = v17;
    v18 = *(_OWORD *)&v3->_anon_30[48];
    *(_OWORD *)&v3->_anon_80[32] = *(_OWORD *)&v3->_anon_30[32];
    *(_OWORD *)&v3->_anon_80[48] = v18;
    +[PKPeerPayment3DScene skewForRollPitch:](PKPeerPayment3DScene, "skewForRollPitch:", *(double *)v3->_lastRollPitch);
    *(_QWORD *)v3->_skew = v19;
    *(_QWORD *)v3->_staticSkew = v19;

  }
  return v3;
}

- (void)newSceneWithCompletion:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  NSObject *sceneLoadingQueue;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  void (**v14)(id, void *);
  _QWORD v15[5];

  v4 = a4;
  v6 = (void (**)(id, void *))a3;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke;
  v15[3] = &unk_24D0A0C18;
  v15[4] = self;
  v8 = (void (**)(_QWORD))MEMORY[0x2199BB0CC](v15);
  v9 = v8;
  if (v4)
  {
    v8[2](v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);
  }
  else
  {
    sceneLoadingQueue = self->_sceneLoadingQueue;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke_2;
    v12[3] = &unk_24D0A0C40;
    v12[4] = self;
    v13 = v8;
    v14 = v6;
    dispatch_async(sceneLoadingQueue, v12);

    v10 = v13;
  }

}

PKPeerPayment3DScene *__61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke(uint64_t a1)
{
  PKPeerPayment3DScene *v2;

  v2 = objc_alloc_init(PKPeerPayment3DScene);
  -[PKPeerPayment3DScene setCurrentRollPitch:](v2, "setCurrentRollPitch:", *(double *)(*(_QWORD *)(a1 + 32) + 120));
  -[PKPeerPayment3DScene setCurrentRotationMatrix:](v2, "setCurrentRotationMatrix:", *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 64), *(double *)(*(_QWORD *)(a1 + 32) + 80), *(double *)(*(_QWORD *)(a1 + 32) + 96));
  -[PKPeerPayment3DScene setCurrentSkew:](v2, "setCurrentSkew:", *(double *)(*(_QWORD *)(a1 + 32) + 112));
  return v2;
}

void __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke_2(_QWORD *a1)
{
  void *v2;
  _QWORD block[5];

  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  objc_msgSend(*(id *)(a1[4] + 16), "addObject:", v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke_3;
  block[3] = &unk_24D0A0BA8;
  block[4] = a1[4];
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(v2, "setPaused:", 0);
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __61__PKPeerPayment3DStore_newSceneWithCompletion_synchronously___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMonitorMotion");
}

- (void)relinquishScene:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  _BOOL8 v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray removeObjectIdenticalTo:](self->_activeScenes, "removeObjectIdenticalTo:", v5);

  v6 = -[PKPeerPayment3DStore _shouldMonitorMotion](self, "_shouldMonitorMotion");
  os_unfair_lock_unlock(p_lock);
  -[PKPeerPayment3DStore _setMonitorMotion:](self, "_setMonitorMotion:", v6);
}

- (void)sceneDidBecomeActive:(id)a3
{
  _BOOL8 v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setPaused:", 0);
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray indexOfObjectIdenticalTo:](self->_activeScenes, "indexOfObjectIdenticalTo:", v5) == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray addObject:](self->_activeScenes, "addObject:", v5);
  v4 = -[PKPeerPayment3DStore _shouldMonitorMotion](self, "_shouldMonitorMotion");
  os_unfair_lock_unlock(&self->_lock);
  -[PKPeerPayment3DStore _setMonitorMotion:](self, "_setMonitorMotion:", v4);

}

- (void)sceneDidBecomeInactive:(id)a3
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  objc_msgSend(v4, "setPaused:", 1);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeObjectIdenticalTo:](self->_activeScenes, "removeObjectIdenticalTo:", v4);

  v5 = -[PKPeerPayment3DStore _shouldMonitorMotion](self, "_shouldMonitorMotion");
  os_unfair_lock_unlock(&self->_lock);
  -[PKPeerPayment3DStore _setMonitorMotion:](self, "_setMonitorMotion:", v5);
}

- (BOOL)_shouldMonitorMotion
{
  return -[NSMutableArray count](self->_activeScenes, "count") != 0;
}

- (void)_updateMonitorMotion
{
  os_unfair_lock_s *p_lock;
  _BOOL8 v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[PKPeerPayment3DStore _shouldMonitorMotion](self, "_shouldMonitorMotion");
  os_unfair_lock_unlock(p_lock);
  -[PKPeerPayment3DStore _setMonitorMotion:](self, "_setMonitorMotion:", v4);
}

- (void)_setMonitorMotion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_monitorMotion != a3)
  {
    v3 = a3;
    self->_monitorMotion = a3;
    +[PKMotionManager sharedManager](PKMotionManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "registerClient:", self);
    else
      objc_msgSend(v5, "unregisterClient:", self);

  }
}

- (void)motionManager:(id)a3 didReceiveMotion:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  GLKVector3 *v27;
  size_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  uint64_t v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  __int128 v46;
  float64_t v47;
  float64_t v48;
  float64_t v49;
  float v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  int v57;
  _BYTE v58[128];
  uint64_t v59;
  GLKQuaternion v60;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "attitude", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quaternion");
  v48 = v7;
  v49 = v6;
  v46 = v9;
  v47 = v8;

  _Q1.f64[0] = v47;
  *(_QWORD *)&_Q1.f64[1] = v46;
  _Q0.f64[0] = v49;
  _Q0.f64[1] = v48;
  _Q4 = veorq_s8((int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(_Q0), _Q1), (int8x16_t)xmmword_213A5D830);
  _S3 = 1050015257;
  _S5 = 1064617455;
  _S6 = 0;
  __asm { FMLA            S0, S6, V4.S[2] }
  _V7.S[1] = 0x80000000;
  __asm
  {
    FMLA            S0, S7, V4.S[1]
    FMLA            S1, S5, V4.S[1]
  }
  _S6 = -1097468391;
  __asm
  {
    FMLA            S1, S6, V4.S[2]
    FMLA            S2, S5, V4.S[2]
    FMLA            S2, S3, V4.S[1]
    FMLA            S3, S5, V4.S[3]
    FMLA            S3, S7, V4.S[1]
    FMLA            S3, S7, V4.S[2]
  }
  v56 = 0;
  v57 = 1065353216;
  *(_QWORD *)&v60.x = &v56;
  *(_QWORD *)&v60.q[2] = 1;
  GLKQuaternionRotateVector3Array(v60, v27, v28);
  v30 = *((float *)&v56 + 1);
  v29 = *(float *)&v56;
  if (*(float *)&v56 > 0.6)
    v29 = 0.6;
  if (*(float *)&v56 < -0.6)
    v29 = -0.6;
  if (*((float *)&v56 + 1) > 0.6)
    v30 = 0.6;
  if (*((float *)&v56 + 1) >= -0.6)
    v31 = v30;
  else
    v31 = -0.6;
  v50 = asinf(v29);
  v32 = asinf(v31);
  v33 = *(_QWORD *)self->_lastRollPitch;
  *(float *)&v34 = v50;
  if (vabds_f32(v50, *(float *)&v33) > 0.01 || vabds_f32(v32, *((float *)&v33 + 1)) > 0.01)
  {
    *((float *)&v34 + 1) = v32;
    v51 = v34;
    *(double *)self->_lastRollPitch = v34;
    +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:", v34, v46);
    *(_OWORD *)self->_anon_30 = v35;
    *(_OWORD *)&self->_anon_30[16] = v36;
    *(_OWORD *)&self->_anon_30[32] = v37;
    *(_OWORD *)&self->_anon_30[48] = v38;
    +[PKPeerPayment3DScene skewForRollPitch:](PKPeerPayment3DScene, "skewForRollPitch:", v51);
    *(_QWORD *)self->_skew = v39;
    os_unfair_lock_lock(&self->_lock);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v40 = (void *)-[NSMutableArray copy](self->_activeScenes, "copy");
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v53 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v45, "setCurrentRotationMatrix:", *(double *)self->_anon_30, *(double *)&self->_anon_30[16], *(double *)&self->_anon_30[32], *(double *)&self->_anon_30[48]);
          objc_msgSend(v45, "setCurrentSkew:", *(double *)self->_skew);
          objc_msgSend(v45, "setCurrentRollPitch:", v51);
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v42);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (id)material
{
  SCNMaterial *textMaterial;
  SCNMaterial *v4;
  SCNMaterial *v5;
  SCNMaterial *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  textMaterial = self->_textMaterial;
  if (!textMaterial)
  {
    objc_msgSend(MEMORY[0x24BDE8238], "material");
    v4 = (SCNMaterial *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textMaterial;
    self->_textMaterial = v4;

    v6 = self->_textMaterial;
    v17[0] = *MEMORY[0x24BDE8308];
    v7 = (void *)MEMORY[0x24BDD17C8];
    PKPassKitUIFoundationBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("TextShader"), CFSTR("txt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithContentsOfURL:encoding:error:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v17[1] = *MEMORY[0x24BDE8310];
    v11 = (void *)MEMORY[0x24BDD17C8];
    PKPassKitUIFoundationBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLForResource:withExtension:", CFSTR("TextGeometry"), CFSTR("txt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithContentsOfURL:encoding:error:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNMaterial setShaderModifiers:](v6, "setShaderModifiers:", v15);

    -[SCNMaterial setValue:forKey:](self->_textMaterial, "setValue:forKey:", &unk_24D0A9FC8, CFSTR("colorAmount"));
    textMaterial = self->_textMaterial;
  }
  return (id)-[SCNMaterial copy](textMaterial, "copy");
}

- (void)charactersForText:(id)a3 completion:(id)a4 synchronously:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *sceneLoadingQueue;
  _QWORD v16[4];
  id v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  _QWORD v20[5];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (v8 && v9)
  {
    v11 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __67__PKPeerPayment3DStore_charactersForText_completion_synchronously___block_invoke;
    v20[3] = &unk_24D0A0C68;
    v20[4] = self;
    v12 = MEMORY[0x2199BB0CC](v20);
    v13 = (void *)v12;
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v14);
    }
    else
    {
      sceneLoadingQueue = self->_sceneLoadingQueue;
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __67__PKPeerPayment3DStore_charactersForText_completion_synchronously___block_invoke_2;
      v16[3] = &unk_24D0A0C90;
      v18 = v10;
      v19 = v13;
      v17 = v8;
      dispatch_async(sceneLoadingQueue, v16);

      v14 = v18;
    }

  }
}

id __67__PKPeerPayment3DStore_charactersForText_completion_synchronously___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(v3, "length"))
  {
    for (i = 0; objc_msgSend(v3, "length") > i; ++i)
    {
      objc_msgSend(v3, "substringWithRange:", i, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "nodeForCharacter:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v9 = 0;
          goto LABEL_7;
        }
        objc_msgSend(v5, "setObject:forKey:", v8, v7);
      }
      objc_msgSend(v8, "clone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      +[PKPeerPayment3DCharacter characterWithCharacter:node:](PKPeerPayment3DCharacter, "characterWithCharacter:node:", v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

void __67__PKPeerPayment3DStore_charactersForText_completion_synchronously___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[5];
  (*(void (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)nodeForCharacter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSCache *cache;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[NSCache objectForKey:](self->_cache, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PKEqualObjects();

      if (v8)
      {

        v6 = 0;
LABEL_16:
        v9 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(&unk_24D0AA0C0, "objectForKeyedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(&unk_24D0AA0C0, "objectForKeyedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("Character%@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("Character%@"), v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      PKPassKitUIFoundationBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLForResource:withExtension:", v13, CFSTR("scn"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDE8280], "sceneWithURL:options:error:", v15, 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "rootNode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "childNodes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setName:", v4);
        -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v6, v4);

      }
      else
      {
        cache = self->_cache;
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache setObject:forKey:](cache, "setObject:forKey:", v20, v4);

        PKLogFacilityTypeGetObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v4;
          _os_log_impl(&dword_213A36000, v21, OS_LOG_TYPE_DEFAULT, "Missing character for %{public}@", buf, 0xCu);
        }

        v6 = 0;
      }

      if (!v6)
        goto LABEL_16;
    }
    objc_msgSend(v6, "clone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "geometry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v9, "setGeometry:", v23);

LABEL_17:
    goto LABEL_18;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneLoadingQueue, 0);
  objc_storeStrong((id *)&self->_textMaterial, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_activeScenes, 0);
}

@end
