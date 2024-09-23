@implementation TUIRenderModelSection

- (id)initForTestWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id result;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)TUIRenderModelSection;
  result = -[TUIRenderModelSection init](&v10, "init");
  if (result)
  {
    *((CGFloat *)result + 1) = x;
    *((CGFloat *)result + 2) = y;
    *((CGFloat *)result + 26) = width;
    *((CGFloat *)result + 27) = height;
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)((char *)result + 248) = *(_OWORD *)&CGAffineTransformIdentity.a;
    v9 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)((char *)result + 264) = v8;
    *(_OWORD *)((char *)result + 280) = v9;
    *((_QWORD *)result + 13) = 0x3FF0000000000000;
  }
  return result;
}

- (id)_initWithSection:(id)a3
{
  TUIRenderModelSection *v4;
  TUIRenderModelSection *v5;
  TUIRenderModelSection *v6;
  TUIRenderModelSection *v7;
  NSArray *v8;
  NSArray *viewModels;
  NSArray *v10;
  NSArray *impressions;
  NSArray *v12;
  NSArray *linkEntities;
  NSDictionary *v14;
  NSDictionary *hoverRegions;
  NSArray *v16;
  NSArray *errors;
  TUIIdentifier *v18;
  TUIIdentifier *identifier;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  TUIAnimationGroupRenderModelCollection *v23;
  TUIAnimationGroupRenderModelCollection *animationRenderModels;
  objc_super v26;

  v4 = (TUIRenderModelSection *)a3;
  v26.receiver = self;
  v26.super_class = (Class)TUIRenderModelSection;
  v5 = -[TUIRenderModelSection init](&v26, "init");
  v6 = v5;
  v7 = v5;
  if (v4 && v5)
  {
    objc_storeStrong((id *)&v5->_entry, v4->_entry);
    v8 = (NSArray *)-[NSArray copy](v4->_viewModels, "copy");
    viewModels = v7->_viewModels;
    v7->_viewModels = v8;

    v10 = (NSArray *)-[NSArray copy](v4->_impressions, "copy");
    impressions = v7->_impressions;
    v7->_impressions = v10;

    v12 = (NSArray *)-[NSArray copy](v4->_linkEntities, "copy");
    linkEntities = v7->_linkEntities;
    v7->_linkEntities = v12;

    v14 = (NSDictionary *)-[NSDictionary copy](v4->_hoverRegions, "copy");
    hoverRegions = v7->_hoverRegions;
    v7->_hoverRegions = v14;

    v7->_offset = v4->_offset;
    v7->_containsLiveTransforms = v4->_containsLiveTransforms;
    v16 = (NSArray *)-[NSArray copy](v4->_errors, "copy");
    errors = v7->_errors;
    v7->_errors = v16;

    v18 = (TUIIdentifier *)-[TUIIdentifier copyWithZone:](v4->_identifier, "copyWithZone:", 0);
    identifier = v7->_identifier;
    v7->_identifier = v18;

    v7->_size = v4->_size;
    if (v6 != v4)
      sub_D1964((uint64_t **)&v6->_viewMap, (_QWORD *)v4->_viewMap.__tree_.__begin_node_, &v4->_viewMap.__tree_.__pair1_.__value_.__left_);
    v7->_viewRange = v4->_viewRange;
    objc_storeStrong((id *)&v6->_identifierInterest, v4->_identifierInterest);
    objc_storeStrong((id *)&v6->_identifierMap, v4->_identifierMap);
    objc_storeStrong((id *)&v6->_identifierToModelMap, v4->_identifierToModelMap);
    objc_storeStrong((id *)&v6->_containedSubmodels, v4->_containedSubmodels);
    objc_storeStrong((id *)&v6->_layoutQueue, v4->_layoutQueue);
    v20 = *(_OWORD *)&v4->_config.flipHorizontal;
    v7->_config.zIndex = v4->_config.zIndex;
    *(_OWORD *)&v7->_config.flipHorizontal = v20;
    v21 = *(_OWORD *)&v4->_transform.a;
    v22 = *(_OWORD *)&v4->_transform.tx;
    *(_OWORD *)&v6->_transform.c = *(_OWORD *)&v4->_transform.c;
    *(_OWORD *)&v6->_transform.tx = v22;
    *(_OWORD *)&v7->_transform.a = v21;
    v7->_alpha = v4->_alpha;
    v23 = (TUIAnimationGroupRenderModelCollection *)-[TUIAnimationGroupRenderModelCollection copy](v4->_animationRenderModels, "copy");
    animationRenderModels = v7->_animationRenderModels;
    v7->_animationRenderModels = v23;

  }
  return v7;
}

- (TUIRenderModelSection)initWithEntry:(id)a3 submodels:(id)a4 config:(id *)a5 impressions:(id)a6 linkEntities:(id)a7 hoverRegions:(id)a8 identifierMap:(id)a9 layoutQueue:(id)a10
{
  id v17;
  TUIRenderModelSection *v18;
  TUIRenderModelSection *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  NSArray *v23;
  NSArray *containedSubmodels;
  NSMutableArray *v25;
  NSMutableDictionary *v26;
  uint64_t v27;
  NSArray *viewModels;
  NSArray *v29;
  NSArray *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *i;
  void *v35;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **left;
  NSUInteger v38;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **v39;
  BOOL v40;
  uint64_t v41;
  NSArray *v42;
  BOOL v43;
  id v44;
  uint64_t v45;
  void *j;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  TUIRenderModelIdentifierInterest *identifierInterest;
  NSArray *v52;
  NSArray *impressions;
  NSArray *v54;
  NSArray *linkEntities;
  NSDictionary *v56;
  NSDictionary *hoverRegions;
  NSDictionary *v58;
  NSDictionary *identifierToModelMap;
  id obj;
  id obja;
  NSMutableArray *v63;
  NSMutableArray *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  NSMutableArray *v77;
  objc_super v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id *v84;
  _BYTE v85[128];
  _BYTE v86[128];

  v66 = a3;
  v71 = a4;
  v67 = a6;
  v68 = a7;
  v69 = a8;
  v70 = a9;
  v17 = a10;
  v78.receiver = self;
  v78.super_class = (Class)TUIRenderModelSection;
  v18 = -[TUIRenderModelSection init](&v78, "init");
  v19 = v18;
  if (v18)
  {
    obj = a9;
    v65 = v17;
    objc_storeStrong((id *)&v18->_entry, a3);
    v19->_offset = CGPointZero;
    v19->_section = 0;
    v20 = *(_OWORD *)&a5->var0;
    v19->_config.zIndex = a5->var2;
    v19->_size = CGSizeZero;
    *(_OWORD *)&v19->_config.flipHorizontal = v20;
    v19->_alpha = 1.0;
    v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v19->_transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    v22 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v19->_transform.c = v21;
    *(_OWORD *)&v19->_transform.tx = v22;
    v63 = objc_opt_new(NSMutableArray);
    v23 = (NSArray *)objc_msgSend(v71, "copy");
    containedSubmodels = v19->_containedSubmodels;
    v19->_containedSubmodels = v23;

    objc_storeStrong((id *)&v19->_layoutQueue, a10);
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_CEBE8;
    v76[3] = &unk_241150;
    v25 = v63;
    v77 = v25;
    objc_msgSend(v71, "enumerateObjectsUsingBlock:", v76);
    v26 = objc_opt_new(NSMutableDictionary);
    v64 = v25;
    if (-[NSMutableArray count](v25, "count"))
    {
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "mapViewModels:", v25, a9));
      viewModels = v19->_viewModels;
      v19->_viewModels = (NSArray *)v27;

      v29 = v19->_viewModels;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v30 = v29;
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      if (v31)
      {
        v32 = 0;
        v33 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(_QWORD *)v81 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
            v79 = 0;
            v79 = objc_msgSend(v35, "itemIndex");
            v84 = &v79;
            sub_D18A8((uint64_t **)&v19->_viewMap, (unint64_t *)&v79, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = (uint64_t)i + v32;
          }
          v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
          v32 += (uint64_t)i;
        }
        while (v31);
      }

      p_pair1 = &v19->_viewMap.__tree_.__pair1_;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)v19->_viewMap.__tree_.__pair1_.__value_.__left_;
      v38 = *((_QWORD *)v19->_viewMap.__tree_.__begin_node_ + 4);
      if (left)
      {
        do
        {
          v39 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)left[1];
        }
        while (left);
      }
      else
      {
        do
        {
          v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)p_pair1[2].__value_.__left_;
          v40 = *v39 == p_pair1;
          p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *)v39;
        }
        while (v40);
      }
      v41 = (uint64_t)&v39[4]->__value_.__left_ - v38 + 1;
      v19->_viewRange.location = v38;
      v19->_viewRange.length = v41;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v42 = v19->_viewModels;
      v43 = 0;
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(_QWORD *)v73 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j);
            if (v43)
            {
              v43 = 1;
            }
            else
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1)
                                                                                 + 8 * (_QWORD)j), "liveTransform"));
              v43 = v48 != 0;

            }
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v47, v49);

          }
          v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        }
        while (v44);
      }

      v19->_containsLiveTransforms = v43;
    }
    else
    {
      v19->_viewRange = (_NSRange)xmmword_22F000;
      v19->_containsLiveTransforms = 0;
    }
    v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "collectInterestWithInvalidationQueue:", v65, obj));
    identifierInterest = v19->_identifierInterest;
    v19->_identifierInterest = (TUIRenderModelIdentifierInterest *)v50;

    objc_storeStrong((id *)&v19->_identifierMap, obja);
    v52 = (NSArray *)objc_msgSend(v67, "copy");
    impressions = v19->_impressions;
    v19->_impressions = v52;

    v54 = (NSArray *)objc_msgSend(v68, "copy");
    linkEntities = v19->_linkEntities;
    v19->_linkEntities = v54;

    v56 = (NSDictionary *)objc_msgSend(v69, "copy");
    hoverRegions = v19->_hoverRegions;
    v19->_hoverRegions = v56;

    v58 = (NSDictionary *)-[NSMutableDictionary copy](v26, "copy");
    identifierToModelMap = v19->_identifierToModelMap;
    v19->_identifierToModelMap = v58;

    v17 = v65;
  }

  return v19;
}

- (id)copyWithContainedSubmodels:(id)a3
{
  id v4;
  id v5;
  TUIFeedEntry *entry;
  char *v7;
  __int128 v8;
  id v9;
  void *v10;
  $7AF9110C763A695B008BC8833C72FFC6 config;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class(self));
  entry = self->_entry;
  config = self->_config;
  v7 = (char *)objc_msgSend(v5, "initWithEntry:submodels:config:impressions:linkEntities:hoverRegions:identifierMap:layoutQueue:", entry, v4, &config, self->_impressions, self->_linkEntities, self->_hoverRegions, self->_identifierMap, self->_layoutQueue);
  *((_OWORD *)v7 + 13) = self->_size;
  v8 = *(_OWORD *)&self->_config.flipHorizontal;
  *((_QWORD *)v7 + 30) = self->_config.zIndex;
  *((_OWORD *)v7 + 14) = v8;
  *((_QWORD *)v7 + 17) = self->_section;
  *(CGPoint *)(v7 + 8) = self->_offset;
  objc_storeStrong((id *)v7 + 16, self->_UUID);
  v9 = -[NSArray copy](self->_errors, "copy");
  v10 = (void *)*((_QWORD *)v7 + 25);
  *((_QWORD *)v7 + 25) = v9;

  return v7;
}

- (NSArray)debugContainedSubmodels
{
  return self->_containedSubmodels;
}

- (id)copyWithErrors:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = -[TUIRenderModelSection copyWithContainedSubmodels:](self, "copyWithContainedSubmodels:", self->_containedSubmodels);
  v6 = objc_msgSend(v4, "copy");
  v7 = (void *)v5[25];
  v5[25] = v6;

  return v5;
}

- (id)copySubmodel:(id)a3 forFinalAppearanceWithFlags:(unint64_t)a4
{
  return 0;
}

- (id)copySubmodel:(id)a3 forInitialAppearanceWithFlags:(unint64_t)a4
{
  return 0;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  NSMutableArray *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_opt_new(NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_viewModels;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = -[TUIRenderModelSection copySubmodel:forInitialAppearanceWithFlags:](self, "copySubmodel:forInitialAppearanceWithFlags:", v10, a3, (_QWORD)v17);
        v12 = v11;
        if (v11)
          v13 = v11;
        else
          v13 = objc_msgSend(v10, "copyForInitialAppearanceWithFlags:", a3);
        v14 = v13;

        -[NSMutableArray addObject:](v5, "addObject:", v14);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = -[TUIRenderModelSection copyWithContainedSubmodels:](self, "copyWithContainedSubmodels:", v5);
  return v15;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  NSMutableArray *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_opt_new(NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_viewModels;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = -[TUIRenderModelSection copySubmodel:forFinalAppearanceWithFlags:](self, "copySubmodel:forFinalAppearanceWithFlags:", v10, a3, (_QWORD)v17);
        v12 = v11;
        if (v11)
          v13 = v11;
        else
          v13 = objc_msgSend(v10, "copyForFinalAppearanceWithFlags:", a3);
        v14 = v13;

        -[NSMutableArray addObject:](v5, "addObject:", v14);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = -[TUIRenderModelSection copyWithContainedSubmodels:](self, "copyWithContainedSubmodels:", v5);
  return v15;
}

- (NSDictionary)identifierToContainedSubmodelMap
{
  return self->_identifierToModelMap;
}

- (unint64_t)kind
{
  return 7;
}

- (_NSRange)viewRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_viewRange.length;
  location = self->_viewRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  __int128 v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  NSArray *v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  __int128 v29;
  __int128 v30;
  NSArray *v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  double v36;
  double v37;
  __int128 v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v47;
  _OWORD v48[3];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGAffineTransform v53;
  _BYTE v54[128];
  _BYTE v55[128];
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v6 = a3;
  objc_msgSend(v6, "visibleBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TUIRenderModelSection frame](self, "frame");
  v15 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v53.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v53.c = v15;
  *(_OWORD *)&v53.tx = *(_OWORD *)&a4->tx;
  v57 = CGRectApplyAffineTransform(v56, &v53);
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;
  objc_msgSend(v6, "visibleBounds");
  v62.origin.x = v20;
  v62.origin.y = v21;
  v62.size.width = v22;
  v62.size.height = v23;
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  if (CGRectIntersectsRect(v58, v62))
  {
    v59.origin.x = v8;
    v59.origin.y = v10;
    v59.size.width = v12;
    v59.size.height = v14;
    if (CGRectIsInfinite(v59))
    {
      v51 = 0uLL;
      v52 = 0uLL;
      v49 = 0uLL;
      v50 = 0uLL;
      v24 = self->_viewModels;
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v26)
              objc_enumerationMutation(v24);
            v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            v29 = *(_OWORD *)&a4->c;
            v48[0] = *(_OWORD *)&a4->a;
            v48[1] = v29;
            v48[2] = *(_OWORD *)&a4->tx;
            objc_msgSend(v28, "appendResourcesToCollector:transform:", v6, v48);
          }
          v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        }
        while (v25);
      }

    }
    else
    {
      memset(&v47, 0, sizeof(v47));
      CGAffineTransformMakeTranslation(&t1, self->_offset.x, self->_offset.y);
      v30 = *(_OWORD *)&a4->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
      *(_OWORD *)&t2.c = v30;
      *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
      CGAffineTransformConcat(&v47, &t1, &t2);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v31 = self->_viewModels;
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(_QWORD *)v42 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v35, "frame");
            v60.origin.x = v36 + self->_offset.x;
            v60.origin.y = v37 + self->_offset.y;
            v38 = *(_OWORD *)&a4->c;
            *(_OWORD *)&v40.a = *(_OWORD *)&a4->a;
            *(_OWORD *)&v40.c = v38;
            *(_OWORD *)&v40.tx = *(_OWORD *)&a4->tx;
            v61 = CGRectApplyAffineTransform(v60, &v40);
            v63.origin.x = v8;
            v63.origin.y = v10;
            v63.size.width = v12;
            v63.size.height = v14;
            if (CGRectIntersectsRect(v61, v63))
            {
              v39 = v47;
              objc_msgSend(v35, "appendResourcesToCollector:transform:", v6, &v39);
            }
          }
          v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
        }
        while (v32);
      }

    }
  }

}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSArray *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = self->_viewModels;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16);
        v18 = *(_OWORD *)&a4->c;
        v19[0] = *(_OWORD *)&a4->a;
        v19[1] = v18;
        v19[2] = *(_OWORD *)&a4->tx;
        objc_msgSend(v17, "appendReferencesToCollector:transform:query:liveTransformResolver:", v10, v19, v11, v12);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 1;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 1;
}

- (id)copyWithSection:(unint64_t)a3 offset:(CGPoint)a4 size:(CGSize)a5 uuid:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  NSUUID *v13;
  TUIRenderModelSection *v14;
  TUIRenderModelSection *v15;
  BOOL v16;
  BOOL v17;
  NSUUID *UUID;
  TUIRenderModelSection *v19;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v13 = (NSUUID *)a6;
  v14 = self;
  v15 = v14;
  if (v14->_section != a3
    || (x == v14->_offset.x ? (v16 = y == v14->_offset.y) : (v16 = 0),
        !v16
     || (width == v14->_size.width ? (v17 = height == v14->_size.height) : (v17 = 0),
         !v17 || (UUID = v14->_UUID, UUID != v13) && (-[NSUUID isEqual:](UUID, "isEqual:", v13) & 1) == 0)))
  {
    v19 = (TUIRenderModelSection *)objc_msgSend(objc_alloc((Class)objc_opt_class(v15)), "_initWithSection:", v15);

    v19->_section = a3;
    v19->_offset.x = x;
    v19->_offset.y = y;
    objc_storeStrong((id *)&v19->_UUID, a6);
    v19->_size.width = width;
    v19->_size.height = height;
    v15 = v19;
  }

  return v15;
}

- (id)copyWithSection:(unint64_t)a3 offset:(CGPoint)a4 uuid:(id)a5
{
  double y;
  double x;
  NSUUID *v10;
  TUIRenderModelSection *v11;
  TUIRenderModelSection *v12;
  BOOL v13;
  NSUUID *UUID;
  TUIRenderModelSection *v15;

  y = a4.y;
  x = a4.x;
  v10 = (NSUUID *)a5;
  v11 = self;
  v12 = v11;
  if (v11->_section != a3
    || (x == v11->_offset.x ? (v13 = y == v11->_offset.y) : (v13 = 0),
        !v13 || (UUID = v11->_UUID, UUID != v10) && (-[NSUUID isEqual:](UUID, "isEqual:", v10) & 1) == 0))
  {
    v15 = (TUIRenderModelSection *)objc_msgSend(objc_alloc((Class)objc_opt_class(v12)), "_initWithSection:", v12);

    v15->_section = a3;
    v15->_offset.x = x;
    v15->_offset.y = y;
    objc_storeStrong((id *)&v15->_UUID, a5);
    v12 = v15;
  }

  return v12;
}

- (void)updateWithSection:(unint64_t)a3 offset:(CGPoint)a4
{
  self->_section = a3;
  self->_offset = a4;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_offset.x;
  y = self->_offset.y;
  width = self->_size.width;
  height = self->_size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)_layoutAttributesForViewModel:(id)a3 index:(unint64_t)a4 withLiveTransformResolver:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v45;
  double v46;
  _OWORD v47[3];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "outsets");
  v46 = v10;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "size");
  v18 = v17;
  objc_msgSend(v8, "size");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", a4, self->_section));
  v22 = +[TUILayoutAttributes newLayoutAttributesWithIndexPath:](TUILayoutAttributes, "newLayoutAttributesWithIndexPath:", v21);

  objc_msgSend(v8, "center");
  v24 = v23;
  v26 = v25;
  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  if (v8)
    objc_msgSend(v8, "transform");
  v27 = objc_msgSend(v8, "zIndex");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "liveTransform"));
  v45 = v16;
  v29 = v14 + v16 + v18;
  v30 = v12 + v46 + v20;

  if (v9 && v28)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "liveLayoutAttributesForRenderModel:", v8));
    objc_msgSend(v31, "size");
    v29 = v32;
    objc_msgSend(v31, "size");
    v30 = v33;
    if (v31)
    {
      objc_msgSend(v31, "transform");
    }
    else
    {
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
    }
    v51 = v48;
    v52 = v49;
    v53 = v50;
    objc_msgSend(v31, "center");
    v24 = v34;
    objc_msgSend(v31, "center");
    v26 = v35;

  }
  objc_msgSend(v8, "size");
  v37 = v36;
  objc_msgSend(v8, "size");
  v39 = v38;
  if (self->_config.flipHorizontal)
    v40 = self->_config.width - (v24 + v29 * 0.5 - (v14 + v37 * 0.5));
  else
    v40 = v24 + v29 * 0.5 - (v14 + v37 * 0.5);
  objc_msgSend(v22, "setBounds:", 0.0, 0.0, v29, v30);
  v47[0] = v51;
  v47[1] = v52;
  v47[2] = v53;
  objc_msgSend(v22, "setTransform:", v47);
  objc_msgSend(v22, "setCenter:", v40, v26 + v30 * 0.5 - (v12 + v39 * 0.5));
  objc_msgSend(v8, "alpha");
  objc_msgSend(v22, "setAlpha:");
  objc_msgSend(v22, "setZIndex:", v27);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "submodel"));
  objc_msgSend(v22, "setRenderModel:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refId"));
  objc_msgSend(v22, "setRefId:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refInstance"));
  objc_msgSend(v22, "setRefInstance:", v43);

  objc_msgSend(v22, "setOutsets:", v12, v14, v46, v45);
  return v22;
}

- (id)_layoutAttributesForImpression:(id)a3 index:(unint64_t)a4 snapshot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", a4, self->_section));
  v11 = +[TUILayoutAttributes newLayoutAttributesWithIndexPath:](TUILayoutAttributes, "newLayoutAttributesWithIndexPath:", v10);

  objc_msgSend(v8, "size");
  v13 = v12;
  objc_msgSend(v8, "size");
  v15 = v14;
  objc_msgSend(v8, "center");
  v18 = v17;
  if (self->_config.flipHorizontal)
    v19 = self->_config.width - v16;
  else
    v19 = v16;
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v13, v15);
  if (v8)
  {
    objc_msgSend(v8, "transform");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
  }
  v24[0] = v25;
  v24[1] = v26;
  v24[2] = v27;
  objc_msgSend(v11, "setTransform:", v24);
  objc_msgSend(v11, "setCenter:", v19, v18);
  objc_msgSend(v11, "setZIndex:", 1000);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "impressionForIdentifier:", v21));
  objc_msgSend(v11, "setGeneric:", v22);

  return v11;
}

- (void)appendLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  NSArray *v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  -[TUIRenderModelSection frame](self, "frame");
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (CGRectIntersectsRect(v30, v32))
  {
    v13 = self->_offset.x;
    v14 = self->_offset.y;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = self->_viewModels;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = x - v13;
      v18 = y - v14;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "liveTransform", (_QWORD)v25));
          v23 = v22 == 0;

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection _layoutAttributesForViewModel:index:withLiveTransformResolver:](self, "_layoutAttributesForViewModel:index:withLiveTransformResolver:", v21, objc_msgSend(v21, "itemIndex"), v12));
            objc_msgSend(v24, "frame");
            v33.origin.x = v17;
            v33.origin.y = v18;
            v33.size.width = width;
            v33.size.height = height;
            if (CGRectIntersectsRect(v31, v33))
              objc_msgSend(v11, "addObject:", v24);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v16);
    }

  }
}

- (void)appendLiveTransformLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  NSArray *v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  CGRect v30;
  CGRect v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v13 = self->_offset.x;
  v14 = self->_offset.y;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = self->_viewModels;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = x - v13;
    v18 = y - v14;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "liveTransform", (_QWORD)v25));
        v23 = v22 == 0;

        if (!v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection _layoutAttributesForViewModel:index:withLiveTransformResolver:](self, "_layoutAttributesForViewModel:index:withLiveTransformResolver:", v21, objc_msgSend(v21, "itemIndex"), v12));
          objc_msgSend(v24, "frame");
          v31.origin.x = v17;
          v31.origin.y = v18;
          v31.size.width = width;
          v31.size.height = height;
          if (CGRectIntersectsRect(v30, v31))
            objc_msgSend(v11, "addObject:", v24);

        }
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

}

- (id)layoutAttributesForViewModel:(id)a3 atIndexPath:(id)a4 withLiveTransformResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection _layoutAttributesForViewModel:index:withLiveTransformResolver:](self, "_layoutAttributesForViewModel:index:withLiveTransformResolver:", v8, objc_msgSend(v9, "tui_row"), v10));

  return v11;
}

- (id)layoutAttributes
{
  NSMutableArray *v3;
  id v4;

  v3 = objc_opt_new(NSMutableArray);
  -[TUIRenderModelSection frame](self, "frame");
  -[TUIRenderModelSection appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:](self, "appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v3, 0);
  -[TUIRenderModelSection frame](self, "frame");
  -[TUIRenderModelSection appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:](self, "appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v3, 0);
  v4 = -[NSMutableArray copy](v3, "copy");

  return v4;
}

- (void)appendImpressionLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 snapshot:(id)a5
{
  id v7;
  id v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v7 = a3;
  v8 = a5;
  if (+[TUIImpressionController debugEnabled](TUIImpressionController, "debugEnabled"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_impressions;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      v12 = 1000000000;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection _layoutAttributesForImpression:index:snapshot:](self, "_layoutAttributesForImpression:index:snapshot:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), (char *)v13 + v12, v8, (_QWORD)v15));
          objc_msgSend(v7, "addObject:", v14);

          v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v12 += (uint64_t)v13;
      }
      while (v10);
    }

  }
}

- (id)layoutAttributesForImpressionAtIndexPath:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (+[TUIImpressionController debugEnabled](TUIImpressionController, "debugEnabled")
    && (unint64_t)objc_msgSend(v6, "tui_row") >= 0x3B9ACA00
    && (v8 = (char *)objc_msgSend(v6, "tui_row"), v8 - 1000000000 < (char *)-[NSArray count](self->_impressions, "count")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_impressions, "objectAtIndexedSubscript:"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection _layoutAttributesForImpression:index:snapshot:](self, "_layoutAttributesForImpression:index:snapshot:", v9, objc_msgSend(v6, "tui_row"), v7));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)layoutAttributesForViewAtIndexPath:(id)a3 withLiveTransformResolver:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  char *left;
  TUIRenderModelSection *p_pair1;
  unint64_t v12;
  BOOL v13;
  char **v14;
  unint64_t begin_node;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = objc_msgSend(v8, "tui_row");
  left = (char *)self->_viewMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_12;
  p_pair1 = (TUIRenderModelSection *)&self->_viewMap.__tree_.__pair1_;
  do
  {
    v12 = *((_QWORD *)left + 4);
    v13 = v12 >= (unint64_t)v9;
    if (v12 >= (unint64_t)v9)
      v14 = (char **)left;
    else
      v14 = (char **)(left + 8);
    if (v13)
      p_pair1 = (TUIRenderModelSection *)left;
    left = *v14;
  }
  while (*v14);
  if (p_pair1 != (TUIRenderModelSection *)&self->_viewMap.__tree_.__pair1_
    && (unint64_t)v9 >= p_pair1->_viewRange.length)
  {
    begin_node = (unint64_t)p_pair1->_viewMap.__tree_.__begin_node_;
  }
  else
  {
LABEL_12:
    begin_node = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (begin_node >= -[NSArray count](self->_viewModels, "count"))
  {
    v16 = 0;
    goto LABEL_17;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_viewModels, "objectAtIndexedSubscript:", begin_node));
  if (!v16)
  {
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection _layoutAttributesForViewModel:index:withLiveTransformResolver:](self, "_layoutAttributesForViewModel:index:withLiveTransformResolver:", v16, objc_msgSend(v8, "tui_row"), v7));
LABEL_18:

  return v17;
}

- (id)viewAtIndexPath:(id)a3 factory:(id)a4 host:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "tui_row") > 0x3B9AC9FF)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewFactoryDequeueReusableSubviewWithReuseIdentifier:indexPath:host:", CFSTR("TUIReuseIdentifierImpressionOverlayView"), v8, v10));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewModelWithIndex:](self, "viewModelWithIndex:", objc_msgSend(v8, "tui_row")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submodel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reuseIdentifier"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewFactoryDequeueReusableSubviewWithReuseIdentifier:indexPath:host:", v13, v8, v10));
  }

  return v14;
}

- (id)viewModelWithIndex:(unint64_t)a3
{
  char *left;
  TUIRenderModelSection *p_pair1;
  unint64_t v6;
  BOOL v7;
  char **v8;
  unint64_t begin_node;
  void *v10;

  left = (char *)self->_viewMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_12;
  p_pair1 = (TUIRenderModelSection *)&self->_viewMap.__tree_.__pair1_;
  do
  {
    v6 = *((_QWORD *)left + 4);
    v7 = v6 >= a3;
    if (v6 >= a3)
      v8 = (char **)left;
    else
      v8 = (char **)(left + 8);
    if (v7)
      p_pair1 = (TUIRenderModelSection *)left;
    left = *v8;
  }
  while (*v8);
  if (p_pair1 != (TUIRenderModelSection *)&self->_viewMap.__tree_.__pair1_ && p_pair1->_viewRange.length <= a3)
    begin_node = (unint64_t)p_pair1->_viewMap.__tree_.__begin_node_;
  else
LABEL_12:
    begin_node = 0x7FFFFFFFFFFFFFFFLL;
  if (begin_node >= -[NSArray count](self->_viewModels, "count", a3))
    v10 = 0;
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_viewModels, "objectAtIndexedSubscript:", begin_node));
  return v10;
}

- (id)viewModelForIndexPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewModelWithIndex:](self, "viewModelWithIndex:", objc_msgSend(v4, "tui_row")));

  return v5;
}

- (id)identifierForViewAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewModelWithIndex:](self, "viewModelWithIndex:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection UUID](self, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tui_identifierByPrependingUUID:", v6));

  return v7;
}

- (id)_initialRenderModelForInsertedRenderModel:(id)a3
{
  return objc_msgSend(a3, "copyWithAlpha:", 0.0);
}

- (id)_finalRenderModelForDeletedRenderModel:(id)a3
{
  return objc_msgSend(a3, "copyWithAlpha:", 0.0);
}

- (id)computeDeletedFrom:(id)a3
{
  id v4;
  void *v5;
  NSArray *viewModels;
  id v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  NSArray *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModels", v4));
  viewModels = self->_viewModels;
  v25 = v5;
  v26 = viewModels;
  v27 = v4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v26, "count"));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v26;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v25;
  v15 = 0;
  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v20));

        if (!v21)
        {
          if (!v15)
            v15 = objc_opt_new(NSMutableArray);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_finalRenderModelForDeletedRenderModel:", v19));
          -[NSMutableArray addObject:](v15, "addObject:", v22);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

  v23 = -[NSMutableArray copy](v15, "copy");
  return v23;
}

- (id)computeInsertedFrom:(id)a3
{
  void *v4;
  NSArray *viewModels;
  NSArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSArray *v14;
  NSMutableArray *v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  NSArray *v26;
  id v27;
  TUIRenderModelSection *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v25 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "viewModels"));
  viewModels = self->_viewModels;
  v27 = v4;
  v6 = viewModels;
  v28 = self;
  v26 = v6;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v6, "count"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v27;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v26;
  v15 = 0;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v20));

        if (!v21)
        {
          if (!v15)
            v15 = objc_opt_new(NSMutableArray);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection _initialRenderModelForInsertedRenderModel:](v28, "_initialRenderModelForInsertedRenderModel:", v19));
          -[NSMutableArray addObject:](v15, "addObject:", v22);

        }
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v16);
  }

  v23 = -[NSMutableArray copy](v15, "copy");
  return v23;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  TUIRenderUpdateArrayContainer *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[TUIRenderUpdateArrayContainer initWithCurrent:from:to:tracker:flags:]([TUIRenderUpdateArrayContainer alloc], "initWithCurrent:from:to:tracker:flags:", v10, v11, self, v12, a6);

  return v13;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  return objc_msgSend(a3, "newToContainerPlusDeletedWithInterests:changes:", a4, 0);
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  return objc_msgSend(a4, "newCurrentContainerPlusInserted", a3);
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class(TUIRenderModelSection);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  LOBYTE(self) = TUIRenderModelArrayContainingIsEqualToRenderModelArrayContaining(self, v7);

  return (char)self;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p"), v6, self);

  objc_msgSend(v7, "appendFormat:", CFSTR(" UUID=%@"), self->_UUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_section));
  objc_msgSend(v7, "appendFormat:", CFSTR(" section=%@"), v8);

  v9 = NSStringFromCGPoint(self->_offset);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v7, "appendFormat:", CFSTR(" offset=%@"), v10);

  v11 = NSStringFromCGSize(self->_size);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v7, "appendFormat:", CFSTR(" size=%@"), v12);

  objc_msgSend(v7, "appendFormat:", CFSTR(" viewModels=%@"), self->_viewModels);
  objc_msgSend(v7, "appendFormat:", CFSTR(">"));
  v13 = objc_msgSend(v7, "copy");

  return (NSString *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "_initWithSection:", self);
  *((_QWORD *)v4 + 17) = self->_section;
  objc_storeStrong((id *)v4 + 16, self->_UUID);
  return v4;
}

- (id)liveTransformsForKind:(Class)a3
{
  id v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = objc_alloc_init((Class)NSHashTable);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_viewModels;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "liveTransform", (_QWORD)v16));
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "liveTransform"));
          v13 = objc_msgSend(v12, "kind") == a3;

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "liveTransform"));
            objc_msgSend(v5, "addObject:", v14);

          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)appendLiveTransformViewInvalidationMap:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSMutableSet *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_viewModels;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "liveTransform", (_QWORD)v15));
        v11 = v10 == 0;

        if (!v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", objc_msgSend(v9, "itemIndex"), self->_section));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "liveTransform"));
          v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v13));
          if (!v14)
          {
            v14 = objc_opt_new(NSMutableSet);
            objc_msgSend(v4, "setObject:forKey:", v14, v13);
          }
          -[NSMutableSet addObject:](v14, "addObject:", v12);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSArray)containedSubmodels
{
  return self->_containedSubmodels;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CGAffineTransform)transform
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[5].d;
  v4 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = v4;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (TUIAnimationGroupRenderModelCollection)animationRenderModels
{
  return self->_animationRenderModels;
}

- (void)setAnimationRenderModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (unint64_t)section
{
  return self->_section;
}

- (BOOL)containsLiveTransforms
{
  return self->_containsLiveTransforms;
}

- (TUIRenderModelIdentifierInterest)identifierInterest
{
  return self->_identifierInterest;
}

- (NSArray)impressions
{
  return self->_impressions;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (NSDictionary)hoverRegions
{
  return self->_hoverRegions;
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (NSDictionary)identifierToModelMap
{
  return self->_identifierToModelMap;
}

- (TUIRenderModelIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- ($2CA2891FAFAFF7AC585D88E48F4DD71B)config
{
  *($7AF9110C763A695B008BC8833C72FFC6 *)retstr = *($7AF9110C763A695B008BC8833C72FFC6 *)((char *)self + 224);
  return self;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_identifierToModelMap, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_hoverRegions, 0);
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_impressions, 0);
  objc_storeStrong((id *)&self->_identifierInterest, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_animationRenderModels, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_containedSubmodels, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  sub_997B8((uint64_t)&self->_viewMap, (_QWORD *)self->_viewMap.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  return self;
}

@end
