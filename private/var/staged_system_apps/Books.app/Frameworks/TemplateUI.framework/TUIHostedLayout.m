@implementation TUIHostedLayout

- (TUIHostedLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8;
  TUIHostedLayout *v9;
  TUIHostedLayout *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TUIHostedLayout;
  v9 = -[TUILayout initWithModel:parent:controller:](&v14, "initWithModel:parent:controller:", a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v9, "box"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hostingIdentifier"));
    objc_msgSend(v8, "registerHostingLayout:forIdentifier:", v10, v12);

  }
  return v10;
}

- (CGSize)hostingRequestedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_requestedSize.width;
  height = self->_requestedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)computeLayout
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TUIHostingGeometry *hostingGeometry;
  double v12;
  double v13;
  double v15;
  double v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  TUIHostingGeometry *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  TUIHostingGeometry *v35;
  CGSize v36;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  -[TUILayout computeHeight](self, "computeHeight");
  v6 = v5;
  self->_requestedSize.width = v4;
  self->_requestedSize.height = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostingIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostingGeometryForIdentifier:requestedSize:", v9, self->_requestedSize.width, self->_requestedSize.height));

  hostingGeometry = self->_hostingGeometry;
  self->_hostingGeometry = 0;

  if (v10)
  {
    objc_msgSend(v10, "requestedSize");
    if (self->_requestedSize.width == v13 && self->_requestedSize.height == v12)
    {
      objc_msgSend(v10, "layoutSize");
      v4 = v15;
      v6 = v16;
      objc_storeStrong((id *)&self->_hostingGeometry, v10);
    }
  }
  v17 = TUIHostingLog();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v20 = objc_msgSend(v19, "feedId");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hostingIdentifier"));
    v36.width = v4;
    v36.height = v6;
    v23 = NSStringFromCGSize(v36);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = self->_hostingGeometry;
    v26 = 134219010;
    v27 = v20;
    v28 = 2112;
    v29 = v22;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v24;
    v34 = 2112;
    v35 = v25;
    _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "[fid:%lu] computeLayout identifier=%@ geomtry=%@ layoutSize=%@ hostingGeomeetry=%@", (uint8_t *)&v26, 0x34u);

  }
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v6);

}

- (void)onInvalidate
{
  TUIHostingGeometry *hostingGeometry;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIHostedLayout;
  -[TUILayout onInvalidate](&v4, "onInvalidate");
  hostingGeometry = self->_hostingGeometry;
  self->_hostingGeometry = 0;

}

- (BOOL)collectHostingPropertiesWithCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingIdentifier"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingProperties"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingIdentifier"));
    objc_msgSend(v4, "hostingCollectorAddProperties:forIdentifier:", v7, v8);

  }
  return 0;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  TUIHostedLayout *v15;
  id v16;
  unint64_t v17;
  TUIHostedLayout *v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  CGFloat *p_ty;
  void *v24;
  id v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  float64_t v34;
  float64x2_t v35;
  float64x2_t v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGSize *p_requestedSize;
  _BOOL8 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  id v62;
  void *v63;
  void *v64;
  NSString *v65;
  void *v66;
  NSString *v67;
  void *v68;
  void *v69;
  TUIHostedLayout *v70;
  void *v71;
  int64x2_t v72;
  double v73;
  float64x2_t v74;
  void *v75;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE buf[64];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  CGSize v139;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostingIdentifier"));

  v9 = 0;
  if (a3 >= 4 && v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anchorRefId"));
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anchorRefId"));
      v13 = sub_51730(self, 0, 1, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (v14)
      {
        v15 = self;
        v71 = v14;
        v16 = v14;
        v138 = 0u;
        v137 = 0u;
        v136 = 0u;
        v135 = 0u;
        v134 = 0u;
        v133 = 0u;
        v132 = 0u;
        v131 = 0u;
        v130 = 0u;
        v129 = 0u;
        v128 = 0u;
        v127 = 0u;
        v126 = 0u;
        v125 = 0u;
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        memset(buf, 0, sizeof(buf));
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v81 = 0u;
        memset(&v80, 0, sizeof(v80));
        v70 = v15;
        v17 = 0;
        if (v15)
        {
          do
          {
            v18 = v15;
            v19 = v17++;
            *(_QWORD *)&buf[8 * v19] = v15;
            v15 = (TUIHostedLayout *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](v15, "layoutAncestor"));

            v20 = v15 != 0;
          }
          while (v19 <= 0x3E && v15);
        }
        else
        {
          v20 = 0;
        }
        v22 = 0;
        p_ty = &v79.ty;
        v69 = v16;
        do
        {
          v24 = v16;
          *((_QWORD *)p_ty++ + 1) = v16;
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutAncestor"));

          if (v22 > 0x3E)
            break;
          ++v22;
        }
        while (v16);
        v25 = 0;
        if (v16)
          v26 = 1;
        else
          v26 = v20;
        if ((v26 & 1) != 0)
        {
          v14 = v71;
        }
        else
        {
          v14 = v71;
          if (v17)
          {
            v27 = v17;
            do
            {
              v28 = v27 - 1;
              v29 = *(_QWORD *)&buf[8 * v27 - 8];
              v30 = *(_QWORD *)p_ty--;
              --v27;
            }
            while (v29 == v30);
            if (v28 >= v17)
              v31 = 0;
            else
              v31 = *(void **)&buf[8 * v28 + 8];
            v25 = v31;
          }
        }

        if (v25)
        {
          memset(buf, 0, 48);
          objc_msgSend(v69, "computedTransformInAncestorLayout:", v25);
          memset(&v80, 0, sizeof(v80));
          -[TUILayout computedTransformInAncestorLayout:](v70, "computedTransformInAncestorLayout:", v25);
          CGAffineTransformInvert(&v80, &v79);
          t1 = *(CGAffineTransform *)buf;
          memset(&v78, 0, sizeof(v78));
          t2 = v80;
          CGAffineTransformConcat(&v78, &t1, &t2);
          objc_msgSend(v69, "computedNaturalSize");
          v73 = v32 * 0.5;
          objc_msgSend(v69, "computedNaturalSize");
          v74 = vaddq_f64(*(float64x2_t *)&v78.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v78.c, v33 * 0.5), *(float64x2_t *)&v78.a, v73));
          -[TUILayout computedNaturalSize](v70, "computedNaturalSize");
          v35.f64[1] = v34;
          __asm { FMOV            V1.2D, #1.0 }
          v41 = vmaxnmq_f64(vminnmq_f64(vdivq_f64(v74, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q1, v35), (int8x16_t)_Q1, (int8x16_t)v35)), _Q1), (float64x2_t)0);
        }
        else
        {
          v41 = (float64x2_t)vdupq_n_s64(0x7FF8000000000000uLL);
        }
        v72 = (int64x2_t)v41;

      }
      else
      {
        v72 = vdupq_n_s64(0x7FF8000000000000uLL);
      }

      v21 = v72.i64[1];
    }
    else
    {
      v21 = 0x7FF8000000000000;
      v72.i64[0] = 0x7FF8000000000000;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v6);
    v44 = v43;
    v46 = v45;
    p_requestedSize = &self->_requestedSize;
    v48 = self->_hostingGeometry != 0;
    objc_msgSend(v7, "insets");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostingIdentifier"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostingProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUIHostingView renderModelIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:](TUIHostingView, "renderModelIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:", v42, v48, v57, v58, v44, v46, self->_requestedSize.width, self->_requestedSize.height, v50, v52, v54, v56, v72.i64[0], v21));

    v59 = TUIHostingLog();
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
      v62 = objc_msgSend(v75, "feedId");
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "hostingIdentifier"));
      objc_msgSend(v9, "size");
      v65 = NSStringFromCGSize(v139);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      v67 = NSStringFromCGSize(*p_requestedSize);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v62;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v64;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v66;
      *(_WORD *)&buf[32] = 2112;
      *(_QWORD *)&buf[34] = v68;
      *(_WORD *)&buf[42] = 2112;
      *(_QWORD *)&buf[44] = v9;
      _os_log_debug_impl(&dword_0, v60, OS_LOG_TYPE_DEBUG, "[fid:%lu] newRenderModel identifier=%@ size=%@ requestedSize=%@ renderModel=%@", buf, 0x34u);

    }
  }

  return v9;
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIHostedLayout;
  v6 = -[TUILayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v9, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "setShouldVendControlView:", 1);
  return v7;
}

- (TUIHostingGeometry)hostingGeometry
{
  return self->_hostingGeometry;
}

- (CGSize)requestedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_requestedSize.width;
  height = self->_requestedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingGeometry, 0);
}

@end
