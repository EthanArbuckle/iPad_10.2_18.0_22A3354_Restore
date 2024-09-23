@implementation SXColumnCalculator

- (id)columnLayoutWithConstrainedViewportSize:(CGSize)a3 scaledConstrainedViewportSize:(CGSize)a4 viewportSize:(CGSize)a5 documentLayout:(id)a6 contentScaleFactor:(double)a7
{
  double width;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  float v22;
  float v23;
  uint64_t v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  double v36;
  SXColumnLayout *v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  float v42;
  double v44;
  double height;

  height = a5.height;
  width = a5.width;
  v8 = a4.width;
  v44 = a3.height;
  v9 = a3.width;
  v10 = a6;
  v11 = objc_msgSend(v10, "columns");
  v12 = (double)objc_msgSend(v10, "width");
  v13 = (double)objc_msgSend(v10, "margin");
  v14 = (double)objc_msgSend(v10, "gutter");
  v15 = v12 + v13 * 2.0;
  if (v9 <= v12)
    v16 = v12;
  else
    v16 = v9;
  if (v15 >= v16)
    v15 = v16;
  v17 = (v15 - v13 * 2.0 - (v14 * (double)v11 + -1.0)) / (double)v11;
  v18 = floorf(v17);
  v19 = v8 / v15 * v13;
  v20 = -1;
  do
  {
    v21 = v20 + 1;
    v22 = (v8 - v19 * 2.0 - (double)(v20 + 1) * v14) / (double)(v20 + 2);
    v23 = floorf(v22);
    if (v23 < v18)
      break;
    ++v20;
  }
  while (v23 > 0.0);
  if (v21 <= 1)
    v24 = 1;
  else
    v24 = v21;
  v25 = floor(v19);
  v26 = (double)(v24 - 1);
  v27 = (v9 - v25 * 2.0 - v26 * v14) / (double)v24;
  v28 = floorf(v27);
  v29 = width - (v14 * v26 + (double)v24 * v28 + v25 * 2.0);
  if (width <= v15 && v29 > 0.0)
  {
    v30 = v29 * 0.5;
    v31 = floorf(v30);
    v32 = v25 + v29 - v31;
    v25 = v25 + v31;
    v33 = 0.0;
LABEL_18:
    v36 = 0.0;
    goto LABEL_19;
  }
  v33 = 0.0;
  if (v29 <= 0.0)
  {
    v32 = v25;
    goto LABEL_18;
  }
  v34 = v29 * 0.5;
  v35 = floorf(v34);
  v33 = v35 + 0.0;
  v36 = v29 - v35 + 0.0;
  v32 = v25;
LABEL_19:
  v37 = -[SXColumnLayout initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:]([SXColumnLayout alloc], "initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:", v10, objc_msgSend(v10, "columns"), v24, v9, v44, width, height, (double)objc_msgSend(v10, "width"), v25, v32, v28, *(_QWORD *)&v33, *(_QWORD *)&v36, *(_QWORD *)&a7);
  -[SXColumnLayout setMinimumViewportWidthForLooseLayout:](v37, "setMinimumViewportWidthForLooseLayout:", 430.0);
  if (NFInternalBuild())
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "floatForKey:", CFSTR("loose_layouting_threshold_override_enabled"));
    v40 = v39;

    if (v40 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatForKey:", CFSTR("loose_layouting_threshold_override"));
      -[SXColumnLayout setMinimumViewportWidthForLooseLayout:](v37, "setMinimumViewportWidthForLooseLayout:", v42);

    }
  }

  return v37;
}

- (id)columnLayoutWithViewportSize:(CGSize)a3 constrainedToWidth:(double)a4 documentLayout:(id)a5 contentScaleFactor:(double)a6
{
  double height;
  double width;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  SXDocumentLayout *v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CGAffineTransform v28;

  height = a3.height;
  width = a3.width;
  v11 = a5;
  v12 = (double)objc_msgSend(v11, "width");
  v13 = (double)objc_msgSend(v11, "margin");
  v14 = objc_msgSend(v11, "gutter");
  v15 = (double)(uint64_t)v12;
  v16 = v15 * a6;
  if (v15 < a4)
    v15 = a4;
  if (v16 >= v15)
    v17 = v15;
  else
    v17 = v16;
  v18 = -[SXDocumentLayout initWithWidth:margin:gutter:columns:]([SXDocumentLayout alloc], "initWithWidth:margin:gutter:columns:", (uint64_t)v17, (uint64_t)((double)(uint64_t)v13 * a6), (uint64_t)((double)(uint64_t)(double)v14 * a6), objc_msgSend(v11, "columns"));
  v19 = (uint64_t)v17 + 2 * (uint64_t)((double)(uint64_t)v13 * a6);
  if ((double)v19 >= a4)
    v20 = a4;
  else
    v20 = (double)v19;
  if (width >= v20)
    v21 = v20;
  else
    v21 = width;
  v22 = objc_msgSend(v11, "width");

  v23 = a6 - (double)(uint64_t)v17 / (double)v22 + 1.0;
  if (v23 <= 1.0)
    v24 = 1.0;
  else
    v24 = 1.0 / v23;
  CGAffineTransformMakeScale(&v28, v24, v24);
  if (height * v28.c + v28.a * width >= v20)
    v25 = v20;
  else
    v25 = height * v28.c + v28.a * width;
  -[SXColumnCalculator columnLayoutWithConstrainedViewportSize:scaledConstrainedViewportSize:viewportSize:documentLayout:contentScaleFactor:](self, "columnLayoutWithConstrainedViewportSize:scaledConstrainedViewportSize:viewportSize:documentLayout:contentScaleFactor:", v18, v21, height, v25, height * v28.d + v28.b * width, width, height, a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)columnLayoutWithConstrainedViewportSize:(CGSize)a3 viewportSize:(CGSize)a4 documentLayout:(id)a5
{
  return -[SXColumnCalculator columnLayoutWithConstrainedViewportSize:scaledConstrainedViewportSize:viewportSize:documentLayout:contentScaleFactor:](self, "columnLayoutWithConstrainedViewportSize:scaledConstrainedViewportSize:viewportSize:documentLayout:contentScaleFactor:", a5, a3.width, a3.height, a3.width, a3.height, a4.width, a4.height, 1.0);
}

@end
