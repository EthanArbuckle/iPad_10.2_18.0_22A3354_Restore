@implementation VKRouteAnnotation

- (VKRouteAnnotation)initWithRouteAnnotation:(id)a3 onRoute:(id)a4
{
  id v7;
  id v8;
  VKRouteAnnotation *v9;
  VKRouteAnnotation *v10;
  VKRouteAnnotation *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double type;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VKRouteAnnotation;
  v9 = -[VKTrafficFeature initWithEnrouteNotice:onRoute:](&v21, sel_initWithEnrouteNotice_onRoute_, v7, v8);
  v10 = v9;
  v11 = 0;
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v7, "artwork");
      v11 = (VKRouteAnnotation *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v7, "artwork");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "hasIcon") & 1) != 0)
        {
          objc_msgSend(v7, "artwork");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "icon");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "hasStyleAttributes");

          if ((v15 & 1) != 0)
          {
            objc_msgSend(v7, "artwork");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "icon");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "styleAttributes");
            v18 = objc_claimAutoreleasedReturnValue();
            type = v10->super._routeLegWhen._value.type;
            *(_QWORD *)&v10->super._routeLegWhen._value.type = v18;

            objc_storeStrong((id *)&v10->super._routeLegWhen, a3);
            v11 = v10;
            goto LABEL_9;
          }
        }
        else
        {

        }
        v11 = 0;
      }
    }
  }
LABEL_9:

  return v11;
}

- (GEOMiniCard)infoCard
{
  return (GEOMiniCard *)objc_msgSend(*(id *)&self->super._routeLegWhen._hasValue, "infoCard");
}

- (void)populateDebugNode:(void *)a3
{
  char *ChildNode;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  std::string *v12;
  unsigned int v13;
  unsigned int v14;
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  char *v23;
  char *v24;
  std::string v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  std::string __p;
  std::string v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)VKRouteAnnotation;
  -[VKTrafficFeature populateDebugNode:](&v38, sel_populateDebugNode_);
  *((_BYTE *)&__p.__r_.__value_.__s + 23) = 15;
  strcpy((char *)&__p, "StyleAttributes");
  ChildNode = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (__int128 *)&__p);
  gdc::DebugTreeNode::DebugTreeNode(&v31, (const gdc::DebugTreeNode *)ChildNode);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)&self->super._routeLegWhen._value.type, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        std::to_string(&v25, v8 + i);
        v12 = std::string::insert(&v25, 0, "Attribute: ", 0xBuLL);
        __p = *v12;
        v12->__r_.__value_.__l.__size_ = 0;
        v12->__r_.__value_.__r.__words[2] = 0;
        v12->__r_.__value_.__r.__words[0] = 0;
        v13 = objc_msgSend(v11, "key");
        v14 = objc_msgSend(v11, "value");
        v23 = 0;
        v15 = (char *)operator new(0x80uLL);
        v23 = v15 + 128;
        v24 = v15 + 128;
        *((_QWORD *)v15 + 1) = v13;
        *((_QWORD *)v15 + 5) = 0;
        *((_QWORD *)v15 + 6) = 0;
        *((_QWORD *)v15 + 4) = 0;
        *((_DWORD *)v15 + 14) = 1;
        *((_QWORD *)v15 + 12) = 0;
        *((_QWORD *)v15 + 9) = v14;
        *((_QWORD *)v15 + 13) = 0;
        *((_QWORD *)v15 + 14) = 0;
        *((_DWORD *)v15 + 30) = 1;
        v22 = v15;
        gdc::DebugTreeNode::addProperty((uint64_t)&v31, (uint64_t)&__p, (uint64_t *)&v22);
        if (v15[119] < 0)
        {
          operator delete(*((void **)v15 + 12));
          if ((v15[55] & 0x80000000) == 0)
            goto LABEL_10;
        }
        else if ((v15[55] & 0x80000000) == 0)
        {
          goto LABEL_10;
        }
        operator delete(*((void **)v15 + 4));
LABEL_10:
        operator delete(v15);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(__p.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            continue;
        }
        else if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          continue;
        }
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
      v8 += i;
    }
    while (v7);
  }

  v16 = v36;
  if (v36)
  {
    v17 = (uint64_t)v37;
    v18 = v36;
    if (v37 != v36)
    {
      do
      {
        v17 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v17);
      }
      while ((void *)v17 != v16);
      v18 = v36;
    }
    v37 = v16;
    operator delete(v18);
  }
  v19 = v34;
  if (v34)
  {
    v20 = (uint64_t)v35;
    v21 = v34;
    if (v35 != v34)
    {
      do
      {
        v20 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v20);
      }
      while ((void *)v20 != v19);
      v21 = v34;
    }
    v35 = v19;
    operator delete(v21);
  }
  if ((v33 & 0x80000000) == 0)
  {
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_30:
    operator delete(v31.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v32);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_30;
}

- (GEOStyleAttributes)_originalStyleAttributes
{
  return *(GEOStyleAttributes **)&self->super._routeLegWhen._value.type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._routeLegWhen._value, 0);
  objc_storeStrong((id *)&self->super._routeLegWhen, 0);
}

@end
