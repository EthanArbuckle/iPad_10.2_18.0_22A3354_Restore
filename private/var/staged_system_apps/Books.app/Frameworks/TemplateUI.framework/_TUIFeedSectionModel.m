@implementation _TUIFeedSectionModel

- (void)appendVisibleView:(id)a3
{
  _QWORD *i;

  for (i = self->_visibleViews.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
    objc_msgSend(a3, "addObject:", i[3]);
}

- (void)appendRenderOverrideObservers:(id)a3
{
  id *i;

  for (i = (id *)self->_visibleViews.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
    objc_msgSend(i[3], "appendRenderOverrideObservers:", a3);
}

- (void)updateVisible:(BOOL)a3 bounds:(CGRect)a4 host:(id)a5 liveTransformResolver:(id)a6 factory:(id)a7 feedView:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  NSMutableArray *v17;
  void *v18;
  BOOL v19;
  TUIRenderModelSection *renderModel;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  uint64_t *v31;
  uint64_t *v32;
  __CFString *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  id v37;
  void *v38;
  TUIRenderModelSection *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  _QWORD *k;
  uint64_t *v45;
  uint64_t **m;
  uint64_t v47;
  uint64_t *v48;
  void *v49;
  TUIMutableViewState *currentViewState;
  void *v51;
  void *v52;
  uint64_t *v53;
  void *v54;
  id v55;
  id v56;
  NSObject *v57;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD *j;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  uint64_t v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  const __CFString *v81;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  NSMutableArray *v93;
  id v94;
  unordered_set<unsigned long, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>> *p_invalidatedViews;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  NSMutableArray *obj;
  void *v101;
  id v102;
  unordered_map<unsigned long, UIView<TUIReusableRenderView> *__unsafe_unretained, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, UIView<TUIReusableRenderView> *__unsafe_unretained>>> *p_visibleViews;
  void *v104;
  TUIRenderModelSection *v105;
  void *v106;
  __CFString *v107;
  _TUIFeedSectionModel *v108;
  void *v109;
  void *v110;
  _QWORD v111[4];
  uint64_t *v112;
  _QWORD v113[5];
  id v114;
  unint64_t v115;
  _QWORD v116[4];
  id v117;
  id v118;
  _TUIFeedSectionModel *v119;
  id v120;
  id v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[2];
  uint64_t **v128;
  uint64_t v129;
  uint64_t *v130;
  _QWORD v131[5];
  _QWORD v132[5];
  _BYTE buf[12];
  __int16 v134;
  void *v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  __CFString *v141;
  _BYTE v142[128];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v92 = a3;
  v16 = a5;
  v94 = a6;
  v102 = a7;
  v99 = a8;
  v108 = self;
  v101 = v16;
  sub_1237F0((uint64_t)v127, (uint64_t)&self->_reuseSuspendedViews);
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tui_hostingView"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "subviewsDelegate"));
  v17 = objc_opt_new(NSMutableArray);
  v93 = v17;
  -[TUIRenderModelSection appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:](self->_renderModel, "appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v17, v94, x, y, width, height);
  if (v92)
    -[TUIRenderModelSection appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:](self->_renderModel, "appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v17, v94, x, y, width, height);
  if (-[NSMutableArray count](v17, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "impressionSnapshot"));
    v19 = v18 == 0;

    if (!v19)
    {
      renderModel = self->_renderModel;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "impressionSnapshot"));
      -[TUIRenderModelSection appendImpressionLayoutAttributes:forElementsInRect:snapshot:](renderModel, "appendImpressionLayoutAttributes:forElementsInRect:snapshot:", v93, v21, x, y, width, height);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "overrides"));
    v23 = v22 == 0;

    if (!v23)
      objc_msgSend(v99, "_updateLayoutAttributes:", v93);
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    obj = v93;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v123, v142, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v124;
      p_visibleViews = &self->_visibleViews;
      p_invalidatedViews = &self->_invalidatedViews;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v124 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "indexPath"));
          v122 = 0;
          v110 = v28;
          v122 = objc_msgSend(v28, "tui_row");
          v109 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewModelWithIndex:](v108->_renderModel, "viewModelWithIndex:", v122));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "submodel"));
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "reuseIdentifier"));

          v31 = sub_123A7C(p_visibleViews, (unint64_t *)&v122);
          v32 = v31;
          if (v109)
          {
            if (v31)
            {
              v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31[3], "reuseIdentifier"));
              if (v33 == v30)
              {

LABEL_31:
                v43 = v32[3];
                *(_QWORD *)buf = &v122;
                sub_123B30((uint64_t)v127, (unint64_t *)&v122, (uint64_t)&std::piecewise_construct, (_QWORD **)buf)[3] = v43;
                sub_35264(p_visibleViews, v32);
                goto LABEL_32;
              }
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v32[3], "reuseIdentifier"));
              v35 = objc_msgSend(v34, "isEqualToString:", v30);

              if ((v35 & 1) != 0)
                goto LABEL_31;
              if (_TUIDeviceHasInternalInstall())
              {
                v55 = (id)v32[3];
                v104 = v55;
                v56 = TUIDefaultLog();
                v57 = objc_claimAutoreleasedReturnValue(v56);
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                {
                  v59 = (unint64_t)v122;
                  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "layoutAttributes"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "renderModel"));
                  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifier"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "tui_identifierToString"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "reuseIdentifier"));
                  v64 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewModelWithIndex:](v108->_renderModel, "viewModelWithIndex:", v122));
                  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "identifier"));
                  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "tui_identifierToString"));
                  *(_DWORD *)buf = 134219010;
                  *(_QWORD *)&buf[4] = v59;
                  v134 = 2112;
                  v135 = v62;
                  v136 = 2112;
                  v137 = v63;
                  v138 = 2112;
                  v139 = v66;
                  v140 = 2112;
                  v141 = v30;
                  _os_log_error_impl(&dword_0, v57, OS_LOG_TYPE_ERROR, "[%lu] view re-used with mismatching reuseIdentifier (%@,%@) vs (%@,%@)", buf, 0x34u);

                }
                for (j = v108->_reuseSuspendedViews.__table_.__p1_.__value_.__next_; j; j = (_QWORD *)*j)
                {
                  v83 = j[2];
                  v84 = (void *)j[3];
                  v85 = TUIDefaultLog();
                  v86 = objc_claimAutoreleasedReturnValue(v85);
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                  {
                    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "layoutAttributes"));
                    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "renderModel"));
                    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "identifier"));
                    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "tui_identifierToString"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "reuseIdentifier"));
                    *(_DWORD *)buf = 134218498;
                    *(_QWORD *)&buf[4] = v83;
                    v134 = 2112;
                    v135 = v90;
                    v136 = 2112;
                    v137 = v91;
                    _os_log_error_impl(&dword_0, v86, OS_LOG_TYPE_ERROR, "[%lu] suspended reuse (%@,%@)", buf, 0x20u);

                  }
                }
                v68 = objc_alloc((Class)NSException);
                v132[0] = v110;
                v131[0] = CFSTR("indexPath");
                v131[1] = CFSTR("viewIdentifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "layoutAttributes"));
                v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "renderModel"));
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "identifier"));
                v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "tui_identifierToString"));
                v73 = (void *)v72;
                if (v72)
                  v74 = (const __CFString *)v72;
                else
                  v74 = CFSTR("nil");
                v132[1] = v74;
                v131[2] = CFSTR("viewReuseIdentifier");
                v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "reuseIdentifier"));
                v76 = (void *)v75;
                if (v75)
                  v77 = (const __CFString *)v75;
                else
                  v77 = CFSTR("nil");
                v132[2] = v77;
                v131[3] = CFSTR("renderIdentifier");
                v78 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewModelWithIndex:](v108->_renderModel, "viewModelWithIndex:", v122));
                v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "identifier"));
                v107 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "tui_identifierToString"));
                v80 = v107;
                if (!v107)
                  v80 = CFSTR("nil");
                v131[4] = CFSTR("renderReuseIdentifier");
                if (v30)
                  v81 = v30;
                else
                  v81 = CFSTR("nil");
                v132[3] = v80;
                v132[4] = v81;
                v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v132, v131, 5));
                v82 = objc_msgSend(v68, "initWithName:reason:userInfo:", CFSTR("InvalidReuse"), CFSTR("A view with the wrong identifier is being re-used"), v96);

                objc_exception_throw(v82);
              }
            }
          }
          else if (v31)
          {
            goto LABEL_31;
          }
          v36 = v27;
          v37 = objc_msgSend(v36, "zIndex");
          v105 = v108->_renderModel;
          if (v108->_previousRenderModel && sub_123A7C(p_invalidatedViews, (unint64_t *)&v122))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection layoutAttributesForViewAtIndexPath:withLiveTransformResolver:](v108->_previousRenderModel, "layoutAttributesForViewAtIndexPath:withLiveTransformResolver:", v110, v94));
            if (v38)
            {
              v39 = v108->_previousRenderModel;

              v40 = v38;
              v105 = v39;
              v36 = v40;
            }

          }
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewAtIndexPath:factory:host:](v105, "viewAtIndexPath:factory:host:", v110, v102, v101));
          if (v41)
          {
            v116[0] = _NSConcreteStackBlock;
            v116[1] = 3221225472;
            v116[2] = sub_11CBF8;
            v116[3] = &unk_241CB8;
            v117 = v97;
            v42 = v41;
            v121 = v37;
            v118 = v42;
            v119 = v108;
            v120 = v36;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v116);
            if (v108->_currentViewState)
            {
              v113[0] = _NSConcreteStackBlock;
              v113[1] = 3221225472;
              v113[2] = sub_11CF7C;
              v113[3] = &unk_241CE0;
              v113[4] = v108;
              v115 = (unint64_t)v122;
              v114 = v42;
              +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v113);

            }
            objc_msgSend(v98, "feedView:willDisplayView:atIndexPath:", v99, v42, v110);
            objc_msgSend(v42, "viewWillDisplay");
            *(_QWORD *)buf = &v122;
            sub_123B30((uint64_t)v127, (unint64_t *)&v122, (uint64_t)&std::piecewise_construct, (_QWORD **)buf)[3] = v42;

          }
LABEL_32:

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v123, v142, 16);
      }
      while (v24);
    }

  }
  sub_2A7FC((uint64_t)&v108->_visibleViews, (uint64_t)v127);
  for (k = v108->_reuseSuspendedViews.__table_.__p1_.__value_.__next_; k; k = (_QWORD *)*k)
  {
    v45 = sub_123A7C(v127, k + 2);
    if (v45)
      sub_35264(v127, v45);
  }
  if (v129)
  {
    for (m = v128; m; m = (uint64_t **)*m)
    {
      v47 = (uint64_t)m[2];
      v48 = m[3];
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "viewStateSave"));
      if (v49)
      {
        currentViewState = v108->_currentViewState;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection identifierForViewAtIndex:](v108->_renderModel, "identifierForViewAtIndex:", v47));
        -[TUIMutableViewState setViewState:forIdentifier:](currentViewState, "setViewState:forIdentifier:", v49, v51);

      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", m[2], v108->_sectionIndex));
      objc_msgSend(v98, "feedView:didEndDisplayView:atIndexPath:", v99, v48, v52);

      v111[0] = _NSConcreteStackBlock;
      v111[1] = 3221225472;
      v111[2] = sub_11D008;
      v111[3] = &unk_241D08;
      v53 = v48;
      v112 = v53;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v111);
      v130 = v53;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v130, 1));
      objc_msgSend(v102, "viewFactoryReuseSubviews:host:", v54, v101);

    }
  }
  v108->_visible = v92;

  sub_14B0C((uint64_t)v127);
}

- (void)updateInvalidatedWithHost:(id)a3 liveTransformResolver:(id)a4 factory:(id)a5 feedView:(id)a6
{
  void *v10;
  uint64_t v11;
  _QWORD *next;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  TUIRenderModelSection *renderModel;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void (**v28)(_QWORD, _QWORD);
  id v29;
  id v30;
  NSObject *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  char v51;
  void *v52;
  unordered_map<unsigned long, UIView<TUIReusableRenderView> *__unsafe_unretained, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, UIView<TUIReusableRenderView> *__unsafe_unretained>>> *p_visibleViews;
  _TUIFeedSectionModel *v54;
  _OWORD v55[2];
  int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  void (**v62)(_QWORD, _QWORD);
  _QWORD v63[4];
  id v64;
  id v65;
  NSObject *v66;
  _BYTE v67[128];
  id v68;
  void *v69;

  v46 = a3;
  v49 = a4;
  v43 = a5;
  v50 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "currentUpdateCollection"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changes"));

  v47 = (void *)v11;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "subviewsDelegate"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "overrides"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "impressionSnapshot"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "animatedUpdateCompletionGroup"));
  next = self->_invalidatedViews.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v51 = 0;
    p_visibleViews = &self->_visibleViews;
    v54 = self;
    do
    {
      *(_QWORD *)&v55[0] = next[2];
      v13 = sub_123A7C(p_visibleViews, (unint64_t *)v55);
      v14 = v13;
      if (v13)
      {
        v15 = (id)v13[3];
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", *(_QWORD *)&v55[0], v54->_sectionIndex));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection layoutAttributesForViewAtIndexPath:withLiveTransformResolver:](v54->_renderModel, "layoutAttributesForViewAtIndexPath:withLiveTransformResolver:", v16, v49));
        if (v17)
          v18 = 1;
        else
          v18 = v52 == 0;
        if (!v18)
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection layoutAttributesForImpressionAtIndexPath:snapshot:](v54->_renderModel, "layoutAttributesForImpressionAtIndexPath:snapshot:", v16, v52));
        if (v17)
        {
          if (v48)
          {
            v69 = v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
            objc_msgSend(v50, "_updateLayoutAttributes:", v19);

          }
          v20 = objc_msgSend(v17, "zIndex", v43);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layoutAttributes"));
          v22 = v20 != objc_msgSend(v21, "zIndex");

          TUIReusableSubviewApplyLayoutAttributes(v15, v17);
          renderModel = v54->_renderModel;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "inserts"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "updates"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "deletes"));
          v27 = TUIAnimationCollectionViewAnimationForView(renderModel, v15, v17, v24, v25, v26);
          v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v27);

          v51 |= v22;
          if (v28)
          {
            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472;
            v63[2] = sub_11D704;
            v63[3] = &unk_241D30;
            v29 = v50;
            v64 = v29;
            v30 = v15;
            v65 = v30;
            v31 = v45;
            v66 = v31;
            v32 = objc_retainBlock(v63);
            if (v45)
              dispatch_group_enter(v31);
            objc_msgSend(v29, "suspendReuseOfView:", v30);
            ((void (**)(_QWORD, _QWORD *))v28)[2](v28, v32);

          }
        }
        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", *(_QWORD *)&v55[0], v54->_sectionIndex));
          objc_msgSend(v44, "feedView:didEndDisplayView:atIndexPath:", v50, v15, v33);

          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_11D740;
          v61[3] = &unk_241D08;
          v34 = v15;
          v62 = (void (**)(_QWORD, _QWORD))v34;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v61);
          v68 = v34;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v68, 1));
          objc_msgSend(v43, "viewFactoryReuseSubviews:host:", v35, v46);

          sub_35264(p_visibleViews, v14);
          v28 = v62;
        }

      }
      next = (_QWORD *)*next;
    }
    while (next);
    self = v54;
    if ((v51 & 1) != 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "tui_hostingView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "subviews"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "sortedArrayUsingComparator:", &stru_241D50));

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v39 = v38;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v41)
              objc_enumerationMutation(v39);
            objc_msgSend(v36, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i), v43);
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        }
        while (v40);
      }

      self = v54;
    }
  }
  memset(v55, 0, sizeof(v55));
  v56 = 1065353216;
  sub_87C08((uint64_t)&self->_invalidatedViews, (uint64_t *)v55);
  sub_14B0C((uint64_t)v55);

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  id *i;

  if (self->_semanticContentAttribute != a3)
  {
    self->_semanticContentAttribute = a3;
    for (i = (id *)self->_visibleViews.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
      objc_msgSend(i[3], "setSemanticContentAttribute:", self->_semanticContentAttribute);
  }
}

- (id)visibleViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v9 = objc_msgSend(v4, "tui_row"),
        (v6 = sub_123A7C(&self->_visibleViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v9)) != 0))
  {
    v7 = (id)v6[3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)invalidateViewAtIndexPath:(id)a3
{
  id v4;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "tui_row");
  sub_123D4C((uint64_t)&self->_invalidatedViews, (unint64_t *)&v6, &v6);

  return 1;
}

- (void)suspendReuseOfView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unordered_map<unsigned long, UIView<TUIReusableRenderView> *__unsafe_unretained, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, UIView<TUIReusableRenderView> *__unsafe_unretained>>> *p_reuseSuspendedViews;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  id *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPath"));

  v10 = objc_msgSend(v6, "tui_row");
  p_reuseSuspendedViews = &self->_reuseSuspendedViews;
  if (!sub_123A7C(&self->_reuseSuspendedViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v10))
  {
    v8 = sub_123A7C(&self->_visibleViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v10);
    if (v8)
    {
      v9 = v8[3];
      v11 = &v10;
      sub_123B30((uint64_t)p_reuseSuspendedViews, (unint64_t *)&v10, (uint64_t)&std::piecewise_construct, &v11)[3] = v9;
    }
  }

}

- (void)resumeReuseOfView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "layoutAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));

  v7 = objc_msgSend(v5, "tui_row");
  v6 = sub_123A7C(&self->_reuseSuspendedViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v7);
  if (v6)
  {
    sub_123A7C(&self->_visibleViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v7);
    sub_35264(&self->_reuseSuspendedViews.__table_.__bucket_list_.__ptr_.__value_, v6);
  }

}

- (TUIRenderModelSection)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (TUIRenderModelSection)previousRenderModel
{
  return self->_previousRenderModel;
}

- (void)setPreviousRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_previousRenderModel, a3);
}

- (TUIMutableViewState)currentViewState
{
  return self->_currentViewState;
}

- (void)setCurrentViewState:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewState, a3);
}

- (BOOL)visible
{
  return self->_visible;
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

- (int64_t)semanticContentAttribute
{
  return self->_semanticContentAttribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentViewState, 0);
  objc_storeStrong((id *)&self->_previousRenderModel, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  sub_14B0C((uint64_t)&self->_invalidatedViews);
  sub_14B0C((uint64_t)&self->_visibleViews);
  sub_14B0C((uint64_t)&self->_reuseSuspendedViews);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end
