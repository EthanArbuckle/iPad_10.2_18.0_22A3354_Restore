@implementation OZJSElement

+ (id)elementWithElement:(void *)a3
{
  return -[OZJSElement initWithElement:]([OZJSElement alloc], "initWithElement:", a3);
}

- (OZJSElement)initWithElement:(void *)a3
{
  OZJSElement *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZJSElement;
  result = -[OZJSElement init](&v5, sel_init);
  if (result)
    result->_element = a3;
  return result;
}

- (void)setRotation:(OZJSElement *)self
{
  __int128 v2;

  OZTransformNode::setRotation((OZTransformNode *)self->_element, *(float *)&v2, *((float *)&v2 + 1), *((float *)&v2 + 2), MEMORY[0x1E0CA2E68]);
}

- (void)setPosition:(SCNVector3)a3
{
  OZTransformNode::setTranslation((OZTransformNode *)self->_element, a3.x, a3.y, a3.z, MEMORY[0x1E0CA2E68]);
}

- (void)setStartTime:(float)a3
{
  CMTime v4;

  memset(&v4, 0, sizeof(v4));
  PC_CMTimeMakeWithSecondsRoundToNearest(30, &v4, a3);
  (*(void (**)(void *, CMTime *))(*(_QWORD *)self->_element + 1160))(self->_element, &v4);
}

- (float)getStartTime
{
  CMTime v3;
  CMTime v4;

  (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)self->_element + 1128))(&v4);
  v3 = v4;
  return CMTimeGetSeconds(&v3);
}

- (float)getEndTime
{
  CMTime v4;
  CMTime v5;
  CMTime v6[2];
  CMTime v7;
  CMTime v8;
  CMTime v9;

  (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)self->_element + 1128))(v6);
  v7 = v6[0];
  memset(&v5, 0, sizeof(v5));
  (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)self->_element + 1128))(v6);
  v8 = v6[1];
  v9 = v7;
  PC_CMTimeSaferAdd(&v9, &v8, (uint64_t)&v5);
  v4 = v5;
  return CMTimeGetSeconds(&v4);
}

- (SCNVector3)getPosition
{
  double v2;
  float v3;
  float v4;
  float v5;
  SCNVector3 result;

  LODWORD(v2) = 0;
  -[OZJSElement getPositionAtTime:](self, "getPositionAtTime:", v2);
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (SCNVector3)getPositionAtTime:(float)a3
{
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  CMTime v10;
  SCNVector3 result;

  memset(&v10, 0, sizeof(v10));
  PC_CMTimeMakeWithSecondsRoundToNearest(30, &v10, a3);
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  OZTransformNode::getTranslation((OZTransformNode *)self->_element, &v7, &v8, &v9, &v10);
  v4 = v7;
  v5 = v8;
  v6 = v9;
  result.z = v6;
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)enable
{
  (*(void (**)(char *, uint64_t))(*((_QWORD *)self->_element + 2) + 32))((char *)self->_element + 16, 1);
}

- (void)disable
{
  (*(void (**)(char *, uint64_t))(*((_QWORD *)self->_element + 2) + 40))((char *)self->_element + 16, 1);
}

- (unsigned)ID
{
  return *((_DWORD *)self->_element + 20);
}

- (id)name
{
  PCString *Name;

  Name = (PCString *)OZObjectManipulator::getName((OZObjectManipulator *)((char *)self->_element + 16));
  return (id)PCString::ns_str(Name);
}

- (void)clone
{
  double v2;

  LODWORD(v2) = 0;
  -[OZJSElement cloneAtTime:](self, "cloneAtTime:", v2);
}

- (void)cloneAtTime:(float)a3
{
  _QWORD v3[5];
  float v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__OZJSElement_cloneAtTime___block_invoke;
  v3[3] = &unk_1E658F288;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __27__OZJSElement_cloneAtTime___block_invoke(uint64_t a1)
{
  uint64_t result;
  OZScene *v3;
  uint64_t v4;
  OZObjectManipulator *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CMTime v14;
  _BYTE v15[24];
  uint64_t v16;
  _DWORD v17[4];
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 16) + 272))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  if (result)
  {
    v3 = (OZScene *)result;
    printf("[AR]\t\tOZJavaScript clone: cloning %u\n", objc_msgSend(*(id *)(a1 + 32), "ID"));
    OZScene::clearSelection(v3);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (v4)
      v5 = (OZObjectManipulator *)(v4 + 16);
    else
      v5 = 0;
    OZScene::selectObject(v3, v5, 0, 0);
    OZScene::duplicateSelected(v3);
    OZScene::begin_all_sel((uint64_t *)v3, (uint64_t)v19);
    OZScene::end_all_sel(v3, (uint64_t)v15);
    if (v22 == v17[2])
    {
      if (v22 < 2)
      {
        v7 = (uint64_t *)v15;
        v6 = v19;
      }
      else if (v22 == 3)
      {
        v6 = &v21;
        v7 = (uint64_t *)v17;
      }
      else
      {
        if (v22 != 2)
          goto LABEL_24;
        v6 = &v20;
        v7 = &v16;
      }
      if (*v6 == *v7)
        goto LABEL_24;
    }
    if (v22 < 2)
    {
      v8 = v19[0];
      if (v19[0] == v19[2])
        goto LABEL_24;
    }
    else
    {
      if (v22 == 2)
      {
        v11 = *(_QWORD *)(v20 + 16);
        if (v11)
        {
          v10 = (const void *)(v11 + 48);
LABEL_22:
          if (v12)
          {
            v13 = v12;
            memset(&v14, 0, sizeof(v14));
            PC_CMTimeMakeWithSecondsRoundToNearest(30, &v14, *(float *)(a1 + 40));
            (*(void (**)(void *, CMTime *))(*(_QWORD *)v13 + 1160))(v13, &v14);
          }
        }
LABEL_24:
        std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v18);
        return std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v23);
      }
      if (v22 != 3)
        goto LABEL_24;
      v8 = v21;
    }
    v9 = *(_QWORD *)(v8 + 16);
    if (v9)
    {
      v10 = (const void *)(v9 + 16);
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  return result;
}

- (id)getBehaviorWithName:(id)a3
{
  _QWORD *element;
  char *v4;
  char *v5;
  PCString *Name;
  PCString v9;

  element = self->_element;
  v4 = (char *)(element + 125);
  v5 = (char *)element[126];
  if (v5 == (char *)(element + 125))
    return 0;
  while (1)
  {
    Name = (PCString *)OZObjectManipulator::getName((OZObjectManipulator *)(*((_QWORD *)v5 + 2) + 16));
    v9.var0 = 0;
    PCString::set(&v9, (CFStringRef)a3);
    LODWORD(Name) = PCString::compare(Name, &v9);
    PCString::~PCString(&v9);
    if (!(_DWORD)Name)
      break;
    v5 = (char *)*((_QWORD *)v5 + 1);
    if (v5 == v4)
      return 0;
  }
  if (v5 == v4)
    return 0;
  else
    return +[OZJSBehavior behaviorWithBehavior:](OZJSBehavior, "behaviorWithBehavior:", *((_QWORD *)v5 + 2));
}

- (void)element
{
  return self->_element;
}

- (void)setElement:(void *)a3
{
  self->_element = a3;
}

- (float)time
{
  return self->_time;
}

- (void)setTime:(float)a3
{
  self->_time = a3;
}

@end
