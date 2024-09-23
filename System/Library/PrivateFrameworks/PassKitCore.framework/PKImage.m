@implementation PKImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  return (id)objc_msgSend(a1, "newImageNamed:inBundle:screenScale:suffix:", a3, a4, a6, a5);
}

+ (id)newImageNamed:(id)a3 inBundle:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  PKImage *v19;
  uint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21 = 0x3FF0000000000000;
  objc_msgSend(a1, "URLForImageNamed:inBundle:scale:preferredScreenScale:suffix:", v10, v11, &v21, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(double *)&v21;
  v15 = v13;
  v16 = (void *)MEMORY[0x19400CFE8]();
  if (v15
    && (objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v15),
        (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = (void *)v17;
    v19 = -[PKImage initWithData:scale:]([PKImage alloc], "initWithData:scale:", v17, v14);

  }
  else
  {
    v19 = 0;
  }
  objc_autoreleasePoolPop(v16);

  return v19;
}

+ (id)URLForImageNamed:(id)a3 inBundle:(id)a4 scale:(double *)a5 preferredScreenScale:(double)a6 suffix:(id)a7
{
  __CFString *v11;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void (**v28)(void *, void *);
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  double *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD aBlock[4];
  id v46;
  __CFString *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  void *v55;
  void *v56;
  _QWORD v57[2];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[5];

  v64[3] = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = a7;
  v14 = 0;
  v44 = v12;
  if (v11 && v12)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__7;
    v53 = __Block_byref_object_dispose__7;
    v54 = 0;
    -[__CFString pathExtension](v11, "pathExtension");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v40 = a5;
    if (-[__CFString length](v15, "length"))
    {
      -[__CFString stringByDeletingPathExtension](v11, "stringByDeletingPathExtension");
      v41 = v15;
      v15 = v11;
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = CFSTR("png");
    }

    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("@1x"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", CFSTR("@1x"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("@2x"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingString:", CFSTR("@2x"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("@3x"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingString:", CFSTR("@3x"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v62[0] = v42;
      v62[1] = v11;
      v62[2] = v43;
      v63[0] = &unk_1E2C3E9B0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v23;
      v63[1] = &unk_1E2C3E9C8;
      v61[0] = v19;
      v61[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v24;
      v63[2] = &unk_1E2C3E9E0;
      v60[0] = v22;
      v60[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v64[2] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("@2x"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("@3x"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v11;
      v57[1] = v43;
      v58[0] = &unk_1E2C3E9B0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v19;
      v58[1] = &unk_1E2C3E9C8;
      v56 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v20;
      v58[2] = &unk_1E2C3E9E0;
      v55 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKImage_URLForImageNamed_inBundle_scale_preferredScreenScale_suffix___block_invoke;
    aBlock[3] = &unk_1E2AC2C08;
    v48 = &v49;
    v46 = v44;
    v27 = v41;
    v47 = v27;
    v28 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (a6 <= 0.0)
      a6 = PKScreenScale();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, v30);

    if (v50[5])
    {
      v31 = a6;
    }
    else
    {
      v31 = a6;
      do
      {
        v31 = v31 + 1.0;
        if (v31 > 3.0)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = ((uint64_t (*)(void *, void *))v28[2])(v28, v33);
        v35 = v31 >= 3.0 ? 1 : v34;

      }
      while (!v35);
      if (!v50[5])
      {
        v31 = a6;
        do
        {
          v31 = v31 + -1.0;
          if (v31 <= 0.0)
            break;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = ((uint64_t (*)(void *, void *))v28[2])(v28, v37);

        }
        while (!v38);
      }
    }
    if (v40)
      *v40 = v31;
    v14 = (id)v50[5];

    _Block_object_dispose(&v49, 8);
  }

  return v14;
}

BOOL __71__PKImage_URLForImageNamed_inBundle_scale_preferredScreenScale_suffix___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(a1 + 32), "URLForResource:withExtension:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7), *(_QWORD *)(a1 + 40), (_QWORD)v13);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v11;
}

- (BOOL)tiles
{
  return self->_shouldTile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (id)resizableImageByTilingWithCapInsets:(PKEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  os_unfair_lock_s *p_lock;
  PKImage *v9;
  uint64_t v10;
  NSData *imageData;
  CGImage *imageRef;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = objc_alloc_init(PKImage);
  v10 = -[NSData copy](self->_imageData, "copy");
  imageData = v9->_imageData;
  v9->_imageData = (NSData *)v10;

  imageRef = self->_imageRef;
  if (imageRef)
    imageRef = CGImageRetain(imageRef);
  v9->_imageRef = imageRef;
  v9->_scale = self->_scale;
  v9->_orientation = self->_orientation;
  v9->_shouldTile = 1;
  v9->_capInsets.top = top;
  v9->_capInsets.left = left;
  v9->_capInsets.bottom = bottom;
  v9->_capInsets.right = right;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

+ (id)passesImageNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  PKPassKitCoreBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  return (id)objc_msgSend(a1, "newImageNamed:inBundle:", a3, a4);
}

+ (id)newImageNamed:(id)a3 inBundle:(id)a4
{
  return (id)objc_msgSend(a1, "newImageNamed:inBundle:screenScale:suffix:", a3, a4, 0, 0.0);
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)PKImage;
  -[PKImage dealloc](&v3, sel_dealloc);
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4 withBlendMode:(int)a5 alpha:(double)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat MinX;
  CGFloat MaxY;
  int64_t v20;
  __int128 v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGImage *v28;
  _BOOL4 v29;
  PKImage *v30;
  CGImage *v31;
  double v32;
  uint64_t v33;
  double top;
  CGFloat left;
  double bottom;
  CGFloat right;
  CGAffineTransform transform;
  CGRect v39;
  CGRect remainder;
  CGRect slice;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    -[PKImage size](self, "size");
    if (v14 > 0.0)
    {
      v16 = v15;
      if (v15 > 0.0)
      {
        v17 = v14;
        CGContextSaveGState(a4);
        CGContextSetBlendMode(a4, (CGBlendMode)a5);
        CGContextSetAlpha(a4, a6);
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        MinX = CGRectGetMinX(v42);
        v43.origin.x = x;
        v43.origin.y = y;
        v43.size.width = width;
        v43.size.height = height;
        MaxY = CGRectGetMaxY(v43);
        CGContextTranslateCTM(a4, MinX, MaxY);
        CGContextScaleCTM(a4, 1.0, -1.0);
        v20 = -[PKImage orientation](self, "orientation");
        if (height > 0.0 && width > 0.0 && (unint64_t)(v20 - 2) <= 6)
        {
          v21 = xmmword_190453BE0;
          v22 = -1.0;
          v23 = 0.0;
          v24 = 0.0;
          v25 = width;
          switch(v20)
          {
            case 2:
              break;
            case 3:
              v21 = xmmword_190453BF0;
              goto LABEL_12;
            case 4:
              v21 = xmmword_190453BF0;
              v22 = 1.0;
              v25 = 0.0;
              v24 = height;
              break;
            case 5:
              v23 = -height / width;
              *((_QWORD *)&v21 + 1) = 0;
              *(double *)&v21 = -width / height;
              v22 = 0.0;
LABEL_12:
              v24 = height;
              v25 = width;
              break;
            case 6:
              v23 = -height / width;
              *((_QWORD *)&v21 + 1) = 0;
              *(double *)&v21 = width / height;
              v25 = 0.0;
              v24 = height;
              goto LABEL_16;
            case 7:
              v23 = height / width;
              *((_QWORD *)&v21 + 1) = 0;
              *(double *)&v21 = width / height;
              v25 = 0.0;
              goto LABEL_16;
            case 8:
              v23 = height / width;
              *((_QWORD *)&v21 + 1) = 0;
              *(double *)&v21 = -width / height;
              v25 = width;
LABEL_16:
              v22 = 0.0;
              break;
            default:
              v22 = *MEMORY[0x1E0C9BAA8];
              v23 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
              v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
              v25 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
              v24 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
              break;
          }
          transform.a = v22;
          transform.b = v23;
          *(_OWORD *)&transform.c = v21;
          transform.tx = v25;
          transform.ty = v24;
          CGContextConcatCTM(a4, &transform);
        }
        if (v17 == width && v16 == height
          || !(v29 = -[PKImage _isTiledWhenStretchedToSize:](self, "_isTiledWhenStretchedToSize:", width, height))
          && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_capInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_capInsets.bottom))))) & 1) == 0)
        {
          v26 = *MEMORY[0x1E0C9D538];
          v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          v28 = -[PKImage imageRef](objc_retainAutorelease(self), "imageRef");
          v44.origin.x = v26;
          v44.origin.y = v27;
          v44.size.width = width;
          v44.size.height = height;
          CGContextDrawImage(a4, v44, v28);
        }
        else
        {
          v30 = objc_retainAutorelease(self);
          v31 = -[PKImage imageRef](v30, "imageRef");
          -[PKImage scale](v30, "scale");
          *(float *)&v32 = v32;
          v33 = vcvtps_s32_f32(*(float *)&v32);
          top = v30->_capInsets.top;
          left = v30->_capInsets.left;
          bottom = v30->_capInsets.bottom;
          right = v30->_capInsets.right;
          *(_OWORD *)&transform.a = *MEMORY[0x1E0C9D538];
          transform.c = width;
          transform.d = height;
          memset(&slice, 0, sizeof(slice));
          memset(&remainder, 0, sizeof(remainder));
          memset(&v39, 0, sizeof(v39));
          v45.origin.x = transform.a;
          v45.origin.y = transform.b;
          v45.size.width = width;
          v45.size.height = height;
          CGRectDivide(v45, &slice, (CGRect *)&transform, top, CGRectMaxYEdge);
          v46.origin.x = transform.a;
          v46.origin.y = transform.b;
          v46.size.width = transform.c;
          v46.size.height = transform.d;
          CGRectDivide(v46, &v39, &remainder, bottom, CGRectMinYEdge);
          if (!CGRectIsEmpty(slice))
            _Draw3PartSlice(a4, v31, v33, v29, 0.0, 0.0, v17, top, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, top, left, bottom, right);
          if (!CGRectIsEmpty(remainder))
            _Draw3PartSlice(a4, v31, v33, v29, 0.0, top, v17, v16 - (top + bottom), remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, top, left, bottom, right);
          if (!CGRectIsEmpty(v39))
            _Draw3PartSlice(a4, v31, v33, v29, 0.0, v16 - bottom, v17, bottom, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height, top, left, bottom, right);
        }
        CGContextRestoreGState(a4);
      }
    }
  }
}

- (CGSize)size
{
  PKImage *v2;
  CGImage *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  CGSize result;

  v2 = objc_retainAutorelease(self);
  v3 = -[PKImage imageRef](v2, "imageRef");
  -[PKImage scale](v2, "scale");
  v5 = v4;
  v6 = (double)CGImageGetWidth(v3) / v4;
  v7 = (double)CGImageGetHeight(v3) / v5;
  v8 = -[PKImage orientation](v2, "orientation");
  if ((unint64_t)(v8 - 1) >= 4)
    v9 = v7;
  else
    v9 = v6;
  if ((unint64_t)(v8 - 1) >= 4)
    v10 = v6;
  else
    v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double left;
  double right;
  double top;
  double bottom;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x19400CFE8]();
  -[PKImage imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("imageData"));

  -[PKImage scale](self, "scale");
  *(float *)&v6 = v6;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("scale"), v6);
  objc_msgSend(v11, "encodeInteger:forKey:", -[PKImage orientation](self, "orientation"), CFSTR("orientation"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_shouldTile, CFSTR("shouldTile"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_shouldStretch, CFSTR("shouldStretch"));
  if (*(_WORD *)&self->_shouldTile)
  {
    left = self->_capInsets.left;
    *(float *)&left = left;
    objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("leftCap"), left);
    right = self->_capInsets.right;
    *(float *)&right = right;
    objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("rightCap"), right);
    top = self->_capInsets.top;
    *(float *)&top = top;
    objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("topCap"), top);
    bottom = self->_capInsets.bottom;
    *(float *)&bottom = bottom;
    objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("bottomCap"), bottom);
  }
  objc_autoreleasePoolPop(v4);

}

- (double)scale
{
  return self->_scale;
}

- (CGImage)imageRef
{
  os_unfair_lock_s *p_lock;
  CGImage *imageRef;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKImage _queue_createImageRefIfNecessary](self, "_queue_createImageRefIfNecessary");
  imageRef = self->_imageRef;
  os_unfair_lock_unlock(p_lock);
  return imageRef;
}

- (int64_t)orientation
{
  os_unfair_lock_s *p_lock;
  int64_t orientation;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKImage _queue_createImageRefIfNecessary](self, "_queue_createImageRefIfNecessary");
  orientation = self->_orientation;
  os_unfair_lock_unlock(p_lock);
  return orientation;
}

- (void)_queue_createImageRefIfNecessary
{
  uint64_t *p_orientation;
  int64_t orientation;
  NSData *imageData;
  CGImage *CGImageFromData;
  NSData *v7;

  if (!self->_imageRef)
  {
    p_orientation = &self->_orientation;
    orientation = self->_orientation;
    imageData = self->_imageData;
    if (orientation)
      p_orientation = 0;
    CGImageFromData = _CreateCGImageFromData(imageData, p_orientation);
    v7 = self->_imageData;
    self->_imageData = 0;
    self->_imageRef = CGImageFromData;

  }
}

- (NSData)imageData
{
  os_unfair_lock_s *p_lock;
  NSData *imageData;
  NSData *v5;
  void *v6;
  CGImage *imageRef;
  __CFData *v8;
  __CFData *v9;
  CGImageDestinationRef v10;
  CGImageDestination *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  __CFData *v18;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  imageData = self->_imageData;
  if (imageData)
  {
    v5 = imageData;
  }
  else if (self->_imageRef)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    imageRef = self->_imageRef;
    v8 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v9 = v8;
    if (v8)
    {
      v10 = CGImageDestinationCreateWithData(v8, CFSTR("public.png"), 1uLL, 0);
      if (v10)
      {
        v11 = v10;
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", 8);
        v14 = objc_alloc(MEMORY[0x1E0C99D80]);
        v15 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v13, *MEMORY[0x1E0CBD008], 0);
        objc_msgSend(v12, "setObject:forKey:", v15, *MEMORY[0x1E0CBD028]);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", 2);
        objc_msgSend(v12, "setObject:forKey:", v16, *MEMORY[0x1E0CBCFF8]);
        CGImageDestinationAddImage(v11, imageRef, (CFDictionaryRef)v12);
        v17 = CGImageDestinationFinalize(v11);
        CFRelease(v11);

        if (v17)
          v18 = v9;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v5 = v18;
    }
    else
    {
      v5 = 0;
    }

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (PKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  PKImage *v8;
  CGImageRef v9;

  v8 = -[PKImage init](self, "init");
  if (v8)
  {
    if (a3)
      v9 = CGImageRetain(a3);
    else
      v9 = 0;
    v8->_imageRef = v9;
    v8->_scale = a4;
    v8->_orientation = a5;
  }
  return v8;
}

- (PKImage)initWithData:(id)a3 scale:(double)a4
{
  id v7;
  PKImage *v8;
  PKImage *v9;

  v7 = a3;
  v8 = -[PKImage init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_imageData, a3);
    v9->_scale = a4;
  }

  return v9;
}

- (PKImage)initWithCoder:(id)a3
{
  id v4;
  PKImage *v5;
  void *v6;
  uint64_t v7;
  NSData *imageData;
  float v9;
  int v10;
  float v11;
  float v12;
  float v13;
  float v14;

  v4 = a3;
  v5 = -[PKImage init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v7 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("scale"));
    v5->_scale = v9;
    v5->_orientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("orientation"));
    v5->_shouldTile = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldTile"));
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldStretch"));
    v5->_shouldStretch = v10;
    if (v5->_shouldTile || v10)
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftCap"));
      v5->_capInsets.left = v11;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightCap"));
      v5->_capInsets.right = v12;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("topCap"));
      v5->_capInsets.top = v13;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bottomCap"));
      v5->_capInsets.bottom = v14;
    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (PKImage)init
{
  PKImage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKImage;
  result = -[PKImage init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (PKEdgeInsets)capInsets
{
  double top;
  double left;
  double bottom;
  double right;
  PKEdgeInsets result;

  if (self->_shouldTile || self->_shouldStretch)
  {
    top = self->_capInsets.top;
    left = self->_capInsets.left;
    bottom = self->_capInsets.bottom;
    right = self->_capInsets.right;
  }
  else
  {
    left = 0.0;
    top = 0.0;
    bottom = 0.0;
    right = 0.0;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)stretches
{
  return self->_shouldStretch;
}

+ (id)URLForImageNamed:(id)a3 inBundle:(id)a4 scale:(double *)a5
{
  return (id)objc_msgSend(a1, "URLForImageNamed:inBundle:scale:preferredScreenScale:suffix:", a3, a4, a5, 0, 0.0);
}

+ (id)hashOfImageNamed:(id)a3 inBundle:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a1, "newImageNamed:inBundle:", a3, a4);
  objc_msgSend(v4, "imageHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imageHash
{
  uint64_t v3;
  void *v4;
  id v5;
  const void *v6;
  CC_LONG v7;
  char data;
  CC_SHA256_CTX c;
  unsigned __int8 md[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  v3 = CC_SHA256_Init(&c);
  v4 = (void *)MEMORY[0x19400CFE8](v3);
  -[PKImage imageData](self, "imageData");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const void *)objc_msgSend(v5, "bytes");
  if ((unint64_t)objc_msgSend(v5, "length") > 0xFFFFFFFE)
    v7 = -1;
  else
    v7 = objc_msgSend(v5, "length");
  CC_SHA256_Update(&c, v6, v7);

  objc_autoreleasePoolPop(v4);
  data = 30;
  CC_SHA256_Update(&c, &data, 1u);
  CC_SHA256_Update(&c, &self->_scale, 8u);
  CC_SHA256_Final(md, &c);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
}

- (BOOL)isEqual:(id)a3
{
  PKImage *v4;
  PKImage *v5;
  BOOL v6;

  v4 = (PKImage *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKImage isEqualToImage:](self, "isEqualToImage:", v5);

  return v6;
}

- (BOOL)isEqualToImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKImage imageHash](self, "imageHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (CGSize)downscaleSizeMatchingScale:(double)a3
{
  double scale;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (a3 == 0.0)
    a3 = PKScreenScale();
  scale = self->_scale;
  v5 = a3 == 0.0 || scale == 0.0;
  v6 = scale / a3;
  if (v5)
    v7 = 1.0;
  else
    v7 = v6;
  -[PKImage size](self, "size");
  v8 = fmin(v7, 1.0);
  v10 = v9 * v8;
  v12 = v11 * v8;
  result.height = v10;
  result.width = v12;
  return result;
}

- (void)preheatBitmapData
{
  void *v3;
  CGImage *v4;

  v3 = (void *)MEMORY[0x19400CFE8](self, a2);
  v4 = -[PKImage imageRef](objc_retainAutorelease(self), "imageRef");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CGImage CA_prepareRenderValue](v4, "CA_prepareRenderValue");
  objc_autoreleasePoolPop(v3);
}

- (id)blurredImageWithRadius:(unint64_t)a3 constraints:(id)a4
{
  id v6;
  PKImage *v7;
  double v8;
  double v9;
  CGContext *BitmapContext;
  CGContext *v16;
  PKImage *v17;
  CGImage *v18;
  CGImage *v19;
  CGFloat v20;
  CGFloat v21;
  uint32_t v22;
  CGImage *Image;
  CGContext *v24;
  CGImage *v25;
  uint64_t v26;
  uint64_t v27;
  CGSize rect;
  vImage_Buffer dest;
  vImage_Buffer src;
  float64x2_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v6 = a4;
  memset(&v33, 0, sizeof(v33));
  v32 = 0uLL;
  v7 = 0;
  if (objc_msgSend(v6, "getPixelCropRect:pixelOutputSize:forImage:", &v33, &v32, self))
  {
    objc_msgSend(v6, "outputScale");
    v9 = v8;
    __asm { FMOV            V1.2D, #0.5 }
    rect = (CGSize)vrndaq_f64(vmulq_f64(v32, _Q1));
    BitmapContext = _CreateBitmapContext(1, 0, 0, rect.width, rect.height, 1.0);
    src.data = CGBitmapContextGetData(BitmapContext);
    src.width = CGBitmapContextGetWidth(BitmapContext);
    src.height = CGBitmapContextGetHeight(BitmapContext);
    src.rowBytes = CGBitmapContextGetBytesPerRow(BitmapContext);
    v16 = _CreateBitmapContext(1, 0, 0, rect.width, rect.height, 1.0);
    dest.data = CGBitmapContextGetData(v16);
    dest.width = CGBitmapContextGetWidth(v16);
    dest.height = CGBitmapContextGetHeight(v16);
    dest.rowBytes = CGBitmapContextGetBytesPerRow(v16);
    v17 = objc_retainAutorelease(self);
    v18 = -[PKImage imageRef](v17, "imageRef");
    v19 = CGImageCreateWithImageInRect(v18, v33);
    v20 = *MEMORY[0x1E0C9D538];
    v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v34.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v34.origin.y = v21;
    v34.size = rect;
    CGContextDrawImage(BitmapContext, v34, v19);
    CGImageRelease(v19);
    v22 = vcvtpd_u64_f64(v9 * (double)a3) | 1;
    vImageTentConvolve_ARGB8888(&src, &dest, 0, 0, 0, v22, v22, 0, 8u);
    Image = CGBitmapContextCreateImage(v16);
    CGContextRelease(BitmapContext);
    CGContextRelease(v16);
    if (Image)
    {
      v24 = _CreateBitmapContext(1, 0, 0, v32.f64[0], v32.f64[1], 1.0);
      CGContextSetInterpolationQuality(v24, kCGInterpolationHigh);
      v35.size = (CGSize)v32;
      v35.origin.x = v20;
      v35.origin.y = v21;
      CGContextDrawImage(v24, v35, Image);
      CGImageRelease(Image);
      v25 = CGBitmapContextCreateImage(v24);
      CGContextRelease(v24);
      LODWORD(v24) = objc_msgSend(v6, "outputMirrored");
      v26 = -[PKImage orientation](v17, "orientation");
      v27 = v26;
      if ((_DWORD)v24)
      {
        if ((unint64_t)(v26 - 1) > 7)
          v27 = 0;
        else
          v27 = qword_190453C40[v26 - 1];
      }
      v7 = -[PKImage initWithCGImage:scale:orientation:]([PKImage alloc], "initWithCGImage:scale:orientation:", v25, v27, v9);
      CGImageRelease(v25);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)croppedImageWithInsets:(PKEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  PKImage *v7;
  CGImage *v8;
  double scale;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGImage *v13;
  PKImage *v14;
  CGRect v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = objc_retainAutorelease(self);
  v8 = CGImageRetain(-[PKImage imageRef](v7, "imageRef"));
  scale = v7->_scale;
  v10 = left * scale;
  v11 = top * scale;
  v12 = (double)CGImageGetWidth(v8) - (left + right) * scale;
  v16.size.height = (double)CGImageGetWidth(v8) - (top + bottom) * v7->_scale;
  v16.origin.x = v10;
  v16.origin.y = v11;
  v16.size.width = v12;
  v13 = CGImageCreateWithImageInRect(v8, v16);
  v14 = -[PKImage initWithCGImage:scale:orientation:]([PKImage alloc], "initWithCGImage:scale:orientation:", v13, v7->_orientation, v7->_scale);
  CGImageRelease(v13);
  CGImageRelease(v8);
  return v14;
}

- (PKImage)imageWithoutCapInsets
{
  os_unfair_lock_s *p_lock;
  PKImage *v4;
  uint64_t v5;
  NSData *imageData;
  CGImage *imageRef;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc_init(PKImage);
  v5 = -[NSData copy](self->_imageData, "copy");
  imageData = v4->_imageData;
  v4->_imageData = (NSData *)v5;

  imageRef = self->_imageRef;
  if (imageRef)
    imageRef = CGImageRetain(imageRef);
  v4->_imageRef = imageRef;
  v4->_scale = self->_scale;
  v4->_orientation = self->_orientation;
  *(_WORD *)&v4->_shouldTile = 0;
  *(_OWORD *)&v4->_capInsets.top = 0u;
  *(_OWORD *)&v4->_capInsets.bottom = 0u;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)resizedImageWithConstraints:(id)a3
{
  return (id)objc_msgSend(a3, "resizedImage:", self);
}

- (id)resizableImageByStretchingWithCapInsets:(PKEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  os_unfair_lock_s *p_lock;
  PKImage *v9;
  uint64_t v10;
  NSData *imageData;
  CGImage *imageRef;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = objc_alloc_init(PKImage);
  v10 = -[NSData copy](self->_imageData, "copy");
  imageData = v9->_imageData;
  v9->_imageData = (NSData *)v10;

  imageRef = self->_imageRef;
  if (imageRef)
    imageRef = CGImageRetain(imageRef);
  v9->_imageRef = imageRef;
  v9->_scale = self->_scale;
  v9->_orientation = self->_orientation;
  v9->_shouldStretch = 1;
  v9->_capInsets.top = top;
  v9->_capInsets.left = left;
  v9->_capInsets.bottom = bottom;
  v9->_capInsets.right = right;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)resizableImageByTilingCenterPixel
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[PKImage size](self, "size");
  *(float *)&v3 = (v3 + -1.0) * 0.5;
  v4 = floorf(*(float *)&v3);
  *(float *)&v3 = (v5 + -1.0) * 0.5;
  v6 = floorf(*(float *)&v3);
  return -[PKImage resizableImageByTilingWithCapInsets:](self, "resizableImageByTilingWithCapInsets:", v6, v4, v6);
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  -[PKImage drawInRect:inContext:withBlendMode:alpha:](self, "drawInRect:inContext:withBlendMode:alpha:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0);
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  if (!self->_shouldTile)
    return 0;
  height = a3.height;
  width = a3.width;
  -[PKImage size](self, "size");
  if (v6 - self->_capInsets.left - self->_capInsets.right > 1.0 && width != v6)
    return 1;
  if (height == v7)
    return 0;
  return v7 - self->_capInsets.top - self->_capInsets.bottom > 1.0;
}

@end
