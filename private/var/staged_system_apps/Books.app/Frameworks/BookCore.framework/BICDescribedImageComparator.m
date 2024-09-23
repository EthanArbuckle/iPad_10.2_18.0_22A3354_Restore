@implementation BICDescribedImageComparator

- (CGSize)_aspectMatchingSizeFrom:(id)a3 withCandidate:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  double height;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "imageSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "imageSize");
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v6, "unknownAspectRatio");

  if (v15 && (objc_msgSend(v5, "unknownAspectRatio") & 1) == 0)
  {
    height = CGSizeZero.height;
    if ((v8 != CGSizeZero.width || v10 != height) && (v12 != CGSizeZero.width || v14 != height))
    {
      v19 = v12 / v14;
      if (v8 / v10 >= v12 / v14)
      {
        if (v8 / v10 > v12 / v14)
          v8 = round(v10 * v19);
      }
      else
      {
        v10 = round(v8 / v19);
      }
    }
  }

  v20 = v8;
  v21 = v10;
  result.height = v21;
  result.width = v20;
  return result;
}

- (BOOL)isMatching:(id)a3 withGenericImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "quality") == 1
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier")),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        !v10)
    || (v11 = objc_msgSend(v6, "processingOptions"),
        ((objc_msgSend(v7, "processingOptions") ^ v11) & 0xFFFFFDFF) != 0)
    || !objc_msgSend(v7, "isGeneric"))
  {
    v18 = 0;
  }
  else
  {
    -[BICDescribedImageComparator _aspectMatchingSizeFrom:withCandidate:](self, "_aspectMatchingSizeFrom:withCandidate:", v6, v7);
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "imageSize");
    v18 = v15 == v17 && v13 == v16;
    if ((objc_msgSend(v6, "requestOptions") & 0x30) != 0)
      v18 = 1;
  }

  return v18;
}

- (BOOL)isTransformableMatch:(id)a3 withCandidateImage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  BOOL v19;
  unsigned int v20;
  BOOL v22;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "quality") == 1
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        !v9))
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v5, "imageSize");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v6, "imageSize");
    v15 = v14;
    v17 = v16;
    if (objc_msgSend(v6, "processingOptions"))
      v18 = 0;
    else
      v18 = objc_msgSend(v6, "quality") - 200 < 0xFFFFFF9C;
    v20 = objc_msgSend(v6, "processingOptions");
    v22 = v11 == v15 && v20 == 512;
    if (v13 != v17)
      v22 = 0;
    v19 = v18 || v22;
  }

  return v19;
}

- (BOOL)isMatching:(id)a3 withCandidateImage:(id)a4 includeQuality:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "quality") != 1
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier")),
        v12 = objc_msgSend(v10, "isEqualToString:", v11),
        v11,
        v10,
        v12)
    && (v13 = objc_msgSend(v8, "processingOptions"),
        v13 == objc_msgSend(v9, "processingOptions"))
    && (!v5 || (v14 = objc_msgSend(v8, "quality"), v14 == objc_msgSend(v9, "quality"))))
  {
    -[BICDescribedImageComparator _aspectMatchingSizeFrom:withCandidate:](self, "_aspectMatchingSizeFrom:withCandidate:", v8, v9);
    v16 = v15;
    v18 = v17;
    objc_msgSend(v9, "imageSize");
    v21 = v18 == v20 && v16 == v19;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)differenceFromRequest:(id)a3 toCandidateImage:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unsigned int v21;
  unsigned int v22;
  unsigned __int8 v23;
  unsigned int v24;
  _BOOL4 v25;
  int v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "quality");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  v12 = -1;
  if (!v11 || v8 == 1)
    goto LABEL_25;
  -[BICDescribedImageComparator _aspectMatchingSizeFrom:withCandidate:](self, "_aspectMatchingSizeFrom:withCandidate:", v6, v7);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "imageSize");
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v7, "processingOptions");
  v22 = objc_msgSend(v6, "processingOptions");
  v23 = objc_msgSend(v6, "requestOptions");
  v24 = objc_msgSend(v7, "quality");
  v25 = v14 == v18;
  if (v16 != v20)
    v25 = 0;
  v26 = (v23 & 0x30) != 0 || v25;
  if (v26 == 1 && v22 == v21)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if ((v21 & 0x200) != 0)
  {
    if (!v26 || (v12 = 0x2000000, (v21 & 0xFFFFFDFF) != 0) && (v21 & 0xFFFFFDFF) != v22)
    {
      v12 = -1;
      goto LABEL_25;
    }
    goto LABEL_11;
  }
  v12 = -1;
  if (((v21 >> 5) & 1) == (v22 & 0x20) >> 5 && !v21 && v24 - 100 >= 0x64 && (v22 & 0x20) == 0)
  {
    if (v25)
    {
      v27 = 0;
    }
    else
    {
      v29 = (uint64_t)(v18 * v20);
      if (v29)
      {
        v30 = (uint64_t)(v14 * v16);
        v31 = v29 < v30;
        v27 = v29 - v30;
        if (v31)
          v27 = 0x1000000 - v27;
      }
      else
      {
        v27 = 33554433;
      }
    }
    v12 = v22 ? v27 + 0x1000000 : v27;
    if (v12 != -1)
    {
LABEL_11:
      if (objc_msgSend(v7, "isExpired"))
        v12 = -1;
    }
  }
LABEL_25:

  return v12;
}

- (unint64_t)fullDifferenceFromRequest:(id)a3 toCandidateImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  BOOL v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  unint64_t v41;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10 || (objc_msgSend(v7, "isExpired") & 1) != 0)
    goto LABEL_3;
  -[BICDescribedImageComparator _aspectMatchingSizeFrom:withCandidate:](self, "_aspectMatchingSizeFrom:withCandidate:", v6, v7);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "imageSize");
  v18 = v17;
  v20 = v19;
  v21 = v16 == v19 && v14 == v17;
  v22 = objc_msgSend(v7, "processingOptions");
  v23 = objc_msgSend(v6, "processingOptions");
  v24 = v23;
  v25 = v23 != v22 && (v23 & 0x20) == 0;
  if (v23)
    v26 = 0;
  else
    v26 = v22 == 0;
  if (v23)
    v27 = v23 == v22;
  else
    v27 = 0;
  v28 = v22 & 0xFDFF;
  v29 = (v22 & 0xFDFF) == 0 && v21;
  if (!v22)
    v29 = 1;
  v30 = v25 & v29;
  v31 = objc_msgSend(v6, "quality");
  v32 = objc_msgSend(v7, "quality");
  if (v31)
    v33 = v31 == v32;
  else
    v33 = 1;
  v34 = v33;
  if (v21)
  {
    v35 = 0;
  }
  else
  {
    v36 = (uint64_t)(v18 * v20);
    v37 = (uint64_t)(v14 * v16);
    if (v36)
    {
      v38 = v36 - v37;
      if (v36 < v37)
        v38 = 0x1000000 - (v36 - v37);
      if (v36 == v37)
        v35 = 0;
      else
        v35 = v38;
    }
    else
    {
      v35 = (unint64_t)(float)((float)((float)v37 * 0.9) + 16777000.0);
    }
  }
  if ((v26 | v30) == 1)
  {
    if (v32 == 1)
      v39 = 1;
    else
      v39 = v30;
    if (v21 && (v32 - 100) >= 0x64 && (v39 & 1) == 0)
    {
      if (v34)
        v11 = 0;
      else
        v11 = 208 - v32;
      goto LABEL_4;
    }
    if ((v24 & 0x20) == 0)
    {
      switch(v32)
      {
        case 'd':
LABEL_69:
          v40 = 637534208;
          break;
        case 'e':
          v40 = 503316480;
          break;
        case 'f':
          v40 = 469762048;
          break;
        case 'g':
          v40 = 402653184;
          break;
        case 'h':
          v40 = 335544320;
          break;
        case 'i':
          v40 = 0x8000000;
          break;
        case 'j':
          v40 = 0x10000000;
          break;
        case 'k':
          v40 = 201326592;
          break;
        case 'l':
          v40 = 0x4000000;
          break;
        default:
          switch(v32)
          {
            case 200:
            case 208:
              goto LABEL_69;
            case 201:
              v40 = 436207616;
              break;
            case 202:
              v40 = 369098752;
              break;
            case 203:
              v40 = 301989888;
              break;
            case 204:
              v40 = 234881024;
              break;
            case 205:
              v40 = 167772160;
              break;
            case 206:
              v40 = 100663296;
              break;
            case 207:
              v40 = 0x2000000;
              break;
            default:
              switch(v32)
              {
                case 0:
                  v40 = 0x20000000;
                  break;
                case 1:
                  goto LABEL_69;
                case 2:
                  v40 = 603979776;
                  break;
                case 3:
                  v40 = 570425344;
                  break;
                default:
                  v40 = 0;
                  break;
              }
              break;
          }
          break;
      }
      v41 = v40 + v35;
      if (v32 == 1)
        v11 = -1;
      else
        v11 = v41;
      goto LABEL_4;
    }
LABEL_3:
    v11 = -1;
    goto LABEL_4;
  }
  if (!v27)
  {
    if (v28 == v24 && v21)
      v11 = -2;
    else
      v11 = -1;
    goto LABEL_4;
  }
  if (!v21)
    goto LABEL_3;
  v11 = 0;
  if (v32 > 99)
  {
    switch(v32)
    {
      case 'd':
        goto LABEL_3;
      case 'e':
        v11 = 8;
        break;
      case 'f':
LABEL_74:
        v11 = 7;
        break;
      case 'g':
LABEL_75:
        v11 = 6;
        break;
      case 'h':
LABEL_76:
        v11 = 5;
        break;
      case 'i':
LABEL_77:
        v11 = 2;
        break;
      case 'j':
LABEL_78:
        v11 = 4;
        break;
      case 'k':
LABEL_96:
        v11 = 3;
        break;
      case 'l':
LABEL_79:
        v11 = 1;
        break;
      default:
        switch(v32)
        {
          case 200:
          case 208:
            goto LABEL_3;
          case 201:
            goto LABEL_74;
          case 202:
            goto LABEL_75;
          case 203:
            goto LABEL_76;
          case 204:
            goto LABEL_78;
          case 205:
            goto LABEL_96;
          case 206:
            goto LABEL_77;
          case 207:
            goto LABEL_79;
          default:
            goto LABEL_4;
        }
    }
  }
  else
  {
    if (v32 < 2)
      goto LABEL_3;
    if (v32 == 2)
    {
      v11 = 10;
    }
    else if (v32 == 3)
    {
      v11 = 9;
    }
  }
LABEL_4:

  return v11;
}

- (id)sortedBestMatchOf:(id)a3 toCandidateImages:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  _BOOL4 v17;
  unsigned int v18;
  _BOOL4 v19;
  BICDescribedImageWithScore *v20;
  void *v21;
  void *v23;
  id obj;
  unsigned __int8 v25;
  unsigned int v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v28 = objc_msgSend(v6, "requestOptions");
  v27 = objc_msgSend(v6, "requestOptions");
  if ((v27 & 0x10) != 0)
    v8 = 1;
  else
    v8 = (objc_msgSend(v6, "requestOptions") >> 6) & 1;
  v26 = v8;
  v25 = objc_msgSend(v6, "requestOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v14 = -[BICDescribedImageComparator fullDifferenceFromRequest:toCandidateImage:](self, "fullDifferenceFromRequest:toCandidateImage:", v6, v13);
        if (v14 != -1)
        {
          v15 = v14;
          if ((v25 & 0x80) != 0)
          {
            if (objc_msgSend(v13, "quality") == 101 || objc_msgSend(v13, "quality") == 2)
              v16 = 1;
            else
              v16 = -[BICDescribedImageComparator isCandidate:smallerThan:](self, "isCandidate:smallerThan:", v13, v6);
          }
          else
          {
            v16 = 0;
          }
          if (v27 & 0x10 | v28 & 0x20)
            v17 = 0;
          else
            v17 = objc_msgSend(v13, "quality") == 3;
          if (v26)
            v18 = objc_msgSend(v13, "requiresNetwork");
          else
            v18 = 0;
          v19 = (v27 & 0x10) != 0 && objc_msgSend(v13, "location") > 2;
          if ((v28 & 0x20) != 0 || ((v17 | v16 | v18 | v19) & 1) == 0)
          {
            v20 = objc_alloc_init(BICDescribedImageWithScore);
            -[BICDescribedImageWithScore setScore:](v20, "setScore:", v15);
            -[BICDescribedImageWithScore setImage:](v20, "setImage:", v13);
            objc_msgSend(v13, "setMatchScore:", -[BICDescribedImageWithScore score](v20, "score"));
            objc_msgSend(v23, "addObject:", v20);

          }
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

  objc_msgSend(v23, "sortUsingSelector:", "compare:");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CFSTR("image")));

  return v21;
}

- (BOOL)isCandidate:(id)a3 smallerThan:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = a4;
  objc_msgSend(a3, "imageSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "imageSize");
  v11 = v10;
  v13 = v12;

  if (CGSizeZero.width == v7 && CGSizeZero.height == v9)
    return 0;
  if (v9 < v13)
    return 1;
  return v7 < v11;
}

@end
