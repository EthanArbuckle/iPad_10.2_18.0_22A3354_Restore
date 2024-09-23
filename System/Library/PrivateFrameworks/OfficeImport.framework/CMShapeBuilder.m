@implementation CMShapeBuilder

- (void)setOrientedBounds:(id)a3
{
  objc_storeStrong((id *)&self->_orientedBounds, a3);
}

- (void)setShapeType:(int)a3
{
  self->_type = a3;
}

- (void)setAdjustValues:(id)a3
{
  objc_storeStrong((id *)&self->_adjustValues, a3);
}

- (void)setFileFormat:(unint64_t)a3
{
  self->_format = a3;
}

+ (CGRect)canonicalBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 10.0;
  v5 = 10.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)maxAdjustedValue
{
  _BOOL4 v2;
  float result;

  v2 = -[CMShapeBuilder isOffice12](self, "isOffice12");
  result = 10800.0;
  if (v2)
    return 50000.0;
  return result;
}

- (BOOL)isOffice12
{
  return (self->_format < 7) & (0x54u >> self->_format);
}

- (CGAffineTransform)affineTransform
{
  OADOrientedBounds *orientedBounds;
  uint64_t v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  float v25;
  float v26;
  float v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  float v42;
  float v43;
  __int128 v44;
  CGAffineTransform *result;
  __int128 v46;
  void *v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;

  orientedBounds = self->_orientedBounds;
  if (!orientedBounds)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("CMShapeBuilder.mm"), 44, CFSTR("oriented bounds not set"));

    orientedBounds = self->_orientedBounds;
  }
  v6 = MEMORY[0x24BDBD8B8];
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  -[OADOrientedBounds bounds](orientedBounds, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  +[CMShapeBuilder canonicalBounds](CMShapeBuilder, "canonicalBounds");
  v17 = v16;
  v19 = v18;
  -[OADOrientedBounds rotation](self->_orientedBounds, "rotation");
  v20 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  if (v20)
  {
    v9 = NSTransposedRectWithSameCenter(v9, v11, v13, v15);
    v11 = v21;
    v13 = v22;
    v15 = v23;
  }
  v24 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v58.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v58.c = v24;
  *(_OWORD *)&v58.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(retstr, &v58, v9, v11);
  -[OADOrientedBounds rotation](self->_orientedBounds, "rotation");
  v26 = v25 * 3.14159265 / 180.0;
  if (v26 != 0.0)
  {
    if (v20)
      v27 = v26;
    else
      v27 = -v26;
    v28 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v56.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v56.c = v28;
    *(_OWORD *)&v56.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v57, &v56, v13 * 0.5, v15 * 0.5);
    v29 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v29;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
    v30 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v55.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v55.c = v30;
    *(_OWORD *)&v55.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v57, &v55, v27);
    v31 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v31;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
    v32 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v54.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v54.c = v32;
    *(_OWORD *)&v54.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v57, &v54, -(v13 * 0.5), -(v15 * 0.5));
    v33 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v33;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  }
  if (-[OADOrientedBounds flipX](self->_orientedBounds, "flipX"))
  {
    v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v53.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v53.c = v34;
    *(_OWORD *)&v53.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v57, &v53, -1.0, 1.0);
    v35 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v35;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
    v36 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v52.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v52.c = v36;
    *(_OWORD *)&v52.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v57, &v52, -v13, 0.0);
    v37 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v37;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  }
  if (!-[OADOrientedBounds flipY](self->_orientedBounds, "flipY"))
  {
    v38 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v51.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v51.c = v38;
    *(_OWORD *)&v51.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v57, &v51, 1.0, -1.0);
    v39 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v39;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
    v40 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v50.c = v40;
    *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v57, &v50, 0.0, -v15);
    v41 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v41;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  }
  v42 = v13 / v17;
  v43 = v15 / v19;
  v44 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v49.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v49.c = v44;
  *(_OWORD *)&v49.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v57, &v49, v42, v43);
  v46 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v46;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  return result;
}

- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustValues, 0);
  objc_storeStrong((id *)&self->_orientedBounds, 0);
}

@end
