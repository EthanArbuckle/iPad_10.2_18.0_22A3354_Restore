@implementation SXCollectionCalculator

+ (id)layoutWithCollectionDisplay:(id)a3 width:(double)a4 numberOfComponents:(unint64_t)a5 unitConverter:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  unint64_t v33;
  int v34;
  void *v35;
  unint64_t v36;
  BOOL v37;
  unint64_t v38;
  unint64_t v39;
  double v40;
  unint64_t v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  BOOL v47;
  double v48;
  double v49;
  double v50;
  unint64_t v51;
  double v52;
  float v53;
  double v54;
  uint64_t v55;
  SXCollectionRowLayout *v56;
  double v57;
  SXCollectionLayout *v58;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char v63;
  double v64;
  double v65;
  void *v66;

  v9 = a3;
  v10 = a6;
  v11 = objc_msgSend(v9, "gutter");
  objc_msgSend(v10, "convertValueToPoints:", v11, v12);
  v14 = v13;
  v15 = objc_msgSend(v9, "minimumWidth");
  objc_msgSend(v10, "convertValueToPoints:", v15, v16);
  if (v17 >= a4)
    v17 = a4;
  if (v14 > a4)
    v17 = a4;
  if (v17 >= 40.0)
    v18 = v17;
  else
    v18 = 40.0;
  v19 = objc_msgSend(v9, "maximumWidth");
  objc_msgSend(v10, "convertValueToPoints:", v19, v20);
  v22 = 0;
  if (v21 == 0.0)
    v21 = a4;
  if (v21 >= v18)
    v23 = v21;
  else
    v23 = v18;
  do
    v24 = v22++;
  while (v22 <= a5 && (a4 - v14 * (double)v24) / (double)v22 > v18);
  if (v24 <= 1)
    v25 = 1;
  else
    v25 = v24;
  v26 = objc_msgSend(v9, "widows");
  if (v25 >= a5 || v26)
  {
    if (objc_msgSend(v9, "widows") != 1)
      goto LABEL_26;
    while (a5 % v25--)
      ;
    goto LABEL_25;
  }
  if ((a5 & 1) == 0)
  {
    while (a5 % v25--)
      ;
LABEL_25:
    ++v25;
    goto LABEL_26;
  }
  if (v25 + a5 / v25 * v25 - a5 >= 2)
  {
    if (v24 <= 1)
      v60 = 1;
    else
      v60 = v24;
    v61 = v60 - 1;
    do
    {
      v62 = --v25 + a5 / v61 * v61 - a5;
      v37 = v61-- != 0;
      v63 = v37;
    }
    while (v62 >= 2 && (v63 & 1) != 0);
    v25 = v61 + 1;
  }
LABEL_26:
  objc_msgSend(v10, "convertValueToPoints:", 0x4069000000000000, 2);
  v65 = v29;
  v30 = objc_msgSend(v9, "rowSpacing");
  v66 = v10;
  objc_msgSend(v10, "convertValueToPoints:", v30, v31);
  v64 = v32;
  v33 = vcvtpd_u64_f64((double)a5 / (double)v25);
  v34 = objc_msgSend(v9, "variableSizing");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    while (1)
    {
      v36 = a5;
      v37 = a5 >= v25;
      a5 -= v25;
      if (v37)
        v38 = v25;
      else
        v38 = v36;
      if (v34)
        v39 = v38;
      else
        v39 = v25;
      v40 = (double)v38;
      v41 = v39 - 1;
      v42 = (double)v25;
      if (v34)
        v42 = (double)v38;
      v43 = a4 - v14 * (double)v41;
      if (v43 / v42 >= v23)
        v44 = v23;
      else
        v44 = v43 / v42;
      v45 = objc_msgSend(v9, "distribution");
      v46 = floor(v44);
      if (v45 || (v14 == 0.0 ? (v47 = v44 < v23) : (v47 = 0), !v47))
        v44 = v46;
      if (v34)
        v48 = v43 - v44 * v40;
      else
        v48 = v43 - v44 * v40 + (double)(v25 - v38) * v14;
      v49 = 0.0;
      if (objc_msgSend(v9, "distribution") == 1)
      {
        if (objc_msgSend(v9, "alignment") == 1)
        {
          v50 = floor(v48 * 0.5);
          v49 = ceil(v48 * 0.5);
        }
        else
        {
          v50 = v48;
          if (objc_msgSend(v9, "alignment") != 2)
          {
            v50 = 0.0;
            if (objc_msgSend(v9, "alignment"))
              v49 = 0.0;
            else
              v49 = v48;
          }
        }
      }
      else
      {
        v50 = 0.0;
      }
      v51 = v38 - 1;
      if (v38 <= 1)
        v52 = 0.0;
      else
        v52 = v14 + (v48 - (v50 + v49)) / (double)v51;
      v53 = v52;
      v54 = -((float)(floorf(v53) * (float)v51) - v52 * (double)(v38 - 1));
      if (v54 <= 0.00000011920929)
        goto LABEL_59;
      v55 = objc_msgSend(v9, "distribution");
      if (!v55)
        goto LABEL_58;
      if (v55 == 1)
        break;
LABEL_59:
      v56 = objc_alloc_init(SXCollectionRowLayout);
      -[SXCollectionRowLayout setIntendedComponentsPerRow:](v56, "setIntendedComponentsPerRow:", v25);
      -[SXCollectionRowLayout setComponentsPerRow:](v56, "setComponentsPerRow:", v38);
      -[SXCollectionRowLayout setLeftMargin:](v56, "setLeftMargin:", v50);
      -[SXCollectionRowLayout setRightMargin:](v56, "setRightMargin:", v49);
      -[SXCollectionRowLayout setComponentWidth:](v56, "setComponentWidth:", v44);
      -[SXCollectionRowLayout setSpaceBetweenComponents:](v56, "setSpaceBetweenComponents:", floor(v52));
      objc_msgSend(v35, "addObject:", v56);

      if (!--v33)
        goto LABEL_70;
    }
    if (objc_msgSend(v9, "alignment") != 1)
    {
      if (objc_msgSend(v9, "alignment") == 2)
      {
        v50 = v54;
      }
      else if (!objc_msgSend(v9, "alignment"))
      {
        v49 = v54;
      }
      goto LABEL_59;
    }
LABEL_58:
    v50 = floor(v54 * 0.5);
    v49 = ceil(v54 * 0.5);
    goto LABEL_59;
  }
LABEL_70:
  if (v64 >= v65)
    v57 = v65;
  else
    v57 = v64;
  v58 = objc_alloc_init(SXCollectionLayout);
  -[SXCollectionLayout setSpaceBetweenRows:](v58, "setSpaceBetweenRows:", v57);
  -[SXCollectionLayout setRowsLayouts:](v58, "setRowsLayouts:", v35);

  return v58;
}

@end
