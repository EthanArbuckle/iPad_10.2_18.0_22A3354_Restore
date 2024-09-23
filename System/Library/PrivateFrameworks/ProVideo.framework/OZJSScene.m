@implementation OZJSScene

+ (id)sceneWithScene:(void *)a3
{
  return -[OZJSScene initWithScene:]([OZJSScene alloc], "initWithScene:", a3);
}

- (OZJSScene)initWithScene:(void *)a3
{
  OZJSScene *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZJSScene;
  result = -[OZJSScene init](&v5, sel_init);
  if (result)
    result->_scene = a3;
  return result;
}

- (id)getElementWithID:(unsigned int)a3
{
  OZScene *scene;
  void *Node;
  void *v5;

  scene = (OZScene *)self->_scene;
  if (scene
    && (Node = OZScene::getNode(scene, a3)) != 0
  {
    return +[OZJSElement elementWithElement:](OZJSElement, "elementWithElement:", v5);
  }
  else
  {
    return 0;
  }
}

- (id)get3DElementWithID:(unsigned int)a3
{
  id result;
  id v4;
  unint64_t v5;
  __int128 v6;

  result = self->_scene;
  if (result)
  {
    result = OZScene::getNode((OZScene *)result, a3);
    if (result)
    {
      if (result)
      {
        v4 = result;
        v5 = *((_QWORD *)result + 1);
        v6 = xmmword_1B355DB30;
        if (OZFactory::isKindOfClass(v5, (int32x4_t *)&v6))
        else
          return 0;
      }
    }
  }
  return result;
}

- (id)get3DElementWithName:(id)a3
{
  uint64_t *scene;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  char *v11;
  PCString *Name;
  OZJS3DElement *v13;
  char v15[32];
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char v20;
  _OWORD v21[2];
  int v22;
  _QWORD v23[4];
  uint64_t v24;

  scene = (uint64_t *)self->_scene;
  if (!scene)
    return 0;
  OZScene::begin_t<OZ3DEngineSceneElement,false,true>(scene, (uint64_t)v23);
  v6 = self->_scene;
  v7 = (char *)(v6 + 150);
  v8 = v6[151];
  memset(v21, 0, sizeof(v21));
  v22 = 1065353216;
  v17 = v7;
  v18 = v8;
  v19 = v7;
  v20 = 0;
  v9 = v23[0];
  if ((char *)v23[0] == v7)
  {
LABEL_9:
    v13 = 0;
  }
  else
  {
    while (1)
    {
      if (v9 == v23[2] || (v10 = *(const void **)(v9 + 16)) == 0)
        v11 = 0;
      else
      Name = (PCString *)OZObjectManipulator::getName((OZObjectManipulator *)(v11 + 16));
      if (!-[__CFString compare:]((id)PCString::ns_str(Name), "compare:", a3))
        break;
      OZObject::iterator_t<OZ3DEngineSceneElement,false,true,OZObject::defaultValidator>::operator++((uint64_t)v23, (uint64_t)v15);
      std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v16);
      v9 = v23[0];
      if ((char *)v23[0] == v17)
        goto LABEL_9;
    }
    v13 = +[OZJS3DElement elementWith3DElement:](OZJS3DElement, "elementWith3DElement:", v11);
  }
  std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)v21);
  std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v24);
  return v13;
}

- (void)scene
{
  return self->_scene;
}

- (void)setScene:(void *)a3
{
  self->_scene = a3;
}

@end
