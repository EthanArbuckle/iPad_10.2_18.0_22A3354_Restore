@implementation MFPMetafileImage

- (MFPMetafileImage)initWithMetafileData:(id)a3
{
  id v5;
  MFPMetafileImage *v6;
  MFPMetafileImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFPMetafileImage;
  v6 = -[MFPMetafileImage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mMetafileData, a3);

  return v7;
}

- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 unit:(int)a5 effect:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  NSData **p_mMetafileData;
  _DWORD *v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  double MinX;
  double MinY;
  double MaxX;
  CGFloat MaxY;
  double v23;
  double v24;
  unsigned __int8 *v25;
  int v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  unint64_t v33;
  __int16 *v34;
  __int16 *v35;
  int v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unsigned __int8 *v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGContext *v57;
  CGFloat v58;
  CGFloat v59;
  NSData **v60;
  int v61;
  CGFloat v62;
  int v63;
  CGFloat v64;
  void *v65;
  id v66;
  CGAffineTransform v68;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a6;
  p_mMetafileData = &self->mMetafileData;
  v13 = -[NSData bytes](*p_mMetafileData, "bytes");
  v14 = -[NSData length](*p_mMetafileData, "length");
  if (v14 < 0x58)
  {
    if (v14 < 0x16)
      goto LABEL_20;
  }
  else if (v13[10] == 1179469088)
  {
    v16 = v13[18];
    v15 = v13[19];
    v18 = v13[20];
    v17 = v13[21];
    v74.origin.x = x;
    v74.origin.y = y;
    v74.size.width = width;
    v74.size.height = height;
    MinX = CGRectGetMinX(v74);
    v75.origin.x = x;
    v75.origin.y = y;
    v75.size.width = width;
    v75.size.height = height;
    MinY = CGRectGetMinY(v75);
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    MaxX = CGRectGetMaxX(v76);
    v77.origin.x = x;
    v77.origin.y = y;
    v77.size.width = width;
    v77.size.height = height;
    MaxY = CGRectGetMaxY(v77);
    v23 = (double)v18 * 100.0 / (double)v16;
    v24 = (double)v17 * 100.0 / (double)v15;
    v13[6] = (int)(MinX * v23);
    v13[7] = (int)(v24 * MinY);
    v13[8] = (int)(v23 * MaxX);
    v13[9] = (int)(v24 * MaxY);
LABEL_19:
    v57 = TCCurrentGraphicsContext();
    CGContextSaveGState(v57);
    +[MFConverter playInCurrentContext:frame:colorMap:fillMap:](MFConverter, "playInCurrentContext:frame:colorMap:fillMap:", *p_mMetafileData, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    CGContextRestoreGState(v57);
    goto LABEL_20;
  }
  if (*v13 == -1698247209)
  {
    v66 = v11;
    v65 = (void *)-[NSData mutableCopy](*p_mMetafileData, "mutableCopy");
    objc_msgSend(v65, "replaceBytesInRange:withBytes:length:", 22, 2, 0, 0);
    objc_storeStrong((id *)p_mMetafileData, v65);
    v25 = -[NSData bytes](*p_mMetafileData, "bytes");
    v26 = -[NSData length](*p_mMetafileData, "length");
    v60 = p_mMetafileData;
    v27 = v25[6];
    v28 = v25[7];
    v29 = v25[8];
    v30 = v25[9];
    v61 = v25[10];
    v31 = v25[11];
    v63 = v25[12];
    v32 = v25[13];
    v33 = (unint64_t)&v25[v26 - 10];
    TCVerifyInputMeetsCondition((unint64_t)v25 <= v33);
    v34 = 0;
    v35 = 0;
    v36 = (__int16)(v28 << 8) | v27;
    v37 = (__int16)(v30 << 8) | v29;
    v38 = (double)v36;
    v39 = (double)v37;
    v40 = (double)(((__int16)(v31 << 8) | v61) - v36);
    v41 = (double)(((__int16)(v32 << 8) | v63) - v37);
    v42 = v25 + 40;
    while ((unint64_t)v42 <= v33)
    {
      TCVerifyInputMeetsCondition(v42 > v25);
      v43 = *v42;
      v44 = v42[1];
      v45 = v42[2];
      v46 = v42[3];
      TCVerifyInputMeetsCondition((v46 >> 7) ^ 1);
      v47 = (2 * v43) | (v44 << 9) | (v45 << 17) | (v46 << 25);
      if (!v47)
        break;
      v48 = *((unsigned __int16 *)v42 + 2);
      if (v48 == 523)
        v35 = (__int16 *)(v42 + 6);
      if (v48 == 524)
        v34 = (__int16 *)(v42 + 6);
      v42 += v47;
      if (v35)
      {
        if (v34)
          break;
      }
    }
    v11 = v66;
    p_mMetafileData = v60;
    if (v35 && v34)
    {
      v58 = v41;
      v59 = v40;
      v62 = v39;
      v64 = v38;
      v49 = (double)v35[1];
      v50 = (double)*v35;
      v51 = (double)v34[1];
      v52 = (double)*v34;
      memset(&v73, 0, sizeof(v73));
      mapSrcRectOntoDstRect((uint64_t)&v73, v49, v50, v51, v52, x, y, width, height);
      memset(&v72, 0, sizeof(v72));
      mapSrcRectOntoDstRect((uint64_t)&v72, v64, v62, v59, v58, v49, v50, v51, v52);
      t1 = v73;
      memset(&v71, 0, sizeof(v71));
      t2 = v72;
      CGAffineTransformConcat(&v71, &t1, &t2);
      v68 = v71;
      v78.origin.x = transformRect(&v68.a, v49, v50);
      v53 = v78.origin.x;
      v54 = v78.origin.y;
      v55 = v78.size.width;
      v56 = v78.size.height;
      v35[1] = (int)CGRectGetMinX(v78);
      v79.origin.x = v53;
      v79.origin.y = v54;
      v79.size.width = v55;
      v79.size.height = v56;
      *v35 = (int)CGRectGetMinY(v79);
      v80.origin.x = v53;
      v80.origin.y = v54;
      v80.size.width = v55;
      v80.size.height = v56;
      v34[1] = (int)CGRectGetWidth(v80);
      v81.origin.x = v53;
      v81.origin.y = v54;
      v81.size.width = v55;
      v81.size.height = v56;
      *v34 = (int)CGRectGetHeight(v81);
    }

    goto LABEL_19;
  }
LABEL_20:

}

- (id)phoneImage
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMetafileData, 0);
}

@end
