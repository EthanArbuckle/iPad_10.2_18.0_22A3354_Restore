@implementation PSMain

- (PSMain)init
{
  PSMain *v2;
  PSMain *v3;
  uint64_t v4;
  OZFactory *Instance;
  PSParticleType_Factory *v6;
  uint64_t v7;
  OZFactory *v8;
  PSReplicator_Factory *v9;
  uint64_t v10;
  OZFactory *v11;
  PSReplicatorPType_Factory *v12;
  uint64_t v13;
  OZFactory *v14;
  PSPaint_Factory *v15;
  uint64_t v16;
  OZFactory *v17;
  PSPaintPType_Factory *v18;
  uint64_t v19;
  OZFactory *v20;
  PSEmitterMoToFoBehavior_Factory *v21;
  uint64_t v22;
  OZFactory *v23;
  PSScaleOverLifeBehavior_Factory *v24;
  uint64_t v25;
  OZFactory *v26;
  PSSequenceBehavior_Factory *v27;
  uint64_t v28;
  OZFactory *v29;
  PSPaintSequenceBehavior_Factory *v30;
  uint64_t v31;
  OZFactory *v32;
  PSSpinOverLifeBehavior_Factory *v33;
  uint64_t v34;
  OZFactory *v35;
  PSPenPropertyBehavior_Factory *v36;
  uint64_t v37;
  OZFactory *v38;
  PSPenPressureBehavior_Factory *v39;
  uint64_t v40;
  OZFactory *v41;
  PSPenSpeedBehavior_Factory *v42;
  uint64_t v43;
  OZFactory *v44;
  PSPenTiltBehavior_Factory *v45;
  uint64_t v46;
  OZFactory *v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)PSMain;
  v2 = -[PSMain init](&v49, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = theApp;
    Instance = (OZFactory *)PSEmitter_Factory::getInstance((PSEmitter_Factory *)v2);
    v6 = (PSParticleType_Factory *)OZFactories::addFactory(*(uint64_t ***)(v4 + 32), Instance);
    v7 = theApp;
    v8 = (OZFactory *)PSParticleType_Factory::getInstance(v6);
    v9 = (PSReplicator_Factory *)OZFactories::addFactory(*(uint64_t ***)(v7 + 32), v8);
    v10 = theApp;
    v11 = (OZFactory *)PSReplicator_Factory::getInstance(v9);
    v12 = (PSReplicatorPType_Factory *)OZFactories::addFactory(*(uint64_t ***)(v10 + 32), v11);
    v13 = theApp;
    v14 = (OZFactory *)PSReplicatorPType_Factory::getInstance(v12);
    v15 = (PSPaint_Factory *)OZFactories::addFactory(*(uint64_t ***)(v13 + 32), v14);
    v16 = theApp;
    v17 = (OZFactory *)PSPaint_Factory::getInstance(v15);
    v18 = (PSPaintPType_Factory *)OZFactories::addFactory(*(uint64_t ***)(v16 + 32), v17);
    v19 = theApp;
    v20 = (OZFactory *)PSPaintPType_Factory::getInstance(v18);
    v21 = (PSEmitterMoToFoBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v19 + 32), v20);
    v22 = theApp;
    v23 = (OZFactory *)PSEmitterMoToFoBehavior_Factory::getInstance(v21);
    v24 = (PSScaleOverLifeBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v22 + 32), v23);
    v25 = theApp;
    v26 = (OZFactory *)PSScaleOverLifeBehavior_Factory::getInstance(v24);
    v27 = (PSSequenceBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v25 + 32), v26);
    v28 = theApp;
    v29 = (OZFactory *)PSSequenceBehavior_Factory::getInstance(v27);
    v30 = (PSPaintSequenceBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v28 + 32), v29);
    v31 = theApp;
    v32 = (OZFactory *)PSPaintSequenceBehavior_Factory::getInstance(v30);
    v33 = (PSSpinOverLifeBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v31 + 32), v32);
    v34 = theApp;
    v35 = (OZFactory *)PSSpinOverLifeBehavior_Factory::getInstance(v33);
    v36 = (PSPenPropertyBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v34 + 32), v35);
    v37 = theApp;
    v38 = (OZFactory *)PSPenPropertyBehavior_Factory::getInstance(v36);
    v39 = (PSPenPressureBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v37 + 32), v38);
    v40 = theApp;
    v41 = (OZFactory *)PSPenPressureBehavior_Factory::getInstance(v39);
    v42 = (PSPenSpeedBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v40 + 32), v41);
    v43 = theApp;
    v44 = (OZFactory *)PSPenSpeedBehavior_Factory::getInstance(v42);
    v45 = (PSPenTiltBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v43 + 32), v44);
    v46 = theApp;
    v47 = (OZFactory *)PSPenTiltBehavior_Factory::getInstance(v45);
    OZFactories::addFactory(*(uint64_t ***)(v46 + 32), v47);
  }
  return v3;
}

- (BOOL)canAddEmitterToDoc:(void *)a3
{
  OZScene *v3;
  uint64_t v4;
  char v5;
  char v6;
  const void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  char v12;
  _QWORD v14[4];
  uint64_t v15;
  _QWORD v16[4];
  uint64_t v17;

  if (a3)
  {
    v3 = (OZScene *)*((_QWORD *)a3 + 3);
    OZScene::begin_sel(v3, (uint64_t)v16);
    OZScene::end_sel(v3, (uint64_t)v14);
    v4 = 0;
    v5 = 0;
    v6 = 1;
    while (v16[0] != v14[0])
    {
      if (v16[0] == v16[2])
      {
        v7 = 0;
      }
      else
      {
        v7 = *(const void **)(v16[0] + 16);
        if (v7
        {
          goto LABEL_20;
        }
      }
      if ((OZSceneNode::isDescendantOf360Group((uint64_t)v7) & 1) != 0
        || ((v8 = *(_QWORD *)(v16[0] + 16)) == 0
          ? (v9 = 0)
      {
LABEL_20:
        v12 = 0;
        goto LABEL_23;
      }
      v5 |= v9 != 0;
      OZObject::iterator_t<OZSceneNode,true,true,OZObject::defaultValidator>::operator++(v16);
      v6 = 0;
      v4 = v10;
    }
    v12 = (v6 ^ 1) & v5;
LABEL_23:
    std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v15);
    std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v17);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

- (BOOL)validateAction:(SEL)a3
{
  return 0;
}

@end
