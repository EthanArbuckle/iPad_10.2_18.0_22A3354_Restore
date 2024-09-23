@implementation TUILayoutRenderModelCollector

- (TUILayoutRenderModelCollector)init
{
  id v2;
  TUILayoutRenderModelCollector *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUILayoutRenderModelCollector;
  v2 = -[TUILayoutRenderModelCollector init](&v5, "init");
  v3 = (TUILayoutRenderModelCollector *)v2;
  if (v2)
    sub_77344((uint64_t *)v2 + 2, 0x20uLL);
  return v3;
}

- (void)collectWithRoot:(id)a3 options:(unint64_t)a4 entryUUID:(id)a5
{
  char v6;
  vector<TUI::Layout::TUILayoutRenderModelCollector::StackEntry, std::allocator<TUI::Layout::TUILayoutRenderModelCollector::StackEntry>> *p_stack;
  void *v10;
  id v11;
  void *v12;
  StackEntry *value;
  char options;
  __int128 v15;
  StackEntry *end;
  StackEntry *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  CGFloat v23;
  StackEntry **p_end;
  StackEntry *i;
  void *v26;
  void *v27;
  StackEntry *v28;
  unsigned int v29;
  CGFloat b;
  CGFloat a;
  CGFloat d;
  CGFloat c;
  CGFloat tx;
  CGFloat ty;
  __int128 v36;
  StackEntry *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  double y;
  id v61;
  void *v62;
  void *v63;
  TUIImpressionAttributes *v64;
  TUIImpressionAttributes *v65;
  NSMutableArray *impressions;
  NSMutableArray *v67;
  NSMutableArray *v68;
  char v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  TUILinkEntityAttributes *v75;
  TUILinkEntityAttributes *v76;
  NSMutableArray *linkEntities;
  NSMutableArray *v78;
  NSMutableArray *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  StackEntry *v87;
  StackEntry *v88;
  StackEntry *v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  char *v94;
  CGFloat v95;
  uint64_t v96;
  TUILayout *v97;
  __compressed_pair<TUI::Layout::TUILayoutRenderModelCollector::StackEntry *, std::allocator<TUI::Layout::TUILayoutRenderModelCollector::StackEntry>> *p_end_cap;
  id v99;
  id v100;
  TUILayout **p_root;
  _OWORD v102[3];
  _OWORD v103[3];
  CGAffineTransform v104;
  CGAffineTransform v105;
  CGAffineTransform v106;
  CGAffineTransform v107;
  CGAffineTransform v108;
  CGAffineTransform v109;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v112;
  CGAffineTransform v113;
  TUILayout *v114;
  _BYTE v115[55];

  v6 = a4;
  v99 = a3;
  v100 = a5;
  p_root = &self->_root;
  objc_storeStrong((id *)&self->_root, a3);
  p_stack = &self->_stack;
  sub_77DA4((uint64_t)&self->_stack, (uint64_t)self->_stack.__begin_, (uint64_t *)self->_stack.__end_);
  if (self->_root)
  {
    v114 = *p_root;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v114, 1));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectEnumerator"));
    v12 = v11;
    value = self->_stack.__end_cap_.__value_;
    options = (char)self->_options;
    v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v115[7] = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v115[23] = v15;
    *(_OWORD *)&v115[39] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    end = self->_stack.__end_;
    p_end_cap = &self->_stack.__end_cap_;
    if (end >= value)
    {
      v18 = 0x8E38E38E38E38E39 * ((end - p_stack->__begin_) >> 3);
      v19 = v18 + 1;
      if (v18 + 1 > 0x38E38E38E38E38ELL)
        sub_6F9C();
      v20 = 0x8E38E38E38E38E39 * ((value - p_stack->__begin_) >> 3);
      if (2 * v20 > v19)
        v19 = 2 * v20;
      v21 = v20 >= 0x1C71C71C71C71C7 ? 0x38E38E38E38E38ELL : v19;
      *(_QWORD *)&v113.tx = &self->_stack.__end_cap_;
      v22 = v21 ? (char *)sub_78020((uint64_t)&self->_stack.__end_cap_, v21) : 0;
      *(_QWORD *)&v23 = &v22[72 * v18];
      *(_QWORD *)&v113.a = v22;
      v113.b = v23;
      *(_QWORD *)&v113.d = &v22[72 * v21];
      **(_QWORD **)&v23 = 0;
      *(_QWORD *)(*(_QWORD *)&v23 + 8) = v12;
      *(_BYTE *)(*(_QWORD *)&v23 + 16) = options;
      *(_OWORD *)(*(_QWORD *)&v23 + 17) = *(_OWORD *)v115;
      *(_OWORD *)(*(_QWORD *)&v23 + 33) = *(_OWORD *)&v115[16];
      *(_OWORD *)(*(_QWORD *)&v23 + 49) = *(_OWORD *)&v115[32];
      *(_QWORD *)(*(_QWORD *)&v23 + 64) = *(_QWORD *)&v115[47];
      *(_QWORD *)&v113.c = *(_QWORD *)&v23 + 72;
      sub_77FAC((uint64_t *)&self->_stack, &v113);
      v17 = self->_stack.__end_;
      sub_78214((uint64_t)&v113);
    }
    else
    {
      *(_QWORD *)end = 0;
      *((_QWORD *)end + 1) = v11;
      *((_BYTE *)end + 16) = options;
      *(_OWORD *)((char *)end + 17) = *(_OWORD *)v115;
      *(_OWORD *)((char *)end + 33) = *(_OWORD *)&v115[16];
      *(_OWORD *)((char *)end + 49) = *(_OWORD *)&v115[32];
      *((_QWORD *)end + 8) = *(_QWORD *)&v115[47];
      v17 = (StackEntry *)((char *)end + 72);
    }
    self->_stack.__end_ = v17;
    p_end = &self->_stack.__end_;

    *((_BYTE *)*p_end - 56) = *((_BYTE *)*p_end - 56) & 0xFE | v6 & 1;
    *((_BYTE *)*p_end - 56) = *((_BYTE *)*p_end - 56) & 0xFD | v6 & 2;
    *((_BYTE *)*p_end - 56) = *((_BYTE *)*p_end - 56) & 0xFB | v6 & 4;
    for (i = self->_stack.__end_; self->_stack.__begin_ != i; i = self->_stack.__end_)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)i - 8), "nextObject", p_end_cap, v99));
      v27 = v26;
      v28 = self->_stack.__end_;
      if (v26)
      {
        LOBYTE(v29) = *((_BYTE *)v28 - 56);
        if ((objc_msgSend(v26, "hidden") & 1) == 0)
        {
          if ((v29 & 1) != 0)
            v29 = v29 & 0xFE | objc_msgSend(v27, "collectHostingPropertiesWithCollector:", self);
          a = CGAffineTransformIdentity.a;
          b = CGAffineTransformIdentity.b;
          c = CGAffineTransformIdentity.c;
          d = CGAffineTransformIdentity.d;
          tx = CGAffineTransformIdentity.tx;
          ty = CGAffineTransformIdentity.ty;
          v36 = *(_OWORD *)&CGAffineTransformIdentity.c;
          *(_OWORD *)v115 = *(_OWORD *)&CGAffineTransformIdentity.a;
          *(_OWORD *)&v115[16] = v36;
          *(_OWORD *)&v115[32] = *(_OWORD *)&CGAffineTransformIdentity.tx;
          if ((v29 & 6) != 0)
          {
            v37 = self->_stack.__end_;
            v113 = *(CGAffineTransform *)((_BYTE *)v37 - 1);
            objc_msgSend(*((id *)v37 - 9), "computedNaturalSize");
            v39 = v38;
            v41 = v40;
            objc_msgSend(v27, "computedOrigin");
            v43 = v42;
            v45 = v44;
            objc_msgSend(v27, "computedTransformedSize");
            CGAffineTransformMakeTranslation(&t1, v43 + v46 * 0.5 - v39 * 0.5, v45 + v47 * 0.5 - v41 * 0.5);
            t2 = v113;
            CGAffineTransformConcat(&v112, &t1, &t2);
            v48 = v112.a;
            v49 = v112.b;
            v50 = v112.c;
            v51 = v112.d;
            v52 = v112.tx;
            v53 = v112.ty;
            objc_msgSend(v27, "computedTransform");
            v108.a = v48;
            v108.b = v49;
            v108.c = v50;
            v108.d = v51;
            v108.tx = v52;
            v108.ty = v53;
            CGAffineTransformConcat(&v112, &v109, &v108);
            v54 = v112.a;
            v55 = v112.b;
            v56 = v112.c;
            v57 = v112.d;
            v58 = v112.tx;
            v59 = v112.ty;
            objc_msgSend(v27, "renderTransform");
            v106.a = v54;
            v106.b = v55;
            v106.c = v56;
            v106.d = v57;
            v106.tx = v58;
            v106.ty = v59;
            CGAffineTransformConcat(&v112, &v107, &v106);
            a = v112.a;
            b = v112.b;
            c = v112.c;
            d = v112.d;
            tx = v112.tx;
            ty = v112.ty;
            y = CGPointZero.y;
            v105 = v112;
            CGAffineTransformMakeTranslation(&v104, -(v112.tx + v112.c * y + v112.a * CGPointZero.x), -(v112.ty + v112.d * y + v112.b * CGPointZero.x));
            CGAffineTransformConcat((CGAffineTransform *)v115, &v105, &v104);
            if ((v29 & 2) == 0)
              goto LABEL_36;
          }
          else if ((v29 & 2) == 0)
          {
LABEL_36:
            if ((v29 & 4) != 0)
            {
              v70 = *((id *)self->_stack.__end_ - 9);
              v71 = v70;
              if (v70 && (objc_msgSend(v70, "collectLinkEntitiesForChild:", v27) & 1) == 0)
              {
                LOBYTE(v29) = v29 & 0xFB;
              }
              else
              {

                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "collectLinkEntities"));
                if (v71)
                {
                  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "box"));
                  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "identifier"));
                  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "tui_identifierByPrependingUUID:", v100));

                  v75 = [TUILinkEntityAttributes alloc];
                  objc_msgSend(v27, "computedNaturalSize");
                  v102[0] = *(_OWORD *)v115;
                  v102[1] = *(_OWORD *)&v115[16];
                  v102[2] = *(_OWORD *)&v115[32];
                  v76 = -[TUILinkEntityAttributes initWithIdentifier:linkEntities:size:center:transform:](v75, "initWithIdentifier:linkEntities:size:center:transform:", v74, v71, v102);
                  linkEntities = self->_linkEntities;
                  if (!linkEntities)
                  {
                    v78 = objc_opt_new(NSMutableArray);
                    v79 = self->_linkEntities;
                    self->_linkEntities = v78;

                    linkEntities = self->_linkEntities;
                  }
                  -[NSMutableArray addObject:](linkEntities, "addObject:", v76);

                }
                if (objc_msgSend(v27, "collectLinkEntitiesForChildren"))
                  v80 = 4;
                else
                  v80 = 0;
                LOBYTE(v29) = v80 | v29 & 0xFB;
              }

            }
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "children"));
            v82 = v81;
            if ((v29 & 7) != 0 && objc_msgSend(v81, "count"))
            {
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectEnumerator"));
              v84 = v27;
              v85 = v83;
              v86 = v85;
              v87 = self->_stack.__end_;
              v88 = self->_stack.__end_cap_.__value_;
              if (v87 >= v88)
              {
                v90 = 0x8E38E38E38E38E39 * ((v87 - p_stack->__begin_) >> 3);
                v91 = v90 + 1;
                if (v90 + 1 > 0x38E38E38E38E38ELL)
                  sub_6F9C();
                v92 = 0x8E38E38E38E38E39 * ((v88 - p_stack->__begin_) >> 3);
                if (2 * v92 > v91)
                  v91 = 2 * v92;
                if (v92 >= 0x1C71C71C71C71C7)
                  v93 = 0x38E38E38E38E38ELL;
                else
                  v93 = v91;
                *(_QWORD *)&v113.tx = p_end_cap;
                v94 = (char *)sub_78020((uint64_t)p_end_cap, v93);
                *(_QWORD *)&v95 = &v94[72 * v90];
                *(_QWORD *)&v113.a = v94;
                v113.b = v95;
                *(_QWORD *)&v113.d = &v94[72 * v96];
                **(_QWORD **)&v95 = v84;
                *(_QWORD *)(*(_QWORD *)&v95 + 8) = v86;
                *(_BYTE *)(*(_QWORD *)&v95 + 16) = v29;
                *(CGFloat *)(*(_QWORD *)&v95 + 24) = a;
                *(CGFloat *)(*(_QWORD *)&v95 + 32) = b;
                *(CGFloat *)(*(_QWORD *)&v95 + 40) = c;
                *(CGFloat *)(*(_QWORD *)&v95 + 48) = d;
                *(CGFloat *)(*(_QWORD *)&v95 + 56) = tx;
                *(CGFloat *)(*(_QWORD *)&v95 + 64) = ty;
                *(_QWORD *)&v113.c = *(_QWORD *)&v95 + 72;
                sub_77FAC((uint64_t *)&self->_stack, &v113);
                v89 = self->_stack.__end_;
                sub_78214((uint64_t)&v113);
              }
              else
              {
                *(_QWORD *)v87 = v84;
                *((_QWORD *)v87 + 1) = v85;
                *((_BYTE *)v87 + 16) = v29;
                *((CGFloat *)v87 + 3) = a;
                *((CGFloat *)v87 + 4) = b;
                *((CGFloat *)v87 + 5) = c;
                *((CGFloat *)v87 + 6) = d;
                v89 = (StackEntry *)((char *)v87 + 72);
                *((CGFloat *)v87 + 7) = tx;
                *((CGFloat *)v87 + 8) = ty;
              }
              self->_stack.__end_ = v89;

            }
            goto LABEL_62;
          }
          v61 = *((id *)self->_stack.__end_ - 9);
          v62 = v61;
          if (v61 && (objc_msgSend(v61, "collectImpressionsForChild:", v27) & 1) == 0)
          {
            LOBYTE(v29) = v29 & 0xFD;
          }
          else
          {

            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "box"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "impressionData"));

            if (v62)
            {
              v64 = [TUIImpressionAttributes alloc];
              objc_msgSend(v27, "computedNaturalSize");
              v103[0] = *(_OWORD *)v115;
              v103[1] = *(_OWORD *)&v115[16];
              v103[2] = *(_OWORD *)&v115[32];
              v65 = -[TUIImpressionAttributes initWithData:size:center:transform:](v64, "initWithData:size:center:transform:", v62, v103);
              impressions = self->_impressions;
              if (!impressions)
              {
                v67 = objc_opt_new(NSMutableArray);
                v68 = self->_impressions;
                self->_impressions = v67;

                impressions = self->_impressions;
              }
              -[NSMutableArray addObject:](impressions, "addObject:", v65);

            }
            if (objc_msgSend(v27, "collectImpressionsForChildren"))
              v69 = 2;
            else
              v69 = 0;
            LOBYTE(v29) = v69 | v29 & 0xFD;
          }

          goto LABEL_36;
        }
      }
      else
      {
        sub_782A0((uint64_t)&self->_stack, (uint64_t)v28 - 72);
      }
LABEL_62:

    }
  }
  v97 = *p_root;
  *p_root = 0;

}

- (void)hostingCollectorAddProperties:(id)a3 forIdentifier:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *hostingIdentifiersOrder;
  NSMutableDictionary *v9;
  NSMutableDictionary *hostingPropertiesMap;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!self->_hostingIdentifiersOrder)
  {
    v7 = objc_opt_new(NSMutableArray);
    hostingIdentifiersOrder = self->_hostingIdentifiersOrder;
    self->_hostingIdentifiersOrder = v7;

  }
  if (!self->_hostingPropertiesMap)
  {
    v9 = objc_opt_new(NSMutableDictionary);
    hostingPropertiesMap = self->_hostingPropertiesMap;
    self->_hostingPropertiesMap = v9;

  }
  -[NSMutableArray addObject:](self->_hostingIdentifiersOrder, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hostingPropertiesMap, "setObject:forKeyedSubscript:", v11, v6);

}

- (id)hostingCollectorFinalizeMap
{
  TUIHostingMap *v2;

  if (self->_hostingPropertiesMap)
    v2 = -[TUIHostingMap initWithMap:order:]([TUIHostingMap alloc], "initWithMap:order:", self->_hostingPropertiesMap, self->_hostingIdentifiersOrder);
  else
    v2 = 0;
  return v2;
}

- (id)finalizeImpressions
{
  return -[NSMutableArray copy](self->_impressions, "copy");
}

- (id)finalizeLinkEntities
{
  return -[NSMutableArray copy](self->_linkEntities, "copy");
}

- (TUILayout)root
{
  return self->_root;
}

- (void).cxx_destruct
{
  vector<TUI::Layout::TUILayoutRenderModelCollector::StackEntry, std::allocator<TUI::Layout::TUILayoutRenderModelCollector::StackEntry>> *p_stack;

  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_impressions, 0);
  objc_storeStrong((id *)&self->_hostingPropertiesMap, 0);
  objc_storeStrong((id *)&self->_hostingIdentifiersOrder, 0);
  p_stack = &self->_stack;
  sub_78384((void ***)&p_stack);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) &= 0xF8u;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
