@implementation SBTouchTemplate

- (unint64_t)matchesPolygon:(id)a3 matchTransformsAllowed:(unint64_t)a4 acceptanceFactor:(double)a5 outMorphedCandidate:(id *)a6
{
  char v8;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  SBPolygon *v14;
  void *v15;
  SBPolygon *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  float v33;
  float v34;
  double v35;
  double v36;
  double v37;
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
  double v48;

  v8 = a4;
  v10 = a3;
  v11 = -[SBPolygon pointCount](self, "pointCount");
  if (v11 > objc_msgSend(v10, "pointCount"))
  {
    v12 = 0;
    goto LABEL_29;
  }
  v13 = -[SBPolygon pointCount](self, "pointCount");
  if (v13 < objc_msgSend(v10, "pointCount"))
  {
    v12 = 2;
    goto LABEL_29;
  }
  v14 = [SBPolygon alloc];
  objc_msgSend(v10, "_points");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBPolygon initWithPoints:](v14, "initWithPoints:", v15);

  if ((v8 & 8) != 0)
  {
    v17 = -[SBPolygon _isLeftHanded](self, "_isLeftHanded");
    if (v17 != -[SBPolygon _isLeftHanded](v16, "_isLeftHanded"))
      -[SBPolygon _flipHorizontally](v16, "_flipHorizontally");
  }
  if ((v8 & 1) != 0)
  {
    -[SBPolygon _meanFingertipRowAngle](self, "_meanFingertipRowAngle");
    v36 = v35;
    -[SBPolygon _meanFingertipRowAngle](v16, "_meanFingertipRowAngle");
    -[SBPolygon _rotate:](v16, "_rotate:", v36 - v37);
    if ((v8 & 2) == 0)
    {
LABEL_10:
      if ((v8 & 4) == 0)
        goto LABEL_11;
LABEL_22:
      -[SBPolygon _weightedCentroid](self, "_weightedCentroid");
      v44 = v43;
      v46 = v45;
      -[SBPolygon _weightedCentroid](v16, "_weightedCentroid");
      -[SBPolygon _translate:](v16, "_translate:", v44 - v47, v46 - v48);
      if (!a6)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_10;
  }
  -[SBPolygon _meanRadius](self, "_meanRadius");
  v39 = v38;
  -[SBPolygon _meanRadius](v16, "_meanRadius");
  v41 = v39 / v40;
  v42 = 1.5;
  if (v41 <= 1.5)
  {
    v42 = v41;
    if (v41 < 0.444444444)
      v42 = 0.444444444;
  }
  -[SBPolygon _scale:](v16, "_scale:", v42);
  if ((v8 & 4) != 0)
    goto LABEL_22;
LABEL_11:
  if (a6)
LABEL_12:
    *a6 = objc_retainAutorelease(v16);
LABEL_13:
  v18 = objc_msgSend(v10, "pointCount");
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0.0;
    v22 = 0.0;
    do
    {
      -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", v20);
      v24 = v23;
      v26 = v25;
      -[SBPolygon _pointAtIndex:](v16, "_pointAtIndex:", v20);
      v28 = v27;
      v30 = v29;
      -[SBPolygon _weightAtIndex:](self, "_weightAtIndex:", v20);
      *(float *)&v31 = v31;
      *(float *)&v31 = *(float *)&v31 * *(float *)&v31;
      v32 = v28 - v24;
      v33 = v30 - v26;
      v22 = v22 + *(float *)&v31 * (float)((float)(v32 * v32) + (float)(v33 * v33));
      v21 = v21 + *(float *)&v31;
      ++v20;
    }
    while (v19 != v20);
    v34 = v22 / v21;
  }
  else
  {
    v34 = NAN;
  }
  if (a5 * 55.0 > sqrtf(v34))
    v12 = 1;
  else
    v12 = 2;

LABEL_29:
  return v12;
}

@end
