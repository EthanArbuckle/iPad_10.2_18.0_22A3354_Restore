@implementation CRRegionGroupGeometryInfo

- (id)initFromRegionGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
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
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  char v73;
  double v74;
  double v75;
  double v76;
  double v77;
  BOOL v79;
  unint64_t v81;
  unint64_t v82;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  double v88;
  double v89;
  char v90;
  _BOOL4 v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  unsigned __int8 isKindOfClass;
  objc_super v103;

  v4 = a3;
  objc_msgSend(v4, "subregions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "subregions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutDirection");

  }
  else
  {
    v8 = 0;
  }

  v103.receiver = self;
  v103.super_class = (Class)CRRegionGroupGeometryInfo;
  v9 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:](&v103, sel_initFromRegion_layoutDirection_, v4, v8);
  if (!v9)
    goto LABEL_83;
  objc_msgSend(v4, "subregions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRRegionGroupGeometryInfo _geometryInfoForRegion:](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_9:
    isKindOfClass = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
LABEL_10:
  v13 = v9 + 16;
  objc_storeStrong(v9 + 16, v12);
  v14 = objc_msgSend(v10, "count");
  if (v14 == 1)
  {
    v15 = *v13;
  }
  else
  {
    objc_msgSend(v10, "lastObject");
    v13 = (void **)objc_claimAutoreleasedReturnValue();
    -[CRRegionGroupGeometryInfo _geometryInfoForRegion:](v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong(v9 + 17, v15);
  if (v14 != 1)
  {

  }
  *((_BYTE *)v9 + 121) = 0;
  *((_BYTE *)v9 + 120) = 0;
  *((_BYTE *)v9 + 122) = 0;
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v84 = v12;
    v86 = v4;
    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      v16 = 0;
      v90 = 0;
      v88 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v89 = *MEMORY[0x1E0C9D820];
      v17 = *MEMORY[0x1E0C9D820] > 0.0;
      if (v88 <= 0.0)
        v17 = 0;
      v91 = v17;
      v18 = 0.0;
      while (1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v16, v84, v86);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "boundingQuad");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "denormalizedQuad");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectAtIndexedSubscript:", v16 + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "boundingQuad");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "denormalizedQuad");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRRegionGroupGeometryInfo _geometryInfoForRegion:](v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectAtIndexedSubscript:", v16 + 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRRegionGroupGeometryInfo _geometryInfoForRegion:](v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if ((isKindOfClass & (v26 != 0)) != 0)
        {
          objc_msgSend(v26, "firstSubregion");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "size");
          v31 = v30;

        }
        else
        {
          objc_msgSend(v21, "size");
          v31 = v32;
        }
        v92 = v18;
        if ((isKindOfClass & (v28 != 0)) != 0)
        {
          objc_msgSend(v28, "firstSubregion");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "size");
          v101 = v34;

        }
        else
        {
          objc_msgSend(v24, "size");
          v101 = v35;
        }
        objc_msgSend(v24, "topLeft");
        v100 = v36;
        objc_msgSend(v21, "topLeft");
        v99 = v37;
        objc_msgSend(v24, "topLeft");
        v98 = v38;
        objc_msgSend(v21, "topLeft");
        v97 = v39;
        objc_msgSend(v24, "topRight");
        v96 = v40;
        objc_msgSend(v21, "topRight");
        v95 = v41;
        objc_msgSend(v24, "topRight");
        v94 = v42;
        objc_msgSend(v21, "topRight");
        v44 = v43;
        objc_msgSend(v21, "bottomRight");
        v46 = v45;
        objc_msgSend(v21, "bottomLeft");
        v48 = v47;
        objc_msgSend(v21, "bottomRight");
        v50 = v49;
        objc_msgSend(v21, "bottomLeft");
        v52 = v51;
        objc_msgSend(v21, "midPoint");
        v54 = v53;
        v56 = v55;
        objc_msgSend(v24, "midPoint");
        if (v91)
        {
          v54 = v89 * v54;
          v56 = v88 * v56;
          v57 = v89 * v57;
          v58 = v88 * v58;
        }
        v93 = v31;
        v59 = (v31 + v101) * 0.5;
        v60 = v94 - v44;
        v61 = sqrt((v50 - v52) * (v50 - v52) + (v46 - v48) * (v46 - v48));
        v62 = ((v98 - v97) * (v50 - v52) + (v100 - v99) * (v46 - v48)) / v61;
        v63 = -(v60 * (v50 - v52) + (v96 - v95) * (v46 - v48)) / v61;
        v64 = sqrt((v56 - v58) * (v56 - v58) + (v54 - v57) * (v54 - v57));
        objc_msgSend(v21, "size");
        v66 = v65;
        objc_msgSend(v24, "size");
        v68 = vabdd_f64(v66, v67);
        v69 = v68 / v59;
        v70 = fmin((v64 + v64) / v59, 1.4);
        if (v64 < v59 * 1.4)
          break;
        v71 = 0.5;
        if ((vabdd_f64(v62, v63) - v68 * 0.5) * 0.5 < v59 * 0.5 && v69 > v70)
          goto LABEL_39;
        if (*((_BYTE *)v9 + 120) && v69 > v70)
        {
          v73 = 0;
          v90 = 1;
          v75 = v92;
          v74 = v93;
          goto LABEL_75;
        }
LABEL_43:
        v74 = v93;
        v76 = fabs(v62) / v93;
        v77 = fabs(v63) / v93;
        if (v76 < v71 && v77 >= v71)
        {
          if (*((_BYTE *)v9 + 121) && *((_BYTE *)v9 + 122))
          {
            *((_BYTE *)v9 + 122) = 0;
          }
          else if (*((_BYTE *)v9 + 120) && v69 <= v70 || *((_BYTE *)v9 + 122))
          {
            v73 = 0;
            v90 = 1;
            v75 = v92;
            goto LABEL_75;
          }
          if (!v16)
            *((_BYTE *)v9 + 121) = 1;
        }
        v79 = v76 >= v71 && v77 < v71;
        v75 = v92;
        if (!v79)
          goto LABEL_60;
        if (*((_BYTE *)v9 + 121))
        {
          if (!*((_BYTE *)v9 + 122))
            goto LABEL_72;
          *((_BYTE *)v9 + 121) = 0;
        }
        else if (*((_BYTE *)v9 + 120) && v69 <= v70)
        {
LABEL_72:
          v73 = 0;
          v90 = 1;
          goto LABEL_75;
        }
        if (!v16)
        {
          *((_BYTE *)v9 + 122) = 1;
LABEL_60:
          v73 = 1;
          if (!v16 && v76 < v71 && v77 < v71)
          {
            *((_BYTE *)v9 + 121) = 1;
            *((_BYTE *)v9 + 122) = 1;
          }
          goto LABEL_75;
        }
        v73 = 1;
LABEL_75:
        v18 = v75 + v74;

        if ((v73 & 1) != 0)
        {
          v81 = objc_msgSend(v10, "count");
          v82 = v16 + 2;
          ++v16;
          if (v82 < v81)
            continue;
        }
        goto LABEL_80;
      }
      v71 = 0.5;
      if (v69 <= v70)
        goto LABEL_43;
LABEL_39:
      if (!v16 || *((_BYTE *)v9 + 121) && *((_BYTE *)v9 + 122))
      {
        *((_BYTE *)v9 + 120) = 1;
        *((_BYTE *)v9 + 121) = 0;
        *((_BYTE *)v9 + 122) = 0;
      }
      goto LABEL_43;
    }
    v90 = 0;
    v18 = 0.0;
LABEL_80:
    objc_msgSend(v9, "setEstimatedLineHeight:", v18 / (double)(unint64_t)(objc_msgSend(v10, "count", v84, v86) - 1));
    v12 = v85;
    v4 = v87;
    if ((v90 & 1) != 0)
    {
      *((_BYTE *)v9 + 121) = 0;
      *((_BYTE *)v9 + 120) = 0;
      *((_BYTE *)v9 + 122) = 0;
    }
  }

LABEL_83:
  return v9;
}

- (id)_geometryInfoForRegion:(void *)a1
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "geometryInfo");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v1, objc_msgSend(v1, "layoutDirection"));
  }
  v3 = v2;

  return v3;
}

- (CRRegionGeometryInfo)firstSubregion
{
  return (CRRegionGeometryInfo *)objc_getProperty(self, a2, 128, 1);
}

- (CRRegionGeometryInfo)lastSubregion
{
  return (CRRegionGeometryInfo *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)isCenterJustified
{
  return self->_isCenterJustified;
}

- (BOOL)isLeftJustified
{
  return self->_isLeftJustified;
}

- (BOOL)isRightJustified
{
  return self->_isRightJustified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSubregion, 0);
  objc_storeStrong((id *)&self->_firstSubregion, 0);
}

@end
