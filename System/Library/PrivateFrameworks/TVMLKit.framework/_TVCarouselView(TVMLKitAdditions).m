@implementation _TVCarouselView(TVMLKitAdditions)

- (id)rowMetricsForExpectedWidth:()TVMLKitAdditions firstItemRowIndex:
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  float64x2_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v40;
  float64x2_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float64x2_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "tv_padding");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "itemSize");
  v42 = v13;
  objc_msgSend(a1, "tv_focusMargin");
  v15 = v14;
  objc_msgSend(a1, "tv_focusMargin");
  v17 = v16;
  objc_msgSend(a1, "headerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (float64x2_t)v42;
  if (v18)
  {
    v41 = (float64x2_t)v42;
    objc_msgSend(a1, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tv_margin");
    v40 = v21;
    v23 = v22;
    v25 = v24;
    v43 = v17;
    v27 = v26;

    if (a2 - (v10 + v23 + v12 + v27) >= 2.22044605e-16)
      v28 = a2 - (v10 + v23 + v12 + v27);
    else
      v28 = a2;
    objc_msgSend(a1, "headerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tv_sizeThatFits:", v28, 0.0);
    v31 = v30;

    objc_msgSend(a1, "headerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "tv_alignmentInsetsForExpectedWidth:", v28);
    v34 = v33;

    v19 = vaddq_f64(v41, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v25 + v8 + v40 + v31), 0));
    v35 = v8 + v40 + v34;
    v17 = v43;
    v36 = fmax(fmax(v15 - v25, 0.0) - (v8 + v40), 0.0);
    if (v15 > 0.0)
      v15 = v36;
  }
  else
  {
    v35 = 0.0;
  }
  *a4 = 0x7FFFFFFFFFFFFFFFLL;
  v44 = 0;
  v45 = v19;
  v46 = 0;
  v47 = v35;
  v48 = 0;
  v49 = v35;
  v50 = 0;
  v51 = v15;
  v52 = v17;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v44);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

@end
