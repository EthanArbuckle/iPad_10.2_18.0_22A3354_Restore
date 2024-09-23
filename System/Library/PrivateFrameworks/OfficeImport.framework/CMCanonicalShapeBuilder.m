@implementation CMCanonicalShapeBuilder

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
  double v20;
  double v21;
  double v22;
  __int128 v23;
  float v24;
  float v25;
  __int128 v26;
  __int128 v27;
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
  float v40;
  float v41;
  __int128 v42;
  CGAffineTransform *result;
  __int128 v44;
  void *v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;

  orientedBounds = self->super._orientedBounds;
  if (!orientedBounds)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("CMCanonicalShapeBuilder.mm"), 59, CFSTR("oriented bounds not set"));

    orientedBounds = self->super._orientedBounds;
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
  -[OADOrientedBounds rotation](self->super._orientedBounds, "rotation");
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    v9 = NSTransposedRectWithSameCenter(v9, v11, v13, v15);
    v11 = v20;
    v13 = v21;
    v15 = v22;
  }
  v23 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v56.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v56.c = v23;
  *(_OWORD *)&v56.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(retstr, &v56, v9, v11);
  -[OADOrientedBounds rotation](self->super._orientedBounds, "rotation");
  v25 = v24 * 3.14159265 / 180.0;
  if (v25 != 0.0)
  {
    v26 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v54.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v54.c = v26;
    *(_OWORD *)&v54.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v55, &v54, v13 * 0.5, v15 * 0.5);
    v27 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
    v28 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v53.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v53.c = v28;
    *(_OWORD *)&v53.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v55, &v53, v25);
    v29 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v29;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
    v30 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v52.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v52.c = v30;
    *(_OWORD *)&v52.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v55, &v52, -(v13 * 0.5), -(v15 * 0.5));
    v31 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v31;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
  }
  if (-[OADOrientedBounds flipX](self->super._orientedBounds, "flipX"))
  {
    v32 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v51.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v51.c = v32;
    *(_OWORD *)&v51.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v55, &v51, -1.0, 1.0);
    v33 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v33;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
    v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v50.c = v34;
    *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v55, &v50, -v13, 0.0);
    v35 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v35;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
  }
  if (!-[OADOrientedBounds flipY](self->super._orientedBounds, "flipY"))
  {
    v36 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v49.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v49.c = v36;
    *(_OWORD *)&v49.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v55, &v49, 1.0, -1.0);
    v37 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v37;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
    v38 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v48.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v48.c = v38;
    *(_OWORD *)&v48.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v55, &v48, 0.0, -v15);
    v39 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v39;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
  }
  v40 = v13 / v17;
  v41 = v15 / v19;
  v42 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v47.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v47.c = v42;
  *(_OWORD *)&v47.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v55, &v47, v40, v41);
  v44 = *(_OWORD *)&v55.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
  *(_OWORD *)&retstr->c = v44;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
  return result;
}

- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3
{
  double v5;
  double v6;
  double v7;
  CGPath *result;
  int type;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  CMCanonicalShapeBuilder *v26;
  uint64_t v27;
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
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _OWORD v56[3];
  _OWORD v57[3];
  _OWORD v58[3];
  _OWORD v59[3];
  _OWORD v60[3];
  _OWORD v61[3];
  _OWORD v62[3];
  _OWORD v63[3];
  _OWORD v64[3];
  _OWORD v65[3];
  _OWORD v66[3];
  _OWORD v67[3];
  _OWORD v68[3];
  _OWORD v69[3];
  _OWORD v70[3];
  _OWORD v71[3];
  _OWORD v72[3];
  _OWORD v73[3];
  _OWORD v74[3];
  _OWORD v75[3];
  _OWORD v76[3];
  _OWORD v77[3];
  _OWORD v78[3];
  _OWORD v79[3];
  _OWORD v80[3];
  _OWORD v81[3];
  _OWORD v82[3];
  _OWORD v83[3];
  _OWORD v84[3];
  _OWORD v85[3];
  _OWORD v86[3];
  _OWORD v87[3];
  _OWORD v88[3];
  _OWORD v89[3];
  _OWORD v90[3];
  _OWORD v91[3];
  _OWORD v92[3];
  _OWORD v93[3];
  _OWORD v94[3];
  _OWORD v95[3];
  _OWORD v96[3];
  _OWORD v97[3];
  _OWORD v98[3];

  -[OADOrientedBounds bounds](self->super._orientedBounds, "bounds");
  LODWORD(v7) = 1068146622;
  if (v5 != 0.0 && v6 != 0.0)
  {
    v7 = v5 / v6;
    *(float *)&v7 = v5 / v6;
    *(float *)&v7 = fabsf(*(float *)&v7);
  }
  result = 0;
  type = self->super._type;
  if (type > 186)
  {
    switch(type)
    {
      case 202:
LABEL_11:
        v12 = *(_OWORD *)&a3->c;
        v98[0] = *(_OWORD *)&a3->a;
        v98[1] = v12;
        v98[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyRectangleWithTransform:andAspectRatio:](self, "copyRectangleWithTransform:andAspectRatio:", v98, v7);
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
        return result;
      case 208:
        v28 = *(_OWORD *)&a3->c;
        v81[0] = *(_OWORD *)&a3->a;
        v81[1] = v28;
        v81[2] = *(_OWORD *)&a3->tx;
        v25 = v81;
        v26 = self;
        v27 = 6;
        goto LABEL_54;
      case 209:
        v29 = *(_OWORD *)&a3->c;
        v80[0] = *(_OWORD *)&a3->a;
        v80[1] = v29;
        v80[2] = *(_OWORD *)&a3->tx;
        v25 = v80;
        v26 = self;
        v27 = 7;
        goto LABEL_54;
      case 210:
        v30 = *(_OWORD *)&a3->c;
        v78[0] = *(_OWORD *)&a3->a;
        v78[1] = v30;
        v78[2] = *(_OWORD *)&a3->tx;
        v25 = v78;
        v26 = self;
        v27 = 10;
        goto LABEL_54;
      case 211:
        v31 = *(_OWORD *)&a3->c;
        v77[0] = *(_OWORD *)&a3->a;
        v77[1] = v31;
        v77[2] = *(_OWORD *)&a3->tx;
        v25 = v77;
        v26 = self;
        v27 = 12;
LABEL_54:
        result = -[CMCanonicalShapeBuilder copyStarWithTransform:aspectRatio:andBranchNumber:](v26, "copyStarWithTransform:aspectRatio:andBranchNumber:", v25, v27, v7);
        break;
      default:
        switch(type)
        {
          case 247:
            v11 = *(_OWORD *)&a3->c;
            v60[0] = *(_OWORD *)&a3->a;
            v60[1] = v11;
            v60[2] = *(_OWORD *)&a3->tx;
            result = -[CMCanonicalShapeBuilder copyRightDiagramArrowWithTransform:andAspectRatio:](self, "copyRightDiagramArrowWithTransform:andAspectRatio:", v60);
            break;
          case 248:
            v32 = *(_OWORD *)&a3->c;
            v59[0] = *(_OWORD *)&a3->a;
            v59[1] = v32;
            v59[2] = *(_OWORD *)&a3->tx;
            result = -[CMCanonicalShapeBuilder copyUpDiagramArrowWithTransform:andAspectRatio:](self, "copyUpDiagramArrowWithTransform:andAspectRatio:", v59, v7);
            break;
          case 249:
            v33 = *(_OWORD *)&a3->c;
            v58[0] = *(_OWORD *)&a3->a;
            v58[1] = v33;
            v58[2] = *(_OWORD *)&a3->tx;
            result = -[CMCanonicalShapeBuilder copyPyramidLayerWithTransform:andAspectRatio:](self, "copyPyramidLayerWithTransform:andAspectRatio:", v58, v7);
            break;
          case 250:
            v34 = *(_OWORD *)&a3->c;
            v57[0] = *(_OWORD *)&a3->a;
            v57[1] = v34;
            v57[2] = *(_OWORD *)&a3->tx;
            result = -[CMCanonicalShapeBuilder copyPieWithTransform:andAspectRatio:](self, "copyPieWithTransform:andAspectRatio:", v57, v7);
            break;
          case 251:
            v35 = *(_OWORD *)&a3->c;
            v56[0] = *(_OWORD *)&a3->a;
            v56[1] = v35;
            v56[2] = *(_OWORD *)&a3->tx;
            result = -[CMCanonicalShapeBuilder copyDiagramCircularArrowWithTransform:andAspectRatio:](self, "copyDiagramCircularArrowWithTransform:andAspectRatio:", v56, v7);
            break;
          default:
            if (type == 187)
            {
              v24 = *(_OWORD *)&a3->c;
              v83[0] = *(_OWORD *)&a3->a;
              v83[1] = v24;
              v83[2] = *(_OWORD *)&a3->tx;
              v25 = v83;
              v26 = self;
              v27 = 4;
              goto LABEL_54;
            }
            break;
        }
        break;
    }
  }
  else
  {
    switch(type)
    {
      case 1:
      case 47:
      case 97:
        goto LABEL_11;
      case 2:
        goto LABEL_24;
      case 3:
        v36 = *(_OWORD *)&a3->c;
        v95[0] = *(_OWORD *)&a3->a;
        v95[1] = v36;
        v95[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyEllipseWithTransform:andAspectRatio:](self, "copyEllipseWithTransform:andAspectRatio:", v95, v7);
      case 4:
      case 110:
        v15 = *(_OWORD *)&a3->c;
        v93[0] = *(_OWORD *)&a3->a;
        v93[1] = v15;
        v93[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyDiamondWithTransform:andAspectRatio:](self, "copyDiamondWithTransform:andAspectRatio:", v93, v7);
      case 5:
        v37 = *(_OWORD *)&a3->c;
        v92[0] = *(_OWORD *)&a3->a;
        v92[1] = v37;
        v92[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyTriangleWithTransform:andAspectRatio:](self, "copyTriangleWithTransform:andAspectRatio:", v92, v7);
      case 6:
        v38 = *(_OWORD *)&a3->c;
        v91[0] = *(_OWORD *)&a3->a;
        v91[1] = v38;
        v91[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyRightTriangleWithTransform:andAspectRatio:](self, "copyRightTriangleWithTransform:andAspectRatio:", v91, v7);
      case 7:
        v39 = *(_OWORD *)&a3->c;
        v97[0] = *(_OWORD *)&a3->a;
        v97[1] = v39;
        v97[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyParallelogramWithTransform:andAspectRatio:](self, "copyParallelogramWithTransform:andAspectRatio:", v97, v7);
      case 8:
        v40 = *(_OWORD *)&a3->c;
        v96[0] = *(_OWORD *)&a3->a;
        v96[1] = v40;
        v96[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyTrapezoidWithTransform:andAspectRatio:](self, "copyTrapezoidWithTransform:andAspectRatio:", v96, v7);
      case 9:
        v41 = *(_OWORD *)&a3->c;
        v86[0] = *(_OWORD *)&a3->a;
        v86[1] = v41;
        v86[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyHexagonWithTransform:andAspectRatio:](self, "copyHexagonWithTransform:andAspectRatio:", v86, v7);
      case 10:
        v42 = *(_OWORD *)&a3->c;
        v85[0] = *(_OWORD *)&a3->a;
        v85[1] = v42;
        v85[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyOctagonWithTransform:andAspectRatio:](self, "copyOctagonWithTransform:andAspectRatio:", v85, v7);
      case 11:
        v43 = *(_OWORD *)&a3->c;
        v90[0] = *(_OWORD *)&a3->a;
        v90[1] = v43;
        v90[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyPlusWithTransform:andAspectRatio:](self, "copyPlusWithTransform:andAspectRatio:", v90, v7);
      case 12:
        v44 = *(_OWORD *)&a3->c;
        v82[0] = *(_OWORD *)&a3->a;
        v82[1] = v44;
        v82[2] = *(_OWORD *)&a3->tx;
        v25 = v82;
        v26 = self;
        v27 = 5;
        goto LABEL_54;
      case 13:
      case 78:
        v16 = *(_OWORD *)&a3->c;
        v71[0] = *(_OWORD *)&a3->a;
        v71[1] = v16;
        v71[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyRightArrowWithTransform:andAspectRatio:](self, "copyRightArrowWithTransform:andAspectRatio:", v71, v7);
      case 14:
      case 17:
      case 18:
      case 19:
      case 21:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 57:
      case 64:
      case 65:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 93:
      case 94:
      case 95:
      case 96:
      case 98:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 107:
      case 108:
      case 109:
        return result;
      case 15:
        v45 = *(_OWORD *)&a3->c;
        v69[0] = *(_OWORD *)&a3->a;
        v69[1] = v45;
        v69[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyHomePlateWithTransform:andAspectRatio:](self, "copyHomePlateWithTransform:andAspectRatio:", v69, v7);
      case 16:
        v46 = *(_OWORD *)&a3->c;
        v89[0] = *(_OWORD *)&a3->a;
        v89[1] = v46;
        v89[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyCubeWithTransform:andAspectRatio:](self, "copyCubeWithTransform:andAspectRatio:", v89, v7);
      case 20:
        v47 = *(_OWORD *)&a3->c;
        v73[0] = *(_OWORD *)&a3->a;
        v73[1] = v47;
        v73[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyLineWithTransform:andAspectRatio:](self, "copyLineWithTransform:andAspectRatio:", v73, v7);
      case 22:
        v48 = *(_OWORD *)&a3->c;
        v88[0] = *(_OWORD *)&a3->a;
        v88[1] = v48;
        v88[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyCanWithTransform:andAspectRatio:](self, "copyCanWithTransform:andAspectRatio:", v88, v7);
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
        v10 = *(_OWORD *)&a3->c;
        v72[0] = *(_OWORD *)&a3->a;
        v72[1] = v10;
        v72[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyStraightConnector1tWithTransform:andAspectRatio:](self, "copyStraightConnector1tWithTransform:andAspectRatio:", v72, v7);
      case 55:
        v49 = *(_OWORD *)&a3->c;
        v70[0] = *(_OWORD *)&a3->a;
        v70[1] = v49;
        v70[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyChevronWithTransform:andAspectRatio:](self, "copyChevronWithTransform:andAspectRatio:", v70, v7);
      case 56:
        v50 = *(_OWORD *)&a3->c;
        v87[0] = *(_OWORD *)&a3->a;
        v87[1] = v50;
        v87[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyPentagonWithTransform:andAspectRatio:](self, "copyPentagonWithTransform:andAspectRatio:", v87, v7);
      case 58:
        v51 = *(_OWORD *)&a3->c;
        v79[0] = *(_OWORD *)&a3->a;
        v79[1] = v51;
        v79[2] = *(_OWORD *)&a3->tx;
        v25 = v79;
        v26 = self;
        v27 = 8;
        goto LABEL_54;
      case 59:
        v52 = *(_OWORD *)&a3->c;
        v76[0] = *(_OWORD *)&a3->a;
        v76[1] = v52;
        v76[2] = *(_OWORD *)&a3->tx;
        v25 = v76;
        v26 = self;
        v27 = 16;
        goto LABEL_54;
      case 60:
        v53 = *(_OWORD *)&a3->c;
        v74[0] = *(_OWORD *)&a3->a;
        v74[1] = v53;
        v74[2] = *(_OWORD *)&a3->tx;
        v25 = v74;
        v26 = self;
        v27 = 32;
        goto LABEL_54;
      case 61:
      case 62:
      case 63:
      case 106:
        v13 = *(_OWORD *)&a3->c;
        v84[0] = *(_OWORD *)&a3->a;
        v84[1] = v13;
        v84[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyWedgeRectWithTransform:andAspectRatio:](self, "copyWedgeRectWithTransform:andAspectRatio:", v84, v7);
      case 66:
      case 77:
        v17 = *(_OWORD *)&a3->c;
        v68[0] = *(_OWORD *)&a3->a;
        v68[1] = v17;
        v68[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyLeftArrowWithTransform:andAspectRatio:](self, "copyLeftArrowWithTransform:andAspectRatio:", v68, v7);
      case 67:
      case 80:
        v18 = *(_OWORD *)&a3->c;
        v66[0] = *(_OWORD *)&a3->a;
        v66[1] = v18;
        v66[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyDownArrowWithTransform:andAspectRatio:](self, "copyDownArrowWithTransform:andAspectRatio:", v66, v7);
      case 68:
      case 79:
        v19 = *(_OWORD *)&a3->c;
        v67[0] = *(_OWORD *)&a3->a;
        v67[1] = v19;
        v67[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyUpArrowWithTransform:andAspectRatio:](self, "copyUpArrowWithTransform:andAspectRatio:", v67, v7);
      case 69:
      case 81:
        v20 = *(_OWORD *)&a3->c;
        v65[0] = *(_OWORD *)&a3->a;
        v65[1] = v20;
        v65[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyLeftRightArrowWithTransform:andAspectRatio:](self, "copyLeftRightArrowWithTransform:andAspectRatio:", v65, v7);
      case 70:
      case 82:
        v21 = *(_OWORD *)&a3->c;
        v64[0] = *(_OWORD *)&a3->a;
        v64[1] = v21;
        v64[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyUpDownArrowWithTransform:andAspectRatio:](self, "copyUpDownArrowWithTransform:andAspectRatio:", v64, v7);
      case 76:
      case 83:
        v22 = *(_OWORD *)&a3->c;
        v63[0] = *(_OWORD *)&a3->a;
        v63[1] = v22;
        v63[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyQuadArrowWithTransform:andAspectRatio:](self, "copyQuadArrowWithTransform:andAspectRatio:", v63, v7);
      case 92:
        v54 = *(_OWORD *)&a3->c;
        v75[0] = *(_OWORD *)&a3->a;
        v75[1] = v54;
        v75[2] = *(_OWORD *)&a3->tx;
        v25 = v75;
        v26 = self;
        v27 = 24;
        goto LABEL_54;
      case 99:
        v55 = *(_OWORD *)&a3->c;
        v61[0] = *(_OWORD *)&a3->a;
        v61[1] = v55;
        v61[2] = *(_OWORD *)&a3->tx;
        return -[CMCanonicalShapeBuilder copyCircularArrowWithTransform:andAspectRatio:](self, "copyCircularArrowWithTransform:andAspectRatio:", v61, v7);
      default:
        if (type == 176)
        {
LABEL_24:
          v23 = *(_OWORD *)&a3->c;
          v94[0] = *(_OWORD *)&a3->a;
          v94[1] = v23;
          v94[2] = *(_OWORD *)&a3->tx;
          result = -[CMCanonicalShapeBuilder copyRoundedRectWithTransform:andAspectRatio:](self, "copyRoundedRectWithTransform:andAspectRatio:", v94, v7);
        }
        else if (type == 182)
        {
          v14 = *(_OWORD *)&a3->c;
          v62[0] = *(_OWORD *)&a3->a;
          v62[1] = v14;
          v62[2] = *(_OWORD *)&a3->tx;
          result = -[CMCanonicalShapeBuilder copyLeftRightUpArrowWithTransform:andAspectRatio:](self, "copyLeftRightUpArrowWithTransform:andAspectRatio:", v62, v7);
        }
        break;
    }
  }
  return result;
}

- (CGPath)copyRectangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGPath *Mutable;
  CGRect v15;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  Mutable = CGPathCreateMutable();
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  CGPathAddRect(Mutable, a3, v15);
  return Mutable;
}

- (CGPath)copyRoundedRectWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  NSDictionary *adjustValues;
  double v18;
  void *v19;
  void *v20;
  double v21;
  float v22;
  float v23;
  float v24;
  double v25;
  double v26;
  CGPath *Mutable;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  v8 = v7;
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v11 = v10;
  v13 = v12;
  v14 = v9;
  v16 = v15;
  adjustValues = self->super._adjustValues;
  v18 = v9 / 6.0;
  if (adjustValues)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v18;
    if (v20)
    {
      objc_msgSend(v20, "floatValue");
      v23 = v22;
      objc_msgSend(v20, "floatValue");
      v21 = v14 * 0.5 * (float)(v23 / v8);
      v18 = v14 * 0.5 * (float)(v24 / v8);
    }

  }
  else
  {
    v21 = v9 / 6.0;
  }
  v25 = v21 * a4;
  if (a4 >= 1.0)
    v25 = v21;
  if (a4 > 1.0)
    v26 = v21 / a4;
  else
    v26 = v25;
  Mutable = CGPathCreateMutable();
  v28 = v11 + v26;
  CGPathMoveToPoint(Mutable, a3, v11 + v26, v13);
  v29 = v11 + v14;
  v30 = v29 - v26;
  CGPathAddLineToPoint(Mutable, a3, v30, v13);
  v31 = v13 + v18;
  CGPathAddQuadCurveToPoint(Mutable, a3, v29, v13, v29, v13 + v18);
  v32 = v13 + v16;
  v33 = v32 - v18;
  CGPathAddLineToPoint(Mutable, a3, v29, v33);
  CGPathAddQuadCurveToPoint(Mutable, a3, v29, v32, v30, v32);
  CGPathAddLineToPoint(Mutable, a3, v28, v32);
  CGPathAddQuadCurveToPoint(Mutable, a3, v11, v32, v11, v33);
  CGPathAddLineToPoint(Mutable, a3, v11, v31);
  CGPathAddQuadCurveToPoint(Mutable, a3, v11, v13, v28, v13);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyRightArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *Mutable;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      v12 = 7.5;
    }
    v14 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v12 = 7.5;
    v13 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v19, v13 + v21);
  v27 = v12 + v19;
  CGPathAddLineToPoint(Mutable, a3, v27, v13 + v21);
  CGPathAddLineToPoint(Mutable, a3, v27, v21);
  v28 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v19 + v23, v28 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v27, v28);
  v29 = v28 - v13;
  CGPathAddLineToPoint(Mutable, a3, v27, v29);
  CGPathAddLineToPoint(Mutable, a3, v19, v29);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyDownArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *Mutable;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      v12 = 2.5;
    }
    v14 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v13 = 10.0 - v17 * 10.0 / (v8 + v8);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v13 = 2.5;
    v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  Mutable = CGPathCreateMutable();
  v27 = v19 + v23;
  CGPathMoveToPoint(Mutable, a3, v27 * 0.5, v21);
  v28 = v13 + v21;
  CGPathAddLineToPoint(Mutable, a3, v27, v28);
  v29 = v27 - v12;
  CGPathAddLineToPoint(Mutable, a3, v29, v28);
  v30 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v29, v30);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v30);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v28);
  CGPathAddLineToPoint(Mutable, a3, v19, v28);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyEllipseWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGPath *Mutable;
  CGRect v15;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  Mutable = CGPathCreateMutable();
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  CGPathAddEllipseInRect(Mutable, a3, v15);
  return Mutable;
}

- (CGPath)copyRightTriangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPath *Mutable;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v6, v8);
  CGPathAddLineToPoint(Mutable, a3, v6 + v10, v8);
  CGPathAddLineToPoint(Mutable, a3, v6, v8 + v12);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyLeftArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *Mutable;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      v12 = 2.5;
    }
    v14 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v13 = 2.5;
    v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  Mutable = CGPathCreateMutable();
  v27 = v21 + v25;
  CGPathMoveToPoint(Mutable, a3, v19, v27 * 0.5);
  v28 = v12 + v19;
  CGPathAddLineToPoint(Mutable, a3, v28, v21);
  v29 = v13 + v21;
  CGPathAddLineToPoint(Mutable, a3, v28, v29);
  v30 = v19 + v23;
  CGPathAddLineToPoint(Mutable, a3, v30, v29);
  CGPathAddLineToPoint(Mutable, a3, v30, v27 - v13);
  CGPathAddLineToPoint(Mutable, a3, v28, v27 - v13);
  CGPathAddLineToPoint(Mutable, a3, v28, v27);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyDiamondWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPath *Mutable;
  CGFloat v14;
  CGFloat v15;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  Mutable = CGPathCreateMutable();
  v14 = v6 + v10;
  CGPathMoveToPoint(Mutable, a3, v14 * 0.5, v8);
  v15 = v8 + v12;
  CGPathAddLineToPoint(Mutable, a3, v14, v15 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v14 * 0.5, v15);
  CGPathAddLineToPoint(Mutable, a3, v6, v15 * 0.5);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyCubeWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v7;
  NSDictionary *adjustValues;
  float v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPath *Mutable;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      v13 = v12 * 10.0 / (float)(v9 + v9);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v13 = 2.5;
  }
  if (a4 <= 1.0)
  {
    v14 = v13 * a4;
  }
  else
  {
    v14 = v13;
    v13 = v13 / a4;
  }
  v15 = 10.0 - v13;
  v16 = 10.0 - v14;
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v18, v20);
  CGPathAddLineToPoint(Mutable, a3, v15 + v18, v20);
  v26 = v16 + v20;
  CGPathAddLineToPoint(Mutable, a3, v15 + v18, v16 + v20);
  CGPathAddLineToPoint(Mutable, a3, v18, v16 + v20);
  CGPathCloseSubpath(Mutable);
  CGPathMoveToPoint(Mutable, a3, v15 + v18, v20);
  v27 = v18 + v22;
  v28 = v20 + v24;
  CGPathAddLineToPoint(Mutable, a3, v27, v28 - v16);
  CGPathAddLineToPoint(Mutable, a3, v27, v28);
  CGPathAddLineToPoint(Mutable, a3, v15 + v18, v26);
  CGPathCloseSubpath(Mutable);
  CGPathMoveToPoint(Mutable, a3, v27, v28);
  CGPathAddLineToPoint(Mutable, a3, v27 - v15, v28);
  CGPathAddLineToPoint(Mutable, a3, v18, v26);
  CGPathAddLineToPoint(Mutable, a3, v15 + v18, v26);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyStarWithTransform:(CGAffineTransform *)a3 aspectRatio:(float)a4 andBranchNumber:(int)a5
{
  float v8;
  double v9;
  float v10;
  NSDictionary *adjustValues;
  void *v12;
  void *v13;
  float v14;
  double v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPath *Mutable;
  __double2 v25;
  double v26;
  long double v27;
  int v28;
  __double2 v29;
  __double2 v30;
  long double x;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  v8 = *(float *)&v9;
  LODWORD(v9) = 3.75;
  if (a5 == 5)
    *(float *)&v9 = 1.875;
  if (a5 == 4)
    v10 = 1.25;
  else
    v10 = *(float *)&v9;
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (-[CMShapeBuilder isOffice12](self, "isOffice12"))
      {
        objc_msgSend(v13, "floatValue");
        v15 = v14 * 5.0 / v8;
      }
      else
      {
        objc_msgSend(v13, "floatValue");
        v15 = 5.0 - v16 * 5.0 / v8;
      }
      v10 = v15;
    }

  }
  v17 = 6.28318531 / (double)a5;
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v20 = (v18 + v19) * 0.5;
  v23 = (v21 + v22) * 0.5;
  Mutable = CGPathCreateMutable();
  v25 = __sincos_stret((float)(v17 * 0.0) + 1.57079633);
  CGPathMoveToPoint(Mutable, a3, v25.__cosval * 10.0 * 0.5 + v20, v25.__sinval * 10.0 * 0.5 + v23);
  v26 = v17 * 0.5;
  x = v20 + cos(v26 + 1.57079633) * v10;
  v27 = sin((float)(v17 * 0.5) + 1.57079633);
  CGPathAddLineToPoint(Mutable, a3, x, v23 + v27 * v10);
  if (a5 >= 2)
  {
    v28 = 1;
    do
    {
      v29 = __sincos_stret((float)(v17 * (float)v28) + 1.57079633);
      CGPathAddLineToPoint(Mutable, a3, v20 + v29.__cosval * 10.0 * 0.5, v23 + v29.__sinval * 10.0 * 0.5);
      v30 = __sincos_stret(v26 + (float)(v17 * (float)v28) + 1.57079633);
      CGPathAddLineToPoint(Mutable, a3, v20 + v30.__cosval * v10, v23 + v30.__sinval * v10);
      ++v28;
    }
    while (a5 != v28);
  }
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyTriangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPath *Mutable;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 5.0 / v8;
    }
    else
    {
      v12 = 5.0;
    }

  }
  else
  {
    v12 = 5.0;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v14, v16);
  CGPathAddLineToPoint(Mutable, a3, v14 + v18, v16);
  CGPathAddLineToPoint(Mutable, a3, v14 + v12, v16 + v20);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyStraightConnector1tWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPath *Mutable;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v6, v8 + v12);
  CGPathAddLineToPoint(Mutable, a3, v6 + v10, v8);
  return Mutable;
}

- (CGPath)copyHomePlateWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v7;
  NSDictionary *adjustValues;
  float v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPath *Mutable;
  CGFloat v24;
  CGFloat v25;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      v13 = 10.0 - v12 * 10.0 / (float)((float)(v9 + v9) * a4);
      if (v13 >= 0.0)
        v14 = v13;
      else
        v14 = 0.0;
      if (v14 > 10.0)
        v14 = 10.0;
    }
    else
    {
      v14 = 2.5;
    }

  }
  else
  {
    v14 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v16, v18);
  v24 = v16 + v14;
  CGPathAddLineToPoint(Mutable, a3, v24, v18);
  v25 = v18 + v22;
  CGPathAddLineToPoint(Mutable, a3, v16 + v20, v25 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v24, v25);
  CGPathAddLineToPoint(Mutable, a3, v16, v25);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyWedgeRectWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  float v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGPath *Mutable;
  _BOOL4 v16;
  double v17;
  float v18;
  double v19;
  float v20;
  float v21;
  NSDictionary *adjustValues;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  float v27;
  NSDictionary *v28;
  void *v29;
  void *v30;
  int v31;
  _BOOL4 v32;
  float v33;
  float v34;
  BOOL v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  _BOOL4 v46;
  int v47;
  double v48;
  double v49;
  float v50;
  float v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _BOOL4 v62;
  BOOL v63;
  double v64;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  v7 = v6;
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v64 = v14;
  Mutable = CGPathCreateMutable();
  v16 = -[CMShapeBuilder isOffice12](self, "isOffice12");
  v17 = v7;
  v18 = 5.0;
  if (v16)
    v18 = 3.0;
  v19 = 2.4;
  if (v16)
    v19 = 2.2;
  v20 = v7 / v18;
  v21 = v19 * v17;
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_msgSend(v24, "intValue");
      v26 = -[CMShapeBuilder isOffice12](self, "isOffice12");
      v27 = -0.0;
      if (v26)
        v27 = v7;
      v20 = v27 + (float)v25;
    }
    v28 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v28, "objectForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = objc_msgSend(v30, "intValue");
      v32 = -[CMShapeBuilder isOffice12](self, "isOffice12");
      v33 = -0.0;
      if (v32)
        v33 = v7;
      v21 = v33 + (float)v31;
    }

  }
  v34 = v7 + v7;
  if (v20 > v7 || v21 <= v34)
  {
    if (v20 <= v7 || v21 <= v34)
    {
      if (v20 <= v34 || v21 >= v34 || v21 <= v7)
      {
        v39 = v20 > v34 && v21 < v34;
        if (v39 && v21 > 0.0)
        {
          v47 = 0;
          v40 = 0;
          v41 = 0;
          v43 = 0;
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v42 = 1;
        }
        else if (v20 <= v7 || v21 >= 0.0)
        {
          if (v21 >= 0.0)
          {
            v62 = v20 < 0.0;
            if (v21 >= v34)
              v62 = 0;
            v63 = v20 < 0.0 && v21 < v7;
            v47 = !v63 && !v62;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = 0;
            v45 = v63;
            v46 = !v63 && v62;
          }
          else
          {
            v47 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v45 = 0;
            v46 = 0;
            v44 = 1;
          }
        }
        else
        {
          v47 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v43 = 1;
        }
      }
      else
      {
        v47 = 0;
        v40 = 0;
        v42 = 0;
        v43 = 0;
        v44 = 0;
        v45 = 0;
        v46 = 0;
        v41 = 1;
      }
    }
    else
    {
      v47 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0;
      v40 = 1;
    }
  }
  else
  {
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 1;
  }
  v48 = v20;
  v49 = 10.0;
  v50 = 10.0 / v17 * v48 * 0.5;
  v51 = 10.0 / v17 * v21 * 0.5;
  CGPathMoveToPoint(Mutable, a3, v9, v11);
  v52 = v9 + v13;
  if (v47)
  {
    CGPathAddLineToPoint(Mutable, a3, v9 + v52 / 5.0, v11);
    v53 = v64;
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v11 + v64 - v51);
    v54 = v52 * 0.5;
  }
  else
  {
    v53 = v64;
    if (!v40)
      goto LABEL_45;
    CGPathAddLineToPoint(Mutable, a3, v52 * 0.5 + v52 / 10.0, v11);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v11 + v64 - v51);
    v49 = 5.0;
    v54 = v52;
  }
  CGPathAddLineToPoint(Mutable, a3, v54 - v52 / v49, v11);
LABEL_45:
  CGPathAddLineToPoint(Mutable, a3, v52, v11);
  v55 = v11 + v53;
  if (v41)
  {
    CGPathAddLineToPoint(Mutable, a3, v52, v11 + v55 / 5.0);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    v56 = v55 * 0.5;
    v57 = 10.0;
  }
  else
  {
    if (!v42)
      goto LABEL_50;
    CGPathAddLineToPoint(Mutable, a3, v52, v55 * 0.5 + v55 / 10.0);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    v57 = 5.0;
    v56 = v11 + v53;
  }
  CGPathAddLineToPoint(Mutable, a3, v52, v56 - v55 / v57);
LABEL_50:
  CGPathAddLineToPoint(Mutable, a3, v52, v11 + v53);
  if (v43)
  {
    CGPathAddLineToPoint(Mutable, a3, v52 + v52 / -5.0, v11 + v53);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    v58 = v52 * 0.5;
    v59 = 10.0;
  }
  else
  {
    if (!v44)
      goto LABEL_55;
    CGPathAddLineToPoint(Mutable, a3, v52 * 0.5 + v52 / -10.0, v11 + v53);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    v59 = 5.0;
    v58 = v9;
  }
  CGPathAddLineToPoint(Mutable, a3, v58 + v52 / v59, v11 + v53);
LABEL_55:
  CGPathAddLineToPoint(Mutable, a3, v9, v11 + v53);
  if (v45)
  {
    CGPathAddLineToPoint(Mutable, a3, v9, v55 + v55 / -5.0);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    v11 = v55 * 0.5;
    v60 = 10.0;
LABEL_59:
    CGPathAddLineToPoint(Mutable, a3, v9, v11 + v55 / v60);
    goto LABEL_60;
  }
  if (v46)
  {
    CGPathAddLineToPoint(Mutable, a3, v9, v55 * 0.5 + v55 / -10.0);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    v60 = 5.0;
    goto LABEL_59;
  }
LABEL_60:
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyChevronWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  _BOOL4 v13;
  double v14;
  double v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGPath *Mutable;
  CGFloat v29;
  double v30;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11;
      v13 = -[CMShapeBuilder isOffice12](self, "isOffice12");
      v14 = v12 * 10.0 / (v8 + v8);
      if (v13)
        v15 = v14 * 0.125;
      else
        v15 = 10.0 - v14;
    }
    else
    {
      v15 = 1.25;
    }
    -[NSDictionary objectForKey:](self->super._adjustValues, "objectForKey:", CFSTR("IsHomePlate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v16 = objc_msgSend(v17, "BOOLValue");
    else
      v16 = 0;

  }
  else
  {
    v16 = 0;
    v15 = 1.25;
  }
  v18 = 10.0;
  if (v15 <= 10.0)
    v18 = v15;
  if (v18 >= 0.0)
    v19 = v18;
  else
    v19 = 0.0;
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v21, v23);
  v29 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v29 - v19, v23);
  v30 = v23 + v27;
  CGPathAddLineToPoint(Mutable, a3, v29, v30 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v29 - v19, v30);
  CGPathAddLineToPoint(Mutable, a3, v21, v30);
  if ((v16 & 1) == 0)
    CGPathAddLineToPoint(Mutable, a3, v21 + v19, v30 * 0.5);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyUpArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *Mutable;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      v12 = 2.5;
    }
    v14 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v12 = 2.5;
    v13 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  Mutable = CGPathCreateMutable();
  v27 = v13 + v19;
  CGPathMoveToPoint(Mutable, a3, v13 + v19, v21);
  v28 = v19 + v23;
  v29 = v28 - v13;
  CGPathAddLineToPoint(Mutable, a3, v29, v21);
  v30 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v29, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v28, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v28 * 0.5, v30);
  CGPathAddLineToPoint(Mutable, a3, v19, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v27, v30 - v12);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyCircularArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPath *Mutable;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = v10 * 0.5 / a4;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v7, v9);
  v16 = v7 + v11;
  v17 = v7 + v11 - v14;
  CGPathAddLineToPoint(Mutable, a3, v17, v9);
  v18 = (v14 + v14) / 3.0;
  v19 = v9 + v13;
  CGPathAddCurveToPoint(Mutable, a3, v16 - v18, v9, v16, v9 + v18, v16, v19 * 0.5);
  CGPathAddCurveToPoint(Mutable, a3, v16, v19 - v18, v16 - v18, v19, v17, v19);
  CGPathAddLineToPoint(Mutable, a3, v7, v19);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyLeftRightArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *Mutable;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      v12 = 2.5;
    }
    v14 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v13 = 2.5;
    v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  Mutable = CGPathCreateMutable();
  v27 = v21 + v25;
  CGPathMoveToPoint(Mutable, a3, v19, v27 * 0.5);
  v28 = v12 + v19;
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v21);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v13 + v21);
  v29 = v19 + v23;
  CGPathAddLineToPoint(Mutable, a3, v29 - v12, v13 + v21);
  CGPathAddLineToPoint(Mutable, a3, v29 - v12, v21);
  CGPathAddLineToPoint(Mutable, a3, v29, v27 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v29 - v12, v27);
  CGPathAddLineToPoint(Mutable, a3, v29 - v12, v27 - v13);
  CGPathAddLineToPoint(Mutable, a3, v28, v27 - v13);
  CGPathAddLineToPoint(Mutable, a3, v28, v27);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyTrapezoidWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPath *Mutable;
  _BOOL4 v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 5.0 / v8;
    }
    else
    {
      v12 = 2.5;
    }

  }
  else
  {
    v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  Mutable = CGPathCreateMutable();
  v22 = -[CMShapeBuilder isOffice12](self, "isOffice12");
  v23 = v12;
  v24 = v14 + v23;
  if (v22)
  {
    v25 = v16 + v20;
    CGPathMoveToPoint(Mutable, a3, v24, v25);
    v26 = v14 + v18;
    CGPathAddLineToPoint(Mutable, a3, v26 - v23, v25);
  }
  else
  {
    CGPathMoveToPoint(Mutable, a3, v24, v16);
    v26 = v14 + v18;
    CGPathAddLineToPoint(Mutable, a3, v26 - v23, v16);
    v16 = v16 + v20;
  }
  CGPathAddLineToPoint(Mutable, a3, v26, v16);
  CGPathAddLineToPoint(Mutable, a3, v14, v16);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyUpDownArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *Mutable;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double x;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      v12 = 2.5;
    }
    v14 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v13 = 2.5;
    v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  Mutable = CGPathCreateMutable();
  v27 = v19 + v23;
  x = (v19 + v23) * 0.5;
  CGPathMoveToPoint(Mutable, a3, x, v21);
  v28 = v13 + v21;
  CGPathAddLineToPoint(Mutable, a3, v27, v13 + v21);
  CGPathAddLineToPoint(Mutable, a3, v27 - v12, v13 + v21);
  v29 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v27 - v12, v29 - v13);
  CGPathAddLineToPoint(Mutable, a3, v27, v29 - v13);
  CGPathAddLineToPoint(Mutable, a3, x, v29);
  CGPathAddLineToPoint(Mutable, a3, v19, v29 - v13);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v29 - v13);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v28);
  CGPathAddLineToPoint(Mutable, a3, v19, v28);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyOctagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v7;
  NSDictionary *adjustValues;
  float v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPath *Mutable;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      v13 = v12;
      objc_msgSend(v11, "floatValue");
      v14 = v9;
      v15 = v13 * 5.0 / v9;
      v17 = v16 * 5.0 / v14;
    }
    else
    {
      v15 = 2.5;
      v17 = 2.5;
    }

  }
  else
  {
    v15 = 2.5;
    v17 = 2.5;
  }
  v18 = v17 * a4;
  if (a4 >= 1.0)
    v18 = v17;
  if (a4 > 1.0)
    v19 = v15 / a4;
  else
    v19 = v15;
  if (a4 > 1.0)
    v20 = v17;
  else
    v20 = v18;
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  Mutable = CGPathCreateMutable();
  v30 = v19 + v22;
  CGPathMoveToPoint(Mutable, a3, v19 + v22, v24);
  v31 = v22 + v26;
  v32 = v31 - v19;
  CGPathAddLineToPoint(Mutable, a3, v32, v24);
  v33 = v20 + v24;
  CGPathAddLineToPoint(Mutable, a3, v31, v20 + v24);
  v34 = v24 + v28;
  CGPathAddLineToPoint(Mutable, a3, v31, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v32, v34);
  CGPathAddLineToPoint(Mutable, a3, v30, v34);
  CGPathAddLineToPoint(Mutable, a3, v22, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v22, v33);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyHexagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPath *Mutable;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 5.0 / v8;
    }
    else
    {
      v12 = 2.5;
    }

  }
  else
  {
    v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  Mutable = CGPathCreateMutable();
  v22 = v12;
  v23 = v14 + v12;
  CGPathMoveToPoint(Mutable, a3, v23, v16);
  v24 = v14 + v18;
  v25 = v24 - v22;
  CGPathAddLineToPoint(Mutable, a3, v25, v16);
  v26 = v16 + v20;
  CGPathAddLineToPoint(Mutable, a3, v24, v26 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v25, v26);
  CGPathAddLineToPoint(Mutable, a3, v23, v26);
  CGPathAddLineToPoint(Mutable, a3, v14, v26 * 0.5);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyPlusWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v7;
  NSDictionary *adjustValues;
  float v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPath *Mutable;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      v13 = v12;
      objc_msgSend(v11, "floatValue");
      v14 = v9;
      v15 = v13 * 5.0 / v9;
      v17 = v16 * 5.0 / v14;
    }
    else
    {
      v15 = 2.5;
      v17 = 2.5;
    }

  }
  else
  {
    v15 = 2.5;
    v17 = 2.5;
  }
  v18 = v17 * a4;
  if (a4 >= 1.0)
    v18 = v17;
  if (a4 > 1.0)
    v19 = v15 / a4;
  else
    v19 = v15;
  if (a4 > 1.0)
    v20 = v17;
  else
    v20 = v18;
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  Mutable = CGPathCreateMutable();
  v30 = v19 + v22;
  CGPathMoveToPoint(Mutable, a3, v19 + v22, v24);
  v31 = v22 + v26;
  v32 = v22 + v26 - v19;
  CGPathAddLineToPoint(Mutable, a3, v32, v24);
  v33 = v20 + v24;
  CGPathAddLineToPoint(Mutable, a3, v32, v20 + v24);
  CGPathAddLineToPoint(Mutable, a3, v31, v20 + v24);
  v34 = v24 + v28;
  CGPathAddLineToPoint(Mutable, a3, v31, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v32, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v32, v34);
  CGPathAddLineToPoint(Mutable, a3, v30, v34);
  CGPathAddLineToPoint(Mutable, a3, v30, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v22, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v22, v33);
  CGPathAddLineToPoint(Mutable, a3, v30, v33);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyParallelogramWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPath *Mutable;
  CGFloat v23;
  CGFloat v24;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 5.0 / v8;
    }
    else
    {
      v12 = 2.5;
    }
    if (-[CMShapeBuilder isOffice12](self, "isOffice12"))
      v12 = v12 * 0.5;

    v13 = v12;
  }
  else
  {
    v13 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v15, v17);
  v23 = v15 + v19;
  CGPathAddLineToPoint(Mutable, a3, v23 - v13, v17);
  v24 = v17 + v21;
  CGPathAddLineToPoint(Mutable, a3, v23, v24);
  CGPathAddLineToPoint(Mutable, a3, v13 + v15, v24);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyRightDiagramArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *Mutable;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      v12 = 6.50000006;
    }
    v14 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v13 = 2.5;
    v12 = 6.50000006;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v19, v13 + v21);
  v27 = v12 + v19;
  CGPathAddLineToPoint(Mutable, a3, v27, v13 + v21);
  CGPathAddLineToPoint(Mutable, a3, v27, v21);
  v28 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v19 + v23, v28 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v27, v28);
  v29 = v28 - v13;
  CGPathAddLineToPoint(Mutable, a3, v27, v29);
  CGPathAddLineToPoint(Mutable, a3, v19, v29);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyCanWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPath *Mutable;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double cp1x;
  float v34;
  double v35;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 2.5 / v8;
    }
    else
    {
      v12 = 1.25;
    }

  }
  else
  {
    v12 = 1.25;
  }
  v35 = (float)(v12 * 0.5);
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v13 = v12;
  v34 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  Mutable = CGPathCreateMutable();
  v23 = v15 + v19;
  v24 = v17 + v21;
  v25 = v13;
  CGPathMoveToPoint(Mutable, a3, v15 + v19, v24 - v25);
  CGPathAddLineToPoint(Mutable, a3, v15 + v19, v17 + v25);
  CGPathAddCurveToPoint(Mutable, a3, v15 + v19, v17 + v25 - v35, v23 * 0.5 + 2.5, v17, v23 * 0.5, v17);
  cp1x = (v15 + v19) * 0.5 + -2.5;
  CGPathAddCurveToPoint(Mutable, a3, cp1x, v17, v15, v17 + v25 - v35, v15, v17 + v25);
  CGPathAddLineToPoint(Mutable, a3, v15, v24 - v25);
  v26 = v24 - v25 + v35;
  CGPathAddCurveToPoint(Mutable, a3, v15, v26, cp1x, v24, (v15 + v19) * 0.5, v24);
  v27 = (v15 + v19) * 0.5 + 2.5;
  v28 = v15 + v19;
  v29 = v15 + v19;
  v30 = v24 - v25;
  CGPathAddCurveToPoint(Mutable, a3, v27, v24, v28, v26, v29, v24 - v25);
  v31 = v24 - (float)(v34 + v34);
  CGPathAddCurveToPoint(Mutable, a3, v23, v30 - v35, v27, v31, v23 * 0.5, v31);
  CGPathAddCurveToPoint(Mutable, a3, cp1x, v31, v15, v30 - v35, v15, v30);
  return Mutable;
}

- (CGPath)copyUpDiagramArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *Mutable;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      v12 = 3.49999994;
    }
    v14 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      v13 = 2.5;
    }

  }
  else
  {
    v13 = 2.5;
    v12 = 3.49999994;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  Mutable = CGPathCreateMutable();
  v27 = v13 + v19;
  CGPathMoveToPoint(Mutable, a3, v13 + v19, v21);
  v28 = v19 + v23;
  v29 = v28 - v13;
  CGPathAddLineToPoint(Mutable, a3, v29, v21);
  v30 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v29, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v28, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v28 * 0.5, v30);
  CGPathAddLineToPoint(Mutable, a3, v19, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v27, v30 - v12);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyDiagramCircularArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSDictionary *adjustValues;
  double v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  double v20;
  NSDictionary *v21;
  void *v22;
  void *v23;
  float v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSDictionary *v29;
  void *v30;
  void *v31;
  double v32;
  float v33;
  NSDictionary *v34;
  void *v35;
  void *v36;
  float v37;
  CGPath *Mutable;
  CGFloat v39;
  CGFloat v40;
  __double2 v41;
  CGFloat v42;
  CGFloat v43;
  __double2 v44;
  __double2 v45;
  double v47;
  double v48;
  double v49;
  double startAngle;
  double v51;
  double endAngle;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v7 = v6;
  v9 = v8;
  v49 = v10;
  v11 = v8 * 0.5 * 0.05;
  v12 = v8 * 0.5;
  adjustValues = self->super._adjustValues;
  v51 = v8 * 0.5 * 0.1;
  v48 = v14;
  if (adjustValues)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v18 = v17;
    }
    else
    {
      v18 = 0.0;
    }
    endAngle = v18;
    v21 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v21, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "floatValue");
      v20 = v24;
    }
    else
    {
      v20 = 6.28318531;
    }
    -[OADOrientedBounds bounds](self->super._orientedBounds, "bounds");
    v26 = v25;
    v28 = v27;
    v29 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v29, "objectForKey:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = sqrt(v28 / v49 * (v28 / v49) + v26 / v9 * (v26 / v9));

    if (v31)
    {
      objc_msgSend(v31, "floatValue");
      v11 = v33 / v32;
      v51 = v51 / v32;
    }
    v34 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v34, "objectForKey:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v36, "floatValue");
      v51 = v37 / v32;
    }

    v19 = endAngle;
  }
  else
  {
    v19 = 0.0;
    v20 = 6.28318531;
  }
  v47 = v20;
  startAngle = v20 + (v20 - v19) * -0.1;
  Mutable = CGPathCreateMutable();
  v39 = (v7 + v9) * 0.5;
  v40 = v12 - v11;
  v41 = __sincos_stret(v19);
  v42 = (v48 + v49) * 0.5;
  CGPathMoveToPoint(Mutable, a3, v39 + v40 * v41.__cosval, v42 + v40 * v41.__sinval);
  v43 = v12 + v11;
  CGPathAddLineToPoint(Mutable, a3, v39 + v43 * v41.__cosval, v42 + v43 * v41.__sinval);
  CGPathAddArc(Mutable, a3, v39, v42, v43, v19, startAngle, 1);
  v44 = __sincos_stret(startAngle);
  CGPathAddLineToPoint(Mutable, a3, v39 + (v12 + v51) * v44.__cosval, v42 + (v12 + v51) * v44.__sinval);
  v45 = __sincos_stret(v47);
  CGPathAddLineToPoint(Mutable, a3, v39 + v12 * v45.__cosval, v42 + v12 * v45.__sinval);
  CGPathAddLineToPoint(Mutable, a3, v39 + (v12 - v51) * v44.__cosval, v42 + (v12 - v51) * v44.__sinval);
  CGPathAddLineToPoint(Mutable, a3, v39 + v40 * v44.__cosval, v42 + v40 * v44.__sinval);
  CGPathAddArc(Mutable, a3, v39, v42, v40, startAngle, v19, 0);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyPentagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPath *Mutable;
  CGFloat v14;
  CGFloat v15;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  Mutable = CGPathCreateMutable();
  v14 = v6 + v10;
  CGPathMoveToPoint(Mutable, a3, v14 / 5.0, v8);
  CGPathAddLineToPoint(Mutable, a3, v14 * 4.0 / 5.0, v8);
  v15 = v8 + v12;
  CGPathAddLineToPoint(Mutable, a3, v14, v15 * 3.0 / 5.0);
  CGPathAddLineToPoint(Mutable, a3, v14 * 0.5, v15);
  CGPathAddLineToPoint(Mutable, a3, v6, v15 * 3.0 / 5.0);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyQuadArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  NSDictionary *v16;
  void *v17;
  void *v18;
  float v19;
  NSDictionary *v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGPath *Mutable;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = (10.0 - v11 * 10.0 / v8) * 0.5;
    }
    else
    {
      v12 = 2.0;
    }
    v16 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v16, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      v13 = (10.0 - v19 * 10.0 / v8) * 0.5;
    }
    else
    {
      v13 = 1.0;
    }
    v20 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v20, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "floatValue");
      v14 = v12;
      v15 = v23 * 10.0 / v8 * 0.5;
    }
    else
    {
      v14 = v12;
      v15 = 2.0;
    }

  }
  else
  {
    v13 = 1.0;
    v14 = 2.0;
    v15 = 2.0;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  Mutable = CGPathCreateMutable();
  v39 = v27 + v31;
  v33 = (v27 + v31) * 0.5;
  CGPathMoveToPoint(Mutable, a3, v25, v33);
  v40 = v25 + v15;
  CGPathAddLineToPoint(Mutable, a3, v40, v33 - v14);
  v34 = v13;
  CGPathAddLineToPoint(Mutable, a3, v40, v33 - v34);
  v38 = v25 + v29;
  v35 = (v25 + v29) * 0.5;
  CGPathAddLineToPoint(Mutable, a3, v35 - v34, v33 - v34);
  CGPathAddLineToPoint(Mutable, a3, v35 - v34, v27 + v15);
  CGPathAddLineToPoint(Mutable, a3, v35 - v14, v27 + v15);
  CGPathAddLineToPoint(Mutable, a3, v35, v27);
  CGPathAddLineToPoint(Mutable, a3, v35 + v14, v27 + v15);
  CGPathAddLineToPoint(Mutable, a3, v35 + v34, v27 + v15);
  CGPathAddLineToPoint(Mutable, a3, v35 + v34, v33 - v34);
  v36 = v38 - v15;
  CGPathAddLineToPoint(Mutable, a3, v36, v33 - v34);
  CGPathAddLineToPoint(Mutable, a3, v36, v33 - v14);
  CGPathAddLineToPoint(Mutable, a3, v38, v33);
  CGPathAddLineToPoint(Mutable, a3, v36, v33 + v14);
  CGPathAddLineToPoint(Mutable, a3, v36, v33 + v34);
  CGPathAddLineToPoint(Mutable, a3, v35 + v34, v33 + v34);
  CGPathAddLineToPoint(Mutable, a3, v35 + v34, v39 - v15);
  CGPathAddLineToPoint(Mutable, a3, v35 + v14, v39 - v15);
  CGPathAddLineToPoint(Mutable, a3, v35, v39);
  CGPathAddLineToPoint(Mutable, a3, v35 - v14, v39 - v15);
  CGPathAddLineToPoint(Mutable, a3, v35 - v34, v39 - v15);
  CGPathAddLineToPoint(Mutable, a3, v35 - v34, v33 + v34);
  CGPathAddLineToPoint(Mutable, a3, v40, v33 + v34);
  CGPathAddLineToPoint(Mutable, a3, v40, v33 + v14);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyLeftRightUpArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  float v6;
  NSDictionary *adjustValues;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  NSDictionary *v15;
  void *v16;
  void *v17;
  float v18;
  NSDictionary *v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPath *Mutable;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;

  -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v12 = (10.0 - v11 * 10.0 / v8) * 0.5;
    }
    else
    {
      v12 = 2.0;
    }
    v15 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "floatValue");
      v13 = (10.0 - v18 * 10.0 / v8) * 0.5;
    }
    else
    {
      v13 = 1.0;
    }
    v19 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v19, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "floatValue");
      v14 = v22 * 10.0 / v8 * 0.5;
    }
    else
    {
      v14 = 2.0;
    }

  }
  else
  {
    v13 = 1.0;
    v12 = 2.0;
    v14 = 2.0;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v24 = v23;
  v26 = v25;
  v39 = v27;
  v29 = v28;
  Mutable = CGPathCreateMutable();
  v41 = v26 + v29;
  v31 = (v26 + v29) * 0.5;
  CGPathMoveToPoint(Mutable, a3, v24, v31);
  v40 = v14;
  v42 = v24 + v14;
  v32 = v12;
  v33 = v31 - v12;
  CGPathAddLineToPoint(Mutable, a3, v42, v33);
  v34 = v13;
  v35 = v31 - v13;
  CGPathAddLineToPoint(Mutable, a3, v42, v35);
  v36 = v24 + v39;
  v37 = v24 + v39 - v40;
  CGPathAddLineToPoint(Mutable, a3, v37, v35);
  CGPathAddLineToPoint(Mutable, a3, v37, v33);
  CGPathAddLineToPoint(Mutable, a3, v36, v31);
  CGPathAddLineToPoint(Mutable, a3, v37, v31 + v32);
  CGPathAddLineToPoint(Mutable, a3, v37, v31 + v34);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 + v34, v31 + v34);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 + v34, v41 - v40);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 + v32, v41 - v40);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5, v41);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 - v32, v41 - v40);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 - v34, v41 - v40);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 - v34, v31 + v34);
  CGPathAddLineToPoint(Mutable, a3, v42, v31 + v34);
  CGPathAddLineToPoint(Mutable, a3, v42, v31 + v32);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyPyramidLayerWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  NSDictionary *adjustValues;
  void *v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPath *Mutable;
  CGPath *v21;
  double v22;
  float v23;
  CGFloat v24;
  float v25;
  double v26;
  CGFloat v27;

  adjustValues = self->super._adjustValues;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;
  v11 = v9;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  Mutable = CGPathCreateMutable();
  v21 = Mutable;
  v22 = a4;
  if (v10 >= 0.0)
  {
    v25 = 5.0 / v11 / v22;
    v26 = v25;
    CGPathMoveToPoint(Mutable, a3, v13 + v25, v15 + v19);
    v27 = v13 + v17;
    CGPathAddLineToPoint(v21, a3, v27 - v26, v15 + v19);
    CGPathAddLineToPoint(v21, a3, v27, v15);
  }
  else
  {
    v23 = -5.0 / v11 / v22;
    CGPathMoveToPoint(Mutable, a3, v13, v15 + v19);
    v24 = v13 + v17;
    CGPathAddLineToPoint(v21, a3, v24, v15 + v19);
    CGPathAddLineToPoint(v21, a3, v24 - v23, v15);
    v13 = v13 + v23;
  }
  CGPathAddLineToPoint(v21, a3, v13, v15);
  CGPathCloseSubpath(v21);
  return v21;
}

- (CGPath)copyLineWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPath *Mutable;

  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v6, v8 + v12);
  CGPathAddLineToPoint(Mutable, a3, v6 + v10, v8);
  return Mutable;
}

- (CGPath)copyPieWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  NSDictionary *adjustValues;
  void *v7;
  void *v8;
  float v9;
  double v10;
  double v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGPath *Mutable;
  CGFloat v26;
  CGFloat v27;
  __double2 v28;

  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "floatValue");
      v10 = v9;
    }
    else
    {
      v10 = 0.0;
    }
    v12 = self->super._adjustValues;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "floatValue");
      v11 = v15;
    }
    else
    {
      v11 = 6.28318531;
    }

  }
  else
  {
    v10 = 0.0;
    v11 = 6.28318531;
  }
  +[CMShapeBuilder canonicalBounds](CMCanonicalShapeBuilder, "canonicalBounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = v20 * 0.5;
  Mutable = CGPathCreateMutable();
  v26 = (v17 + v21) * 0.5;
  v27 = (v19 + v23) * 0.5;
  CGPathMoveToPoint(Mutable, a3, v26, v27);
  v28 = __sincos_stret(v10);
  CGPathAddLineToPoint(Mutable, a3, v26 + v24 * v28.__cosval, v27 + v24 * v28.__sinval);
  CGPathAddArc(Mutable, a3, v26, v27, v24, v10, v11, 1);
  CGPathAddLineToPoint(Mutable, a3, v26, v27);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

@end
