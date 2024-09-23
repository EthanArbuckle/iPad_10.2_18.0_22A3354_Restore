@implementation _UIASCIIArtFramesRenderer

- (_UIASCIIArtFramesRenderer)initWithFrames:(id)a3 outputLineWidth:(double)a4
{
  id v6;
  _UIASCIIArtFramesRenderer *v7;
  _UIASCIIArtFramesRenderer *v8;
  uint64_t v9;
  NSArray *frames;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIASCIIArtFramesRenderer;
  v7 = -[_UIASCIIArtFramesRenderer init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_UIASCIIArtFramesRenderer _normalizeFrames:](v7, "_normalizeFrames:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    frames = v8->_frames;
    v8->_frames = (NSArray *)v9;

    v8->_outputLineWidth = a4;
  }

  return v8;
}

- (_UIASCIIArtFramesRenderer)initWithFrames:(id)a3
{
  return -[_UIASCIIArtFramesRenderer initWithFrames:outputLineWidth:](self, "initWithFrames:outputLineWidth:", a3, 100.0);
}

- (id)visualDescription
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[_UIASCIIArtFramesRenderer renderedLines](self, "renderedLines");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46___UIASCIIArtFramesRenderer_visualDescription__block_invoke;
  v7[3] = &unk_1E16B8630;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (NSArray)frames
{
  return self->_frames;
}

- (double)outputLineWidth
{
  return self->_outputLineWidth;
}

- (id)renderedLines
{
  __int128 v3;
  NSArray *frames;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double MaxY;
  double MaxX;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void (**v28)(void *, uint64_t, uint64_t, _QWORD);
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double MinX;
  double v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  id obj;
  id v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD aBlock[4];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  uint64_t v75;
  CGRect *v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v84 = *MEMORY[0x1E0C80C00];
  v75 = 0;
  v76 = (CGRect *)&v75;
  v77 = 0x4010000000;
  v78 = &unk_18685B0AF;
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v79 = *MEMORY[0x1E0C9D648];
  v80 = v3;
  frames = self->_frames;
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke;
  v74[3] = &unk_1E16B8658;
  v74[4] = &v75;
  -[NSArray enumerateObjectsUsingBlock:](frames, "enumerateObjectsUsingBlock:", v74);
  -[_UIASCIIArtFramesRenderer outputLineWidth](self, "outputLineWidth");
  v6 = v5 / CGRectGetWidth(v76[1]);
  -[_UIASCIIArtFramesRenderer scaledRectForRect:scaleSize:](self, "scaledRectForRect:scaleSize:", v76[1].origin.x, v76[1].origin.y, v76[1].size.width, v76[1].size.height, v6, v6 * 0.5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  -[_UIASCIIArtFramesRenderer frames](self, "frames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v71 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "CGRectValue");
        -[_UIASCIIArtFramesRenderer scaledRectForRect:scaleSize:](self, "scaledRectForRect:scaleSize:");
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v20);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    }
    while (v17);
  }

  v85.origin.x = v8;
  v85.origin.y = v10;
  v85.size.width = v12;
  v85.size.height = v14;
  MaxY = CGRectGetMaxY(v85);
  v86.origin.x = v8;
  v86.origin.y = v10;
  v86.size.width = v12;
  v86.size.height = v14;
  MaxX = CGRectGetMaxX(v86);
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = (uint64_t)(MaxY + 1.0);
  if ((v24 & 0x8000000000000000) == 0)
  {
    v25 = v24 + 1;
    do
    {
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v23, "addObject:", v26);

      --v25;
    }
    while (v25);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_2;
  aBlock[3] = &unk_1E16B8680;
  v27 = v23;
  v69 = v27;
  v28 = (void (**)(void *, uint64_t, uint64_t, _QWORD))_Block_copy(aBlock);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v15;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v65 != v30)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "CGRectValue");
        x = v87.origin.x;
        y = v87.origin.y;
        width = v87.size.width;
        height = v87.size.height;
        MinY = CGRectGetMinY(v87);
        v88.origin.x = x;
        v88.origin.y = y;
        v88.size.width = width;
        v88.size.height = height;
        v37 = (uint64_t)MinY;
        v38 = (uint64_t)CGRectGetMaxY(v88);
        v39 = (uint64_t)MinY - v38;
        if ((uint64_t)MinY <= v38)
        {
          v40 = 0;
          do
          {
            if (v40 && v39 + v40)
            {
              v89.origin.x = x;
              v89.origin.y = y;
              v89.size.width = width;
              v89.size.height = height;
              MinX = CGRectGetMinX(v89);
              v90.origin.x = x;
              v90.origin.y = y;
              v90.size.width = width;
              v90.size.height = height;
              v42 = CGRectGetMaxX(v90);
              v28[2](v28, (uint64_t)MinX, 1, v37 + v40);
              v28[2](v28, (uint64_t)v42, 1, v37 + v40);
            }
            else
            {
              v91.origin.x = x;
              v91.origin.y = y;
              v91.size.width = width;
              v91.size.height = height;
              CGRectGetMinX(v91);
              v92.origin.x = x;
              v92.origin.y = y;
              v92.size.width = width;
              v92.size.height = height;
              CGRectGetMaxX(v92);
              ((void (*)(void (**)(void *, uint64_t, uint64_t, _QWORD)))v28[2])(v28);
            }
            ++v40;
          }
          while (v39 + v40 != 1);
        }
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
    }
    while (v29);
  }

  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v50 = v27;
  v44 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v61 != v45)
          objc_enumerationMutation(v50);
        v47 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
        v54 = 0;
        v55 = &v54;
        v56 = 0x3032000000;
        v57 = __Block_byref_object_copy__28;
        v58 = __Block_byref_object_dispose__28;
        objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", (uint64_t)(MaxX + 1.0), CFSTR(" "), 0);
        v59 = (id)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_19;
        v51[3] = &unk_1E16B86F0;
        v52 = &__block_literal_global_98;
        v53 = &v54;
        objc_msgSend(v47, "enumerateObjectsUsingBlock:", v51);
        objc_msgSend(v43, "addObject:", v55[5]);

        _Block_object_dispose(&v54, 8);
      }
      v44 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
    }
    while (v44);
  }

  _Block_object_dispose(&v75, 8);
  return v43;
}

- (CGRect)scaledRectForRect:(CGRect)a3 scaleSize:(CGSize)a4
{
  double height;
  double width;
  CGFloat v6;
  CGFloat v7;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  NSRect v16;

  height = a4.height;
  width = a4.width;
  v6 = a3.size.height;
  v7 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4.width * CGRectGetMinX(a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = v7;
  v13.size.height = v6;
  v11 = height * CGRectGetMinY(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = v7;
  v14.size.height = v6;
  v12 = width * CGRectGetWidth(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = v7;
  v15.size.height = v6;
  v16.size.height = height * CGRectGetHeight(v15);
  v16.origin.x = v10;
  v16.origin.y = v11;
  v16.size.width = v12;
  return NSIntegralRectWithOptions(v16, 0xF0000uLL);
}

- (id)_normalizeFrames:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3010000000;
  v14 = &unk_18685B0AF;
  v4 = MEMORY[0x1E0C809B0];
  v15 = *MEMORY[0x1E0C9D538];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46___UIASCIIArtFramesRenderer__normalizeFrames___block_invoke;
  v10[3] = &unk_1E16B8658;
  v10[4] = &v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
  v9 = *((_OWORD *)v12 + 2);
  _Block_object_dispose(&v11, 8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __46___UIASCIIArtFramesRenderer__normalizeFrames___block_invoke_2;
  v7[3] = &unk_1E16B8718;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
}

@end
