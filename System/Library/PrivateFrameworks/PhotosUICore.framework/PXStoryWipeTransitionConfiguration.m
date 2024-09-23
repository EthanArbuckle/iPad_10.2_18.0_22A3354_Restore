@implementation PXStoryWipeTransitionConfiguration

- (PXStoryWipeTransitionConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 384, CFSTR("%s is not available as initializer"), "-[PXStoryWipeTransitionConfiguration init]");

  abort();
}

- (PXStoryWipeTransitionConfiguration)initWithDuration:(id *)a3
{
  PXStoryWipeTransitionConfiguration *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryWipeTransitionConfiguration;
  result = -[PXStoryWipeTransitionConfiguration init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0;
    result->_duration.epoch = a3->var3;
    *(_OWORD *)&result->_duration.value = v5;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sourceStates);
  free(self->_targetStates);
  free(self->_primaryDividerInfos);
  free(self->_secondaryDividerInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryWipeTransitionConfiguration;
  -[PXStoryWipeTransitionConfiguration dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  return (NSString *)_PXStoryIdentifierFromClipLayouts();
}

- (void)addClipLayout:(id)a3 configurationBlock:(id)a4
{
  id v6;
  void (**v7)(id, _OWORD *, CGPoint *, CGSize *, CGSize *);
  NSMutableArray *clipLayouts;
  NSMutableArray *v9;
  NSMutableArray *v10;
  int64_t capacity;
  int64_t count;
  int v13;
  CGPoint *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  $AEFE08CAF6E71CABB3A462590F12CFC6 *v24;
  CGSize v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGSize v31;
  $AEFE08CAF6E71CABB3A462590F12CFC6 *v32;
  CGSize v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGSize v39;
  $79F1C8D9F4A880B071FA7FF7BD322A7D *v40;
  CGSize v41;
  CGSize v42;
  CGPoint v43;
  $79F1C8D9F4A880B071FA7FF7BD322A7D *v44;
  CGSize v45;
  CGSize v46;
  CGPoint v47;
  CGSize v48;
  CGSize v49;
  CGSize v50;
  __int128 v51;
  CGPoint v52;
  CGSize v53;
  CGSize v54;
  CGSize v55;
  __int128 v56;
  CGPoint v57;
  CGPoint v58;
  CGSize v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CGPoint v66;
  CGSize v67;
  CGPoint v68;
  CGSize v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CGPoint v76;
  CGSize v77;

  v6 = a3;
  v7 = (void (**)(id, _OWORD *, CGPoint *, CGSize *, CGSize *))a4;
  clipLayouts = self->_clipLayouts;
  if (!clipLayouts)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_clipLayouts;
    self->_clipLayouts = v9;

    clipLayouts = self->_clipLayouts;
  }
  -[NSMutableArray addObject:](clipLayouts, "addObject:", v6);
  capacity = self->_capacity;
  count = self->_count;
  self->_count = count + 1;
  *(_QWORD *)&v68.x = capacity;
  v13 = _PXGArrayCapacityResizeToCount();
  self->_capacity = *(_QWORD *)&v68.x;
  if (v13)
  {
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
  }
  objc_msgSend(v6, "contentSize");
  v14 = (CGPoint *)MEMORY[0x1E0C9D538];
  PXRectWithOriginAndSize();
  v58.x = v15;
  v58.y = v16;
  v59.width = v17;
  v59.height = v18;
  v62 = xmmword_1A7C0A498;
  v63 = unk_1A7C0A4A8;
  v64 = xmmword_1A7C0A4B8;
  v65 = unk_1A7C0A4C8;
  v60 = PXStoryTiltedEdgeInsetsNull;
  v61 = unk_1A7C0A488;
  __asm { FMOV            V1.2D, #1.0 }
  v66 = *v14;
  v67 = _Q1;
  v72 = xmmword_1A7C0A498;
  v73 = unk_1A7C0A4A8;
  v70 = PXStoryTiltedEdgeInsetsNull;
  v71 = unk_1A7C0A488;
  v74 = xmmword_1A7C0A4B8;
  v75 = unk_1A7C0A4C8;
  v68 = v58;
  v69 = v59;
  v76 = v66;
  v77 = _Q1;
  v48 = (CGSize)*MEMORY[0x1E0C9D820];
  v49 = _Q1;
  v50 = _Q1;
  v51 = 0uLL;
  v52 = v66;
  v53 = v48;
  v57 = v66;
  v55 = _Q1;
  v56 = 0uLL;
  v54 = _Q1;
  ((void (**)(id, CGPoint *, CGPoint *, CGSize *, CGSize *))v7)[2](v7, &v68, &v58, &v53, &v48);
  v24 = &self->_sourceStates[count];
  v25 = v69;
  v24->var0.origin = v68;
  v24->var0.size = v25;
  v26 = v70;
  v27 = v71;
  v28 = v73;
  *(_OWORD *)&v24->var1.var1.var1 = v72;
  *(_OWORD *)&v24->var1.var2.var0 = v28;
  *(_OWORD *)&v24->var1.var0.var0 = v26;
  *(_OWORD *)&v24->var1.var0.var2 = v27;
  v29 = v74;
  v30 = v75;
  v31 = v77;
  v24->var2 = v76;
  v24->var3 = v31;
  *(_OWORD *)&v24->var1.var2.var2 = v29;
  *(_OWORD *)&v24->var1.var3.var1 = v30;
  v32 = &self->_targetStates[count];
  v33 = v59;
  v32->var0.origin = v58;
  v32->var0.size = v33;
  v34 = v60;
  v35 = v61;
  v36 = v63;
  *(_OWORD *)&v32->var1.var1.var1 = v62;
  *(_OWORD *)&v32->var1.var2.var0 = v36;
  *(_OWORD *)&v32->var1.var0.var0 = v34;
  *(_OWORD *)&v32->var1.var0.var2 = v35;
  v37 = v64;
  v38 = v65;
  v39 = v67;
  v32->var2 = v66;
  v32->var3 = v39;
  *(_OWORD *)&v32->var1.var2.var2 = v37;
  *(_OWORD *)&v32->var1.var3.var1 = v38;
  v40 = &self->_primaryDividerInfos[count];
  v40->var0 = v53;
  v41 = v54;
  v42 = v55;
  v43 = v57;
  *(_OWORD *)&v40->var3 = v56;
  v40->var5 = v43;
  v40->var1 = v41;
  v40->var2 = v42;
  v44 = &self->_secondaryDividerInfos[count];
  v44->var0 = v48;
  v45 = v49;
  v46 = v50;
  v47 = v52;
  *(_OWORD *)&v44->var3 = v51;
  v44->var5 = v47;
  v44->var1 = v45;
  v44->var2 = v46;

}

- (void)enumerateLayoutsUsingBlock:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  $AEFE08CAF6E71CABB3A462590F12CFC6 *v9;
  $AEFE08CAF6E71CABB3A462590F12CFC6 *v10;
  $79F1C8D9F4A880B071FA7FF7BD322A7D *v11;
  $79F1C8D9F4A880B071FA7FF7BD322A7D *v12;
  void (*v13)(_QWORD *, void *, _OWORD *, _OWORD *, _OWORD *, _OWORD *, char *);
  CGSize size;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGSize var3;
  CGSize v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGSize v27;
  CGSize var1;
  CGSize var2;
  CGPoint var5;
  CGSize v31;
  CGSize v32;
  CGPoint v33;
  _OWORD v34[5];
  _OWORD v35[5];
  _OWORD v36[10];
  _OWORD v37[10];
  char v38;

  v4 = a3;
  v38 = 0;
  if (self->_count >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_clipLayouts, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = &self->_sourceStates[v5];
      v10 = &self->_targetStates[v5];
      v11 = &self->_primaryDividerInfos[v6];
      v12 = &self->_secondaryDividerInfos[v6];
      v13 = (void (*)(_QWORD *, void *, _OWORD *, _OWORD *, _OWORD *, _OWORD *, char *))v4[2];
      size = v9->var0.size;
      v37[0] = v9->var0.origin;
      v37[1] = size;
      v15 = *(_OWORD *)&v9->var1.var0.var0;
      v16 = *(_OWORD *)&v9->var1.var0.var2;
      v17 = *(_OWORD *)&v9->var1.var2.var0;
      v37[4] = *(_OWORD *)&v9->var1.var1.var1;
      v37[5] = v17;
      v37[2] = v15;
      v37[3] = v16;
      v18 = *(_OWORD *)&v9->var1.var2.var2;
      v19 = *(_OWORD *)&v9->var1.var3.var1;
      var3 = v9->var3;
      v37[8] = v9->var2;
      v37[9] = var3;
      v37[6] = v18;
      v37[7] = v19;
      v21 = v10->var0.size;
      v36[0] = v10->var0.origin;
      v36[1] = v21;
      v22 = *(_OWORD *)&v10->var1.var0.var0;
      v23 = *(_OWORD *)&v10->var1.var0.var2;
      v24 = *(_OWORD *)&v10->var1.var2.var0;
      v36[4] = *(_OWORD *)&v10->var1.var1.var1;
      v36[5] = v24;
      v36[2] = v22;
      v36[3] = v23;
      v25 = *(_OWORD *)&v10->var1.var2.var2;
      v26 = *(_OWORD *)&v10->var1.var3.var1;
      v27 = v10->var3;
      v36[8] = v10->var2;
      v36[9] = v27;
      v36[6] = v25;
      v36[7] = v26;
      v35[0] = v11->var0;
      var1 = v11->var1;
      var2 = v11->var2;
      var5 = v11->var5;
      v35[3] = *(_OWORD *)&v11->var3;
      v35[4] = var5;
      v35[1] = var1;
      v35[2] = var2;
      v34[0] = v12->var0;
      v31 = v12->var1;
      v32 = v12->var2;
      v33 = v12->var5;
      v34[3] = *(_OWORD *)&v12->var3;
      v34[4] = v33;
      v34[1] = v31;
      v34[2] = v32;
      v13(v4, v8, v37, v36, v35, v34, &v38);

      if (v38)
        break;
      ++v7;
      ++v6;
      ++v5;
    }
    while (v7 < self->_count);
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewportSize:(CGSize)a3
{
  self->_viewportSize = a3;
}

- (double)dividerWidth
{
  return self->_dividerWidth;
}

- (void)setDividerWidth:(double)a3
{
  self->_dividerWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipLayouts, 0);
}

@end
