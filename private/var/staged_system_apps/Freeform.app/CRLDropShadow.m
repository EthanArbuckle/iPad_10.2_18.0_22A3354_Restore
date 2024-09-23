@implementation CRLDropShadow

- (CRLDropShadow)initWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(id)a7 enabled:(BOOL)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLDropShadow;
  return (CRLDropShadow *)-[CRLShadow i_initWithOpacity:color:angle:offset:radius:enabled:](&v9, "i_initWithOpacity:color:angle:offset:radius:enabled:", a7, a8, a6, a3, a4, a5);
}

- (unint64_t)shadowType
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class(CRLDropShadow, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLDropShadow;
    v9 = -[CRLShadow isEqual:](&v11, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLDropShadow;
  return -[CRLShadow hash](&v3, "hash");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableDropShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CRLMutableDropShadow *v14;

  v4 = [CRLMutableDropShadow alloc];
  -[CRLShadow angle](self, "angle");
  v6 = v5;
  -[CRLShadow offset](self, "offset");
  v8 = v7;
  -[CRLShadow radius](self, "radius");
  v10 = v9;
  -[CRLShadow opacity](self, "opacity");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
  v14 = -[CRLDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v4, "initWithAngle:offset:radius:opacity:color:enabled:", v13, -[CRLShadow isEnabled](self, "isEnabled"), v6, v8, v10, v12);

  return v14;
}

- (id)newShadowClampedForSwatches
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CRLDropShadow *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CRLDropShadow *v17;

  -[CRLShadow radius](self, "radius");
  v4 = v3;
  -[CRLShadow offset](self, "offset");
  v6 = v4 + v5;
  -[CRLShadow radius](self, "radius");
  v8 = v7;
  -[CRLShadow offset](self, "offset");
  v10 = v9;
  if (v6 > 10.0)
  {
    v8 = v8 * (10.0 / v6);
    v10 = v9 * (10.0 / v6);
  }
  v11 = [CRLDropShadow alloc];
  -[CRLShadow angle](self, "angle");
  v13 = v12;
  -[CRLShadow opacity](self, "opacity");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
  v17 = -[CRLDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v11, "initWithAngle:offset:radius:opacity:color:enabled:", v16, -[CRLShadow isEnabled](self, "isEnabled"), v13, v10, v8, v15);

  return v17;
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "layout"));
  objc_msgSend(v3, "shadowedNaturalBoundsWithoutOffset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "layout"));
  objc_msgSend(v3, "shadowedNaturalBoundsWithoutOffset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGImage *Image;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGColor *v30;
  CGContext *v31;
  CGContext *v32;
  void *v33;
  void *v34;
  CGColor *v35;
  double v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  double v42;
  double v43;
  CGFloat v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGLayer *v60;
  CGContext *Context;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  double v70;
  SEL v72;
  _OWORD v73[3];
  CGAffineTransform v74;
  CGAffineTransform transform;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _OWORD v79[4];
  CGSize v80;
  CGRect v81;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = sub_1000630C4(width, height);
  v14 = v13;
  v15 = sub_10005FDDC();
  v19 = sub_100063148(v15, v16, v17, v18);
  Image = 0;
  if (v21 != 0.0)
  {
    v24 = v22;
    if (v22 != 0.0)
    {
      v25 = v19;
      v26 = v21;
      Image = 0;
      v27 = ceil(fmax(v12, v21));
      if (v27 > 0.0 && ceil(fmax(v14, v22)) > 0.0)
      {
        v28 = v20;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
        v30 = (CGColor *)objc_msgSend(v29, "CGColor");

        v31 = sub_10040FA64(11, v26, v24);
        if (v31)
        {
          v32 = v31;
          v72 = a5;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));
          v34 = v33;
          v35 = v30;
          if (v33)
            objc_msgSend(v33, "transformInRoot");
          else
            memset(v79, 0, 48);
          v36 = sub_1000791B0(v79);
          sub_100410CB4((uint64_t)v32, v36);

          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
          v38 = objc_msgSend(v37, "isPrinting");
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
          v40 = objc_msgSend(v39, "isDrawingIntoPDF");
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
          objc_msgSend(v41, "contentsScale");
          sub_10040F974((uint64_t)v32, (uint64_t)v38, (uint64_t)v40, 1, 0, v42);

          -[CRLShadow radius](self, "radius");
          v44 = v43;
          CGContextTranslateCTM(v32, -v25, -v28);
          CGContextTranslateCTM(v32, -(v27 + 10.0), -0.0);
          if (v6)
          {
            v77 = 0u;
            v78 = 0u;
            v76 = 0u;
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "geometry"));
            v47 = v46;
            if (v46)
            {
              objc_msgSend(v46, "transform");
            }
            else
            {
              v77 = 0u;
              v78 = 0u;
              v76 = 0u;
            }

            if (sub_100060C0C(*(double *)&v76, *(double *)&v77, *((double *)&v76 + 1), *((double *)&v77 + 1)) > 0.0)
            {
              transform.a = -1.0;
              transform.b = 0.0;
              transform.c = 0.0;
              transform.d = 1.0;
              transform.tx = v12;
              transform.ty = 0.0;
              CGContextConcatCTM(v32, &transform);
            }
            v74.b = 0.0;
            v74.c = 0.0;
            v74.a = 1.0;
            *(_OWORD *)&v74.d = xmmword_100EEE790;
            v74.ty = v14;
            CGContextConcatCTM(v32, &v74);
          }
          v80.height = 0.0;
          v80.width = v27 + 10.0;
          CGContextSetShadowWithColor(v32, v80, v44, v35);
          CGContextTranslateCTM(v32, v44, v44);
          if (objc_msgSend(v11, "canDrawShadowInOneStepWithChildren:", 1))
          {
            objc_msgSend(v11, "performSelector:withObject:", v72, v32);
          }
          else
          {
            objc_msgSend(v11, "naturalBounds");
            v49 = v48;
            v51 = v50;
            sub_10005FDDC();
            v53 = v52;
            v55 = v54;
            v56 = sub_100062E10(v49, v51, 2048.0, 2048.0);
            if (v56 > 0.0 && v57 > 0.0)
            {
              v58 = v56 / v53;
              v59 = v57 / v55;
              v60 = CGLayerCreateWithContext(v32, *(CGSize *)&v56, 0);
              Context = CGLayerGetContext(v60);
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));
              v63 = v62;
              if (v62)
                objc_msgSend(v62, "transformInRoot");
              else
                memset(v73, 0, sizeof(v73));
              v64 = sub_1000791B0(v73);
              sub_100410CB4((uint64_t)Context, v64);

              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
              v66 = objc_msgSend(v65, "isPrinting");
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
              v68 = objc_msgSend(v67, "isDrawingIntoPDF");
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
              objc_msgSend(v69, "contentsScale");
              sub_10040F974((uint64_t)Context, (uint64_t)v66, (uint64_t)v68, 0, 0, v70);

              CGContextScaleCTM(Context, v58, v59);
              objc_msgSend(v11, "performSelector:withObject:", v72, Context);
              sub_10040F32C((uint64_t)Context);
              v81.origin.x = sub_10005FDDC();
              CGContextDrawLayerInRect(v32, v81, v60);
              CGLayerRelease(v60);
            }
          }
          Image = CGBitmapContextCreateImage(v32);
          sub_10040F32C((uint64_t)v32);
          CGContextRelease(v32);
        }
        else
        {
          Image = 0;
        }
      }
    }
  }

  return Image;
}

@end
