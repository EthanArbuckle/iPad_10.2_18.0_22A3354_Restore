id CoalescedRectsForArray(void *a1, int a2, char a3, double a4)
{
  void *v6;
  id v7;
  double x;
  double y;
  double width;
  double height;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double MinX;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxY;
  double MinY;
  double v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double MaxX;
  id v68;
  void *v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  void *v84;
  id obj;
  void *v86;
  double rect;
  double recta;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;

  v80 = a1;
  if ((unint64_t)objc_msgSend(v80, "count") > 1)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v80, "count")));
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v12 = v80;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
    if (!v13)
      goto LABEL_27;
    v14 = *(_QWORD *)v103;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v103 != v14)
          objc_enumerationMutation(v12);
        v16 = sub_4734(*(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)v15));
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v110.origin.x = x;
        v110.origin.y = y;
        v110.size.width = width;
        v110.size.height = height;
        if (CGRectIsNull(v110))
          goto LABEL_22;
        rect = y;
        if (a2)
        {
          v23 = x;
          v111.origin.x = x;
          v111.origin.y = rect;
          v111.size.width = width;
          v111.size.height = height;
          MinX = CGRectGetMinX(v111);
          v112.origin.x = v16;
          v112.origin.y = v18;
          v112.size.width = v20;
          v112.size.height = v22;
          if (MinX - CGRectGetMinX(v112) >= 0.0)
          {
            v119.origin.x = v23;
            v119.origin.y = rect;
            v119.size.width = width;
            v119.size.height = height;
            v30 = CGRectGetMinX(v119);
            v120.origin.x = v16;
            v120.origin.y = v18;
            v120.size.width = v20;
            v120.size.height = v22;
            v26 = v30 - CGRectGetMinX(v120);
          }
          else
          {
            v113.origin.x = v23;
            v113.origin.y = rect;
            v113.size.width = width;
            v113.size.height = height;
            v25 = CGRectGetMinX(v113);
            v114.origin.x = v16;
            v114.origin.y = v18;
            v114.size.width = v20;
            v114.size.height = v22;
            v26 = -(v25 - CGRectGetMinX(v114));
          }
          v121.origin.x = v16;
          v121.origin.y = v18;
          v121.size.width = v20;
          v121.size.height = v22;
          if (v26 > CGRectGetWidth(v121) * 0.5)
            goto LABEL_21;
          v122.origin.x = v23;
          v122.origin.y = rect;
          v122.size.width = width;
          v122.size.height = height;
          MaxY = CGRectGetMaxY(v122);
          v123.origin.x = v16;
          v123.origin.y = v18;
          v123.size.width = v20;
          v123.size.height = v22;
          MinY = CGRectGetMinY(v123);
        }
        else
        {
          v23 = x;
          v115.origin.x = x;
          v115.origin.y = rect;
          v115.size.width = width;
          v115.size.height = height;
          v27 = CGRectGetMinY(v115);
          v116.origin.x = v16;
          v116.origin.y = v18;
          v116.size.width = v20;
          v116.size.height = v22;
          if (v27 - CGRectGetMinY(v116) >= 0.0)
          {
            v124.origin.x = v23;
            v124.origin.y = rect;
            v124.size.width = width;
            v124.size.height = height;
            v33 = CGRectGetMinY(v124);
            v125.origin.x = v16;
            v125.origin.y = v18;
            v125.size.width = v20;
            v125.size.height = v22;
            v29 = v33 - CGRectGetMinY(v125);
          }
          else
          {
            v117.origin.x = v23;
            v117.origin.y = rect;
            v117.size.width = width;
            v117.size.height = height;
            v28 = CGRectGetMinY(v117);
            v118.origin.x = v16;
            v118.origin.y = v18;
            v118.size.width = v20;
            v118.size.height = v22;
            v29 = -(v28 - CGRectGetMinY(v118));
          }
          v126.origin.x = v16;
          v126.origin.y = v18;
          v126.size.width = v20;
          v126.size.height = v22;
          if (v29 > CGRectGetHeight(v126) * 0.5)
          {
LABEL_21:
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v23, rect, width, height));
            objc_msgSend(v84, "addObject:", v34);

LABEL_22:
            x = v16;
            y = v18;
            width = v20;
            height = v22;
            goto LABEL_23;
          }
          v127.origin.x = v23;
          v127.origin.y = rect;
          v127.size.width = width;
          v127.size.height = height;
          MaxY = CGRectGetMaxX(v127);
          v128.origin.x = v16;
          v128.origin.y = v18;
          v128.size.width = v20;
          v128.size.height = v22;
          MinY = CGRectGetMinX(v128);
        }
        if (MaxY < MinY)
          goto LABEL_21;
        v129.origin.x = v23;
        v129.origin.y = rect;
        v129.size.width = width;
        v129.size.height = height;
        v137.origin.x = v16;
        v137.origin.y = v18;
        v137.size.width = v20;
        v137.size.height = v22;
        v130 = CGRectUnion(v129, v137);
        x = v130.origin.x;
        y = v130.origin.y;
        width = v130.size.width;
        height = v130.size.height;
LABEL_23:
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v35 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
      v13 = v35;
      if (!v35)
      {
LABEL_27:

        v131.origin.x = x;
        v131.origin.y = y;
        v131.size.width = width;
        v131.size.height = height;
        if (!CGRectIsNull(v131))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
          objc_msgSend(v84, "addObject:", v36);

        }
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        obj = v84;
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
        if (v37)
        {
          v38 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v99 != v38)
                objc_enumerationMutation(obj);
              v40 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v40, "CGRectValue");
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKey:", v41));
              if (!v42)
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                objc_msgSend(v86, "setObject:forKey:", v42, v41);
              }
              objc_msgSend(v42, "addObject:", v40);

            }
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
          }
          while (v37);
        }

        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v81 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "allValues"));
        v43 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
        if (!v43)
        {
LABEL_65:

          v6 = v80;
          goto LABEL_66;
        }
        v82 = *(_QWORD *)v95;
LABEL_40:
        v83 = v43;
        v44 = 0;
        while (1)
        {
          if (*(_QWORD *)v95 != v82)
            objc_enumerationMutation(v81);
          v45 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v44);
          v46 = CGRectZero.origin.x;
          v47 = CGRectZero.origin.y;
          v48 = CGRectZero.size.width;
          v49 = CGRectZero.size.height;
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v50 = v45;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
          if (v51)
            break;
LABEL_61:

          v136.origin.x = v46;
          v136.origin.y = v47;
          v136.size.width = v48;
          v136.size.height = v49;
          if (!CGRectIsEmpty(v136))
          {
            v77 = sub_483C(v46, v47, v48, v49);
            v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
            objc_msgSend(v7, "addObject:", v78);

          }
          if ((id)++v44 == v83)
          {
            v43 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
            if (!v43)
              goto LABEL_65;
            goto LABEL_40;
          }
        }
        v52 = *(_QWORD *)v91;
        while (2)
        {
          v53 = 0;
LABEL_46:
          if (*(_QWORD *)v91 != v52)
            objc_enumerationMutation(v50);
          v54 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v53);
          v132.origin.x = v46;
          v132.origin.y = v47;
          v132.size.width = v48;
          v132.size.height = v49;
          if (CGRectIsEmpty(v132))
          {
            objc_msgSend(v54, "CGRectValue");
            goto LABEL_56;
          }
          objc_msgSend(v54, "CGRectValue");
          v63 = v59;
          v64 = v60;
          v65 = v61;
          v66 = v62;
          if (a4 == 0.0)
            goto LABEL_55;
          if ((a3 & 1) != 0)
          {
            recta = CGRectGetMinY(*(CGRect *)&v59);
            v133.origin.x = v46;
            v133.origin.y = v47;
            v133.size.width = v48;
            v133.size.height = v49;
            MaxX = CGRectGetMaxY(v133);
          }
          else
          {
            recta = CGRectGetMinX(*(CGRect *)&v59);
            v134.origin.x = v46;
            v134.origin.y = v47;
            v134.size.width = v48;
            v134.size.height = v49;
            MaxX = CGRectGetMaxX(v134);
          }
          if (recta - MaxX < a4)
          {
LABEL_55:
            v135.origin.x = v46;
            v135.origin.y = v47;
            v135.size.width = v48;
            v135.size.height = v49;
            v138.origin.x = v63;
            v138.origin.y = v64;
            v138.size.width = v65;
            v138.size.height = v66;
            *(CGRect *)&v55 = CGRectUnion(v135, v138);
LABEL_56:
            v46 = v55;
            v47 = v56;
            v48 = v57;
            v49 = v58;
          }
          else
          {
            v68 = sub_483C(v46, v47, v48, v49);
            v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
            objc_msgSend(v7, "addObject:", v69);

            objc_msgSend(v54, "CGRectValue");
            v74 = sub_483C(v70, v71, v72, v73);
            v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
            objc_msgSend(v7, "addObject:", v75);

            v46 = CGRectZero.origin.x;
            v47 = CGRectZero.origin.y;
            v48 = CGRectZero.size.width;
            v49 = CGRectZero.size.height;
          }
          if (v51 == (id)++v53)
          {
            v76 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
            v51 = v76;
            if (!v76)
              goto LABEL_61;
            continue;
          }
          goto LABEL_46;
        }
      }
    }
  }
  v6 = v80;
  v7 = v80;
LABEL_66:

  return v7;
}

void sub_4610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

double sub_4734(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("top")));
  objc_msgSend(v2, "doubleValue");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("left")));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("width")));
  objc_msgSend(v6, "doubleValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("height")));
  objc_msgSend(v7, "doubleValue");

  return v5;
}

void sub_4804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

id sub_483C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v8;
  NSNumber *v9;
  void *v10;
  NSNumber *v11;
  void *v12;
  NSNumber *v13;
  void *v14;
  NSNumber *v15;
  void *v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetMinY(v18));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("top"));

  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetMinX(v19));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("left"));

  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetWidth(v20));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("width"));

  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetHeight(v21));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("height"));

  return v8;
}

void sub_4994(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

id RectsFilteredOfDuplicates(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  CGFloat *v22;
  char *v23;
  __int128 v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  CGFloat *v47;
  char *v48;
  __int128 v49;
  char *v50;
  char *v51;
  CGFloat *v52;
  CGFloat *v53;
  id v54;
  void *v55;
  id v57;
  char *__p;
  char *v59;
  char *v60;
  char *v61;
  void *v62;
  _BYTE *v63;
  void *v64;
  CGFloat *v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v3 = a1;
  v57 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    sub_4F14(v3, &v64);
    sub_4F14(v57, &v62);
    __p = 0;
    v59 = 0;
    v61 = 0;
    if (v65 == v64)
    {
      v27 = 0;
      v26 = 0;
    }
    else
    {
      v5 = 0;
      if ((unint64_t)(((char *)v65 - (_BYTE *)v64) >> 5) <= 1)
        v6 = 1;
      else
        v6 = ((char *)v65 - (_BYTE *)v64) >> 5;
      do
      {
        v7 = (double *)((char *)v64 + 32 * v5);
        x = *v7;
        y = v7[1];
        width = v7[2];
        height = v7[3];
        if (v63 != v62)
        {
          v12 = 0;
          if ((unint64_t)((v63 - (_BYTE *)v62) >> 5) <= 1)
            v13 = 1;
          else
            v13 = (v63 - (_BYTE *)v62) >> 5;
          do
          {
            v70.origin.x = x;
            v70.origin.y = y;
            v70.size.width = width;
            v70.size.height = height;
            v66 = CGRectIntersection(*(CGRect *)((char *)v62 + v12), v70);
            v71.origin.x = x;
            v71.origin.y = y;
            v71.size.width = width;
            v71.size.height = height;
            if (CGRectEqualToRect(v66, v71))
            {
              x = CGRectNull.origin.x;
              y = CGRectNull.origin.y;
              width = CGRectNull.size.width;
              height = CGRectNull.size.height;
            }
            v12 += 32;
            --v13;
          }
          while (v13);
        }
        v67.origin.x = x;
        v67.origin.y = y;
        v67.size.width = width;
        v67.size.height = height;
        if (!CGRectIsNull(v67))
        {
          v14 = v59;
          if (v59 >= v61)
          {
            v16 = __p;
            v17 = (v59 - __p) >> 5;
            v18 = v17 + 1;
            if ((unint64_t)(v17 + 1) >> 59)
              sub_5168();
            v19 = v61 - __p;
            if ((v61 - __p) >> 4 > v18)
              v18 = v19 >> 4;
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0)
              v20 = 0x7FFFFFFFFFFFFFFLL;
            else
              v20 = v18;
            if (v20)
            {
              v21 = (char *)sub_51F0((uint64_t)&v61, v20);
              v16 = __p;
              v14 = v59;
            }
            else
            {
              v21 = 0;
            }
            v22 = (CGFloat *)&v21[32 * v17];
            *v22 = x;
            v22[1] = y;
            v22[2] = width;
            v22[3] = height;
            if (v14 == v16)
            {
              v25 = &v21[32 * v17];
            }
            else
            {
              v23 = &v21[32 * v17];
              do
              {
                v24 = *((_OWORD *)v14 - 1);
                v25 = v23 - 32;
                *((_OWORD *)v23 - 2) = *((_OWORD *)v14 - 2);
                *((_OWORD *)v23 - 1) = v24;
                v14 -= 32;
                v23 -= 32;
              }
              while (v14 != v16);
            }
            v15 = (char *)(v22 + 4);
            __p = v25;
            v61 = &v21[32 * v20];
            if (v16)
              operator delete(v16);
          }
          else
          {
            *(CGFloat *)v59 = x;
            *((CGFloat *)v59 + 1) = y;
            v15 = v59 + 32;
            *((CGFloat *)v59 + 2) = width;
            *((CGFloat *)v59 + 3) = height;
          }
          v59 = v15;
        }
        ++v5;
      }
      while (v5 != v6);
      v26 = __p;
      v27 = (uint64_t)v59;
    }
    sub_524C((char *)&v64, v26, v27, (v27 - (uint64_t)v26) >> 5);
    do
    {
      v28 = (uint64_t)__p;
      v60 = __p;
      v29 = 0;
      if (v65 == v64)
      {
        v51 = __p;
      }
      else
      {
        v30 = 0;
        if ((unint64_t)(((char *)v65 - (_BYTE *)v64) >> 5) <= 1)
          v31 = 1;
        else
          v31 = ((char *)v65 - (_BYTE *)v64) >> 5;
        do
        {
          v32 = (double *)((char *)v64 + 32 * v30);
          v34 = *v32;
          v33 = v32[1];
          v36 = v32[2];
          v35 = v32[3];
          if (v60 != __p)
          {
            v37 = 0;
            if ((unint64_t)((v60 - __p) >> 5) <= 1)
              v38 = 1;
            else
              v38 = (v60 - __p) >> 5;
            do
            {
              v72.origin.x = v34;
              v72.origin.y = v33;
              v72.size.width = v36;
              v72.size.height = v35;
              v68 = CGRectIntersection(*(CGRect *)&__p[v37], v72);
              v73.origin.x = v34;
              v73.origin.y = v33;
              v73.size.width = v36;
              v73.size.height = v35;
              if (CGRectEqualToRect(v68, v73))
              {
                v34 = CGRectNull.origin.x;
                v33 = CGRectNull.origin.y;
                v29 = 1;
                v36 = CGRectNull.size.width;
                v35 = CGRectNull.size.height;
              }
              v37 += 32;
              --v38;
            }
            while (v38);
          }
          v69.origin.x = v34;
          v69.origin.y = v33;
          v69.size.width = v36;
          v69.size.height = v35;
          if (!CGRectIsNull(v69))
          {
            v39 = v60;
            if (v60 >= v61)
            {
              v41 = __p;
              v42 = (v60 - __p) >> 5;
              v43 = v42 + 1;
              if ((unint64_t)(v42 + 1) >> 59)
                sub_5168();
              v44 = v61 - __p;
              if ((v61 - __p) >> 4 > v43)
                v43 = v44 >> 4;
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFE0)
                v45 = 0x7FFFFFFFFFFFFFFLL;
              else
                v45 = v43;
              if (v45)
              {
                v46 = (char *)sub_51F0((uint64_t)&v61, v45);
                v41 = __p;
                v39 = v60;
              }
              else
              {
                v46 = 0;
              }
              v47 = (CGFloat *)&v46[32 * v42];
              *v47 = v34;
              v47[1] = v33;
              v47[2] = v36;
              v47[3] = v35;
              if (v39 == v41)
              {
                v50 = &v46[32 * v42];
              }
              else
              {
                v48 = &v46[32 * v42];
                do
                {
                  v49 = *((_OWORD *)v39 - 1);
                  v50 = v48 - 32;
                  *((_OWORD *)v48 - 2) = *((_OWORD *)v39 - 2);
                  *((_OWORD *)v48 - 1) = v49;
                  v39 -= 32;
                  v48 -= 32;
                }
                while (v39 != v41);
              }
              v40 = (char *)(v47 + 4);
              __p = v50;
              v61 = &v46[32 * v45];
              if (v41)
                operator delete(v41);
            }
            else
            {
              *(CGFloat *)v60 = v34;
              *((CGFloat *)v60 + 1) = v33;
              v40 = v60 + 32;
              *((CGFloat *)v60 + 2) = v36;
              *((CGFloat *)v60 + 3) = v35;
            }
            v60 = v40;
          }
          ++v30;
        }
        while (v30 != v31);
        v51 = __p;
        v28 = (uint64_t)v60;
      }
      sub_524C((char *)&v64, v51, v28, (v28 - (uint64_t)v51) >> 5);
    }
    while ((v29 & 1) != 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v52 = (CGFloat *)v64;
    v53 = v65;
    while (v52 != v53)
    {
      v54 = sub_483C(*v52, v52[1], v52[2], v52[3]);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      objc_msgSend(v4, "addObject:", v55);

      v52 += 4;
    }
    if (__p)
      operator delete(__p);
    if (v62)
    {
      v63 = v62;
      operator delete(v62);
    }
    if (v64)
    {
      v65 = (CGFloat *)v64;
      operator delete(v64);
    }
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

void sub_4E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  void *v17;

  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);

  _Unwind_Resume(a1);
}

void sub_4F14(void *a1@<X0>, void **a2@<X8>)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  double *v18;
  _QWORD *v19;
  double *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  __int128 v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v4);
        v8 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v7);
        v9 = sub_4734(v8);
        v13 = v9;
        v14 = v10;
        v15 = v11;
        v16 = v12;
        v18 = (double *)a2[1];
        v17 = (double *)a2[2];
        if (v18 >= v17)
        {
          v20 = (double *)*a2;
          v21 = ((char *)v18 - (_BYTE *)*a2) >> 5;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 59)
            sub_5168();
          v23 = (char *)v17 - (char *)v20;
          if (v23 >> 4 > v22)
            v22 = v23 >> 4;
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFE0)
            v24 = 0x7FFFFFFFFFFFFFFLL;
          else
            v24 = v22;
          if (v24)
          {
            v25 = (char *)sub_51F0((uint64_t)(a2 + 2), v24);
            v20 = (double *)*a2;
            v18 = (double *)a2[1];
          }
          else
          {
            v25 = 0;
          }
          v26 = &v25[32 * v21];
          *(double *)v26 = v13;
          *((_QWORD *)v26 + 1) = v14;
          *((_QWORD *)v26 + 2) = v15;
          *((_QWORD *)v26 + 3) = v16;
          if (v18 == v20)
          {
            v29 = &v25[32 * v21];
          }
          else
          {
            v27 = &v25[32 * v21];
            do
            {
              v28 = *((_OWORD *)v18 - 1);
              v29 = v27 - 32;
              *((_OWORD *)v27 - 2) = *((_OWORD *)v18 - 2);
              *((_OWORD *)v27 - 1) = v28;
              v18 -= 4;
              v27 -= 32;
            }
            while (v18 != v20);
          }
          v19 = v26 + 32;
          *a2 = v29;
          a2[1] = v26 + 32;
          a2[2] = &v25[32 * v24];
          if (v20)
            operator delete(v20);
        }
        else
        {
          *v18 = v9;
          *((_QWORD *)v18 + 1) = v10;
          v19 = v18 + 4;
          *((_QWORD *)v18 + 2) = v11;
          *((_QWORD *)v18 + 3) = v12;
        }
        a2[1] = v19;

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v5);
  }

}

void sub_5124(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  void *v4;

  v4 = *(void **)v2;
  if (*(_QWORD *)v2)
  {
    *(_QWORD *)(v2 + 8) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_5168()
{
  sub_517C("vector");
}

void sub_517C(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_51CC(exception, a1);
}

void sub_51B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_51CC(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_51F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    sub_5224();
  return operator new(32 * a2);
}

void sub_5224()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

char *sub_524C(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 5)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 59)
      sub_5168();
    v10 = v8 >> 4;
    if (v8 >> 4 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
      v11 = 0x7FFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_5354(v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 5;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[32 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *sub_5354(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    sub_5168();
  result = (char *)sub_51F0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

BOOL sub_724C(id a1, UIAccessibilityCustomAction *a2)
{
  +[BEAXWebContentUtilities toggleBookmark](BEAXWebContentUtilities, "toggleBookmark");
  return 1;
}

BOOL sub_726C(id a1, UIAccessibilityCustomAction *a2)
{
  +[BEAXWebContentUtilities toggleControlsVisibility](BEAXWebContentUtilities, "toggleControlsVisibility");
  return 1;
}

uint64_t sub_728C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "accessibilityScroll:", *(_QWORD *)(a1 + 40));
  return 1;
}

uint64_t sub_72AC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "accessibilityScroll:", *(_QWORD *)(a1 + 40));
  return 1;
}

void sub_74AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id sub_74D4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  UIAccessibilityTraits v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  unint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessibilityElements"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    v12 = UIAccessibilityTraitHeader;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((v12 & (unint64_t)objc_msgSend(v14, "accessibilityTraits", (_QWORD)v24)) != 0)
          objc_msgSend(v7, "addObject:", v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxStoredHeadingsRotorIndex"));
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
      v17 = 0;
    else
      v17 = v16;
    if (objc_msgSend(v3, "searchDirection", (_QWORD)v24))
      v18 = (unint64_t)v17 + 1;
    else
      v18 = (unint64_t)v17 - 1;
    v19 = 0;
    if (v18 < (unint64_t)objc_msgSend(v7, "count"))
    {
      v19 = (char *)v18;
      if ((v18 & 0x8000000000000000) != 0)
        v19 = (char *)objc_msgSend(v7, "count") - 1;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19));
    objc_msgSend(WeakRetained, "baxSetStoredHeadingsRotorIndex:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v19));
    v22 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotorItemResult), "initWithTargetElement:targetRange:", v21, 0);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void sub_7810(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id sub_7838(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  _QWORD v38[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleAnnotations"));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxStoredHighlightRotorIndex"));
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = v8;
    if (objc_msgSend(v3, "searchDirection", v3))
      v10 = (unint64_t)v9 + 1;
    else
      v10 = (unint64_t)v9 - 1;
    v11 = 0;
    if (v10 < (unint64_t)objc_msgSend(v6, "count"))
    {
      v11 = (char *)v10;
      if ((v10 & 0x8000000000000000) != 0)
        v11 = (char *)objc_msgSend(v6, "count") - 1;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
    objc_msgSend(WeakRetained, "baxSetStoredHighlightRotorIndex:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("startPoint")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("endPoint")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v22, "doubleValue");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessibilityElements"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "referenceElement"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "textMarkerForPoint:", v18, v21));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "textMarkerForPoint:", v24, v27));
    v33 = (void *)v32;
    v34 = &__NSArray0__struct;
    if (v31 && v32)
    {
      v38[0] = v31;
      v38[1] = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
    }
    v35 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotorItemResult), "initWithTargetElement:targetRange:targetTextMarkerRange:", v30, 0, v34);

    v3 = v37;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

void sub_7CCC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id sub_7D08(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxStoredVisibleLinkInfos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_20700));
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxStoredLinkRotorIndex"));
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = v8;
    if (objc_msgSend(v3, "searchDirection"))
      v10 = (unint64_t)v9 + 1;
    else
      v10 = (unint64_t)v9 - 1;
    if ((v10 & 0x8000000000000000) != 0)
      v10 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") - 1;
    if (v10 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
      v10 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
    objc_msgSend(WeakRetained, "baxSetStoredLinkRotorIndex:", v11);

    v12 = objc_alloc_init((Class)UIAccessibilityCustomRotorItemResult);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v10));
    objc_msgSend(v12, "setTargetElement:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

int64_t sub_7E4C(id a1, UIAccessibilityLinkSubelement *a2, UIAccessibilityLinkSubelement *a3)
{
  UIAccessibilityLinkSubelement *v4;
  UIAccessibilityLinkSubelement *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  void *v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v7 = objc_msgSend(v6, "isTextHorizontal");

  -[UIAccessibilityLinkSubelement accessibilityFrame](v4, "accessibilityFrame");
  v9 = v8;
  v11 = v10;
  -[UIAccessibilityLinkSubelement accessibilityFrame](v5, "accessibilityFrame");
  if (v7)
  {
    if (v11 != v13)
    {
      -[UIAccessibilityLinkSubelement accessibilityFrame](v4, "accessibilityFrame");
      v15 = v14;
      -[UIAccessibilityLinkSubelement accessibilityFrame](v5, "accessibilityFrame");
      if (v15 >= v16)
        v17 = 1;
      else
        v17 = -1;
      goto LABEL_16;
    }
LABEL_7:
    v17 = 0;
    goto LABEL_16;
  }
  if (v9 == v12)
    goto LABEL_7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v19 = objc_msgSend(v18, "isRTL");

  -[UIAccessibilityLinkSubelement accessibilityFrame](v4, "accessibilityFrame");
  v21 = v20;
  -[UIAccessibilityLinkSubelement accessibilityFrame](v5, "accessibilityFrame");
  v23 = -1;
  if (v21 >= v22)
    v24 = 1;
  else
    v24 = -1;
  if (v21 < v22)
    v23 = 1;
  if (v19)
    v17 = v23;
  else
    v17 = v24;
LABEL_16:

  return v17;
}

void sub_9314(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_baxIsSettingSelectionTimer"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_baxIsSettingSelectionTimer"));
    objc_msgSend(v3, "invalidate");

  }
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &stru_20740, 1.0));
  objc_msgSend(*(id *)(a1 + 32), "_baxSetIsSettingSelectionTimer:", v4);

}

void sub_939C(id a1, NSTimer *a2)
{
  +[BEAXWebContentUtilities checkCanPerformActions](BEAXWebContentUtilities, "checkCanPerformActions");
}

void sub_A43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_A478(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "baxStoredLinkInfos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "visibleLinkElements:", v5));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxStoredLinkRotorIndex"));
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = v8;
    if (objc_msgSend(v3, "searchDirection"))
      v10 = (unint64_t)v9 + 1;
    else
      v10 = (unint64_t)v9 - 1;
    if ((v10 & 0x8000000000000000) != 0)
      v10 = (unint64_t)objc_msgSend(a1[5], "count") - 1;
    if (v10 >= (unint64_t)objc_msgSend(a1[5], "count"))
      v10 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
    objc_msgSend(WeakRetained, "baxSetStoredLinkRotorIndex:", v11);

    v12 = objc_alloc_init((Class)UIAccessibilityCustomRotorItemResult);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v10));
    objc_msgSend(v12, "setTargetElement:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_A6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_A6C8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BYTE *v33;
  void *v34;
  _BYTE *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  _BYTE *v42;
  int64_t v43;
  int64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleAnnotations"));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxStoredLinkRotorIndex"));
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = v8;
    if (objc_msgSend(v3, "searchDirection"))
      v10 = (unint64_t)v9 + 1;
    else
      v10 = (unint64_t)v9 - 1;
    v11 = 0;
    if (v10 < (unint64_t)objc_msgSend(v6, "count"))
    {
      v11 = (char *)v10;
      if ((v10 & 0x8000000000000000) != 0)
        v11 = (char *)objc_msgSend(v6, "count") - 1;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
    objc_msgSend(WeakRetained, "baxSetStoredLinkRotorIndex:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("startPoint")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("endPoint")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v16, "doubleValue");
    v18 = v17 + 1.0;
    v50 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v19, "doubleValue");
    v21 = v20 + 1.0;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v22, "doubleValue");
    v24 = v23 + -1.0;
    v49 = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v25, "doubleValue");
    v27 = v26 + -1.0;

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxBookContentElement"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "textMarkerForPoint:", v18, v21));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxBookContentElement"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "textMarkerForPoint:", v24, v27));

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxBookContentElement"));
    v33 = objc_msgSend(v32, "positionForTextMarker:", v29);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxBookContentElement"));
    v35 = objc_msgSend(v34, "positionForTextMarker:", v31);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxBookContentElement"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_stringFromStartMarker:toEndMarker:attributed:", v29, v31, 0));

    v51 = v13;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("text")));
    v52 = v3;
    if (v37)
    {
      v39 = objc_msgSend(v37, "rangeOfString:", v38);
      if (v39 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v35 = &v33[(_QWORD)v39 + v40];
        v33 = &v33[(_QWORD)v39];
      }
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxBookContentElement"));
    v42 = +[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:](BEAXWebContentUtilities, "visibleTextRangeInChapterForBookContentElement:", v41);

    v43 = v33 - v42;
    v44 = v35 - v33;
    v45 = objc_alloc((Class)UIAccessibilityCustomRotorItemResult);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baxBookContentElement"));
    v47 = objc_msgSend(v45, "initWithTargetElement:targetRange:", v46, 0);

    objc_msgSend(v47, "setTargetNSRange:", v43, v44);
    v3 = v52;
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

void sub_AF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_AF5C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_AF6C(uint64_t a1)
{

}

void sub_AF74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lineRectsForTextMarkerRange:", *(_QWORD *)(a1 + 40)));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "frameForTextMarkers:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRect:](NSValue, "valueWithRect:"));
    v9 = v5;
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

BOOL sub_B7FC(id a1, UIAccessibilityCustomAction *a2)
{
  +[BEAXWebContentUtilities toggleBookmark](BEAXWebContentUtilities, "toggleBookmark");
  return 1;
}

void sub_BB20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "_baxIsTurning") & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = UIAccessibilityPageScrolledNotification;
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_axPageScrollString"));
    objc_msgSend(v2, "accessibilityOverrideProcessNotification:notificationData:", v3, v4);

  }
}

uint64_t sub_C3E8(uint64_t a1, int a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void (*v15)(void);
  int v16;
  _QWORD v17[2];

  v4 = _BookEPUBWebProcessPluginLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v16 = 67109378;
    LODWORD(v17[0]) = a2;
    WORD2(v17[0]) = 2114;
    *(_QWORD *)((char *)v17 + 6) = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Received match state: %d for #fontFamily '%{public}@'", (uint8_t *)&v16, 0x12u);
  }

  if ((a2 - 3) < 3)
  {
LABEL_6:
    v7 = _BookEPUBWebProcessPluginLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v16 = 67240450;
      LODWORD(v17[0]) = a2;
      WORD2(v17[0]) = 2114;
      *(_QWORD *)((char *)v17 + 6) = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Error state:%{public}u registering #fontFamily:'%{public}@'", (uint8_t *)&v16, 0x12u);
    }

    CFRelease(*(CFTypeRef *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return 0;
  }
  if (a2 != 1)
  {
    if (a2 != 8)
      return 1;
    goto LABEL_6;
  }
  v12 = _BookEPUBWebProcessPluginLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v16 = 138543362;
    v17[0] = v14;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Completed matching #fontFamily '%{public}@'", (uint8_t *)&v16, 0xCu);
  }

  CFRelease(*(CFTypeRef *)(a1 + 48));
  v15 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  v10 = 1;
  v15();
  return v10;
}

id BEAXWebNotificationWithName(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = sub_DD6C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", v1));

  return v4;
}

id sub_DD6C()
{
  if (qword_27178 != -1)
    dispatch_once(&qword_27178, &stru_20868);
  return (id)qword_27170;
}

id BEAXWebNotificationName(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v1 = a1;
  v2 = sub_DD6C();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v7, (_QWORD)v11));
        v9 = objc_msgSend(v8, "isEqual:", v1);

        if ((v9 & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

void BEAXPostWebProcessNotification(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a2));
  v5 = BEAXWebNotificationName(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v3, "accessibilityOverrideProcessNotification:", v6);
}

void sub_E030(id a1)
{
  void *v1;

  v1 = (void *)qword_27170;
  qword_27170 = (uint64_t)&off_219C0;

}

uint64_t BEBooksWebKitAccessibility()
{
  return _os_feature_enabled_impl("Accessibility", "VoiceOverBooksExperienceV2");
}

void sub_E0D0(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_27188;
  qword_27188 = (uint64_t)v1;

  if (_AXSApplicationAccessibilityEnabled())
    objc_msgSend((id)qword_27188, "loadAccessibilitySupportWithDelay");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", qword_27188, "loadAccessibilitySupportWithDelay", kAXSApplicationAccessibilityEnabledNotification, 0);

}

id sub_E270(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadAccessibilitySupport");
}

void BAXPerformBlockOnMainThread(void *a1)
{
  void (**block)(void);

  block = a1;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    block[2]();
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void BAXPerformBlockAsynchronouslyOnMainThread(dispatch_block_t block)
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void BAXPerformBlockOnMainThreadAfterDelay(void *a1, double a2)
{
  int64_t v2;
  dispatch_time_t v3;
  dispatch_block_t block;

  v2 = (uint64_t)(a2 * 1000000000.0);
  block = a1;
  v3 = dispatch_time(0, v2);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_E4B4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_27198;
  qword_27198 = (uint64_t)v1;

}

void sub_EE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_EE3C(uint64_t a1, uint64_t a2)
{
  void *v4;
  char *v5;
  uint64_t v6;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  CGPoint v15;
  CGPoint v16;

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v5 = (char *)objc_msgSend(v4, "bookLayout");

  objc_msgSend(v14, "frameInScreenCoordinates");
  if (v5 == (_BYTE *)&dword_0 + 3)
  {
    if (CGRectGetMinY(*(CGRect *)&v6) > *(double *)(a1 + 56))
      goto LABEL_8;
    objc_msgSend(v14, "frameCenterPoint");
    v15.x = v10;
    v15.y = v11;
    if (!CGRectContainsPoint(*(CGRect *)(a1 + 64), v15))
      goto LABEL_8;
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 - *(_QWORD *)(a1 + 96);
    goto LABEL_8;
  }
  if (CGRectGetMinX(*(CGRect *)&v6) <= *(double *)(a1 + 48))
  {
    objc_msgSend(v14, "frameCenterPoint");
    v16.x = v12;
    v16.y = v13;
    if (CGRectContainsPoint(*(CGRect *)(a1 + 64), v16))
      goto LABEL_7;
  }
LABEL_8:

}

void sub_FA60(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v8 = (void *)objc_opt_class(BAXObjectWrapper, v7);
  v9 = __BAXCastAsSafeCategory(v8, v18, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "baxAttachmentElement"));
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", UIAccessibilityTokenAttachment, v11, a3, a4);
  }
  else if (BAXShouldPerformValidationChecks())
  {
    v12 = BAXShouldCrashOnValidationErrorAfterLaunch();
    if (__BAXHandleValidationErrorWithDescription(v12, 0, CFSTR("We probably need to handle attachments like this one: %@"), v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 40)))abort();
  }

}

void sub_FD90(void *a1, NSUInteger *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSUInteger v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  NSUInteger v40;
  BEAXLineInfo *v41;
  char *v42;
  id v43;
  char *v44;
  void *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  NSRange v52;
  NSRange v53;

  v5 = a1;
  v6 = a3;
  v7 = (char *)objc_msgSend(v5, "accessibilityElementCount");
  if ((uint64_t)v7 < 1)
    goto LABEL_21;
  v8 = v7;
  v9 = 0;
  v42 = v7;
  v43 = v5;
  do
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityElementAtIndex:", v9));
    if ((uint64_t)objc_msgSend(v10, "accessibilityElementCount") >= 1)
    {
      sub_FD90(v10, a2, v6);
      goto LABEL_20;
    }
    v44 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lineRectsAndText"));
    v45 = v10;
    *a2 = (NSUInteger)objc_msgSend(v10, "elementTextRange");
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (!v12)
      goto LABEL_19;
    v13 = v12;
    v14 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("text")));
        v19 = objc_opt_class(NSString, v18);
        if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
        {
          v21 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v17);
        }
        else
        {
          v22 = objc_opt_class(NSAttributedString, v20);
          if ((objc_opt_isKindOfClass(v17, v22) & 1) == 0)
            goto LABEL_17;
          v21 = v17;
        }
        v23 = v21;
        v24 = *a2;
        v25 = objc_msgSend(v21, "length");
        *a2 += (NSUInteger)objc_msgSend(v23, "length");
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("rect")));
        objc_msgSend(v26, "CGRectValue");
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;

        +[BEAXLineInfo addOffsetForPoint:](BEAXLineInfo, "addOffsetForPoint:", v28, v30);
        v36 = v35;
        v38 = v37;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
        v53.location = (NSUInteger)objc_msgSend(v39, "rangeInChapter");
        v53.length = v40;
        v52.location = v24;
        v52.length = (NSUInteger)v25;
        if (!NSIntersectionRange(v52, v53).length)
        {
          v41 = -[BEAXLineInfo initWithRange:frame:attributedText:element:]([BEAXLineInfo alloc], "initWithRange:frame:attributedText:element:", v24, v25, v23, v45, v36, v38, v32, v34);
          objc_msgSend(v6, "addObject:", v41);

        }
LABEL_17:

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v13);
LABEL_19:

    v8 = v42;
    v5 = v43;
    v9 = v44;
    v10 = v45;
LABEL_20:

    ++v9;
  }
  while (v9 != v8);
LABEL_21:

}

void sub_111E4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_baxIsSettingSelectionTimer"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_baxIsSettingSelectionTimer"));
    objc_msgSend(v3, "invalidate");

  }
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &stru_208F8, 1.0));
  objc_msgSend(*(id *)(a1 + 32), "_baxSetIsSettingSelectionTimer:", v4);

}

void sub_1126C(id a1, NSTimer *a2)
{
  +[BEAXWebContentUtilities checkCanPerformActions](BEAXWebContentUtilities, "checkCanPerformActions");
}

void sub_116D4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_271B0;
  qword_271B0 = (uint64_t)v1;

}

id _BookEPUBWebProcessPluginLog()
{
  if (qword_271C0 != -1)
    dispatch_once(&qword_271C0, &stru_20918);
  return (id)qword_271B8;
}

void sub_11EA0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BookEPUBWebProcessPlugin");
  v2 = (void *)qword_271B8;
  qword_271B8 = (uint64_t)v1;

}

id BookEPUBWebProcessPluginRectFilteringLog()
{
  if (qword_271D0 != -1)
    dispatch_once(&qword_271D0, &stru_20938);
  return (id)qword_271C8;
}

void sub_11F10(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "RectFiltering");
  v2 = (void *)qword_271C8;
  qword_271C8 = (uint64_t)v1;

}

uint64_t sub_11F98()
{
  return 1;
}

JSValue *__cdecl sub_11FA0(id a1, JSValue *a2, JSValue *a3, JSValue *a4, JSValue *a5, JSValue *a6)
{
  JSValue *v7;
  JSValue *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[JSValue toArray](v8, "toArray"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[JSValue toArray](v7, "toArray"));

  v11 = RectsFilteredOfDuplicates(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[JSValue context](v8, "context"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", v12, v13));

  return (JSValue *)v14;
}

uint64_t BAXShouldPerformValidationChecks()
{
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
  return 0;
}

uint64_t __BAXHandleValidationErrorWithDescription(int a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  int v13;
  uint64_t v14;

  v11 = a3;
  v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v11, &a9);

  NSLog(CFSTR("*** BAX validation error: %@"), v12);
  v13 = a1 ^ 1;
  if (!v12)
    v13 = 1;
  v14 = v13 ^ 1u;
  if ((v13 & 1) == 0 && a2)
  {
    if (qword_271F0 != -1)
      dispatch_once(&qword_271F0, &stru_20A28);
    v14 = 0;
  }

  return v14;
}

uint64_t BAXShouldCrashOnValidationErrorAfterLaunch()
{
  if (qword_271E8 != -1)
    dispatch_once(&qword_271E8, &stru_20A08);
  return 0;
}

uint64_t __BAXPerformSafeBlock(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  v1[2]();

  return 0;
}

id __BAXCastAsSafeCategory(void *a1, void *a2, int a3, _BYTE *a4)
{
  id v7;
  NSString *v8;
  NSString *v9;
  Class v10;
  char isKindOfClass;
  id v12;
  Class v13;
  char v15;
  objc_class *v16;

  v7 = a2;
  if (v7)
  {
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "baxTargetClassName"));
    v9 = v8;
    if (!a3)
    {
      if (!v8)
        goto LABEL_20;
      v13 = NSClassFromString(v8);
      if (!v13)
        goto LABEL_20;
      isKindOfClass = objc_opt_isKindOfClass(v7, v13);
      goto LABEL_18;
    }
    if (qword_271D8 == -1)
    {
      if (!a4)
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&qword_271D8, &stru_209C8);
      if (!a4)
      {
LABEL_6:
        if (!v9)
          goto LABEL_20;
        v10 = NSClassFromString(v9);
        if (qword_271D8 == -1)
        {
          if (!a4)
            goto LABEL_10;
        }
        else
        {
          v16 = v10;
          dispatch_once(&qword_271D8, &stru_209C8);
          v10 = v16;
          if (!a4)
          {
LABEL_10:
            if (!v10)
              goto LABEL_20;
            isKindOfClass = objc_opt_isKindOfClass(v7, v10);
            if (qword_271D8 == -1)
            {
              if (!a4)
                goto LABEL_18;
            }
            else
            {
              v15 = isKindOfClass;
              dispatch_once(&qword_271D8, &stru_209C8);
              isKindOfClass = v15;
              if (!a4)
              {
LABEL_18:
                if ((isKindOfClass & 1) != 0)
                {
                  v12 = v7;
LABEL_21:

                  goto LABEL_22;
                }
LABEL_20:
                v12 = 0;
                goto LABEL_21;
              }
            }
            *a4 = 0;
            goto LABEL_18;
          }
        }
        *a4 = 0;
        goto LABEL_10;
      }
    }
    *a4 = 0;
    goto LABEL_6;
  }
  v12 = 0;
LABEL_22:

  return v12;
}

id __BAXCastAsClass(uint64_t a1, void *a2, int a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char isKindOfClass;
  id v10;

  v7 = a2;
  v8 = v7;
  if (!v7)
    goto LABEL_8;
  isKindOfClass = objc_opt_isKindOfClass(v7, a1);
  if (!a3)
    goto LABEL_6;
  if (qword_271D8 == -1)
  {
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  dispatch_once(&qword_271D8, &stru_209C8);
  if (a4)
LABEL_5:
    *a4 = 0;
LABEL_6:
  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = v8;
LABEL_9:

  return v10;
}

id __BAXCastAsProtocol(void *a1, void *a2, int a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;

  v7 = a1;
  v8 = a2;
  v9 = v8;
  if (!v8)
    goto LABEL_8;
  v10 = objc_msgSend(v8, "conformsToProtocol:", v7);
  if (!a3)
    goto LABEL_6;
  if (qword_271D8 == -1)
  {
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  dispatch_once(&qword_271D8, &stru_209C8);
  if (a4)
LABEL_5:
    *a4 = 0;
LABEL_6:
  if (!v10)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = v9;
LABEL_9:

  return v11;
}

void BAXInstallSafeCategory(NSString *a1)
{
  Class v1;
  Class v2;

  v1 = NSClassFromString(a1);
  v2 = v1;
  if (qword_271D8 == -1)
  {
    if (!v1)
      return;
    goto LABEL_3;
  }
  dispatch_once(&qword_271D8, &stru_209C8);
  if (v2)
LABEL_3:
    -[objc_class performSelector:](v2, "performSelector:", "_baxInitializeSafeCategory");
}

uint64_t BAXShouldCrashOnValidationError()
{
  if (qword_271E0 != -1)
    dispatch_once(&qword_271E0, &stru_209E8);
  return 0;
}

void BAXInstallSafeCategories(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  size_t v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  Class v9;
  Class v10;
  NSString *v11;
  Class v12;
  Class v13;
  id *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  char *v31;
  id v32;
  char *__base;
  id obj;
  _QWORD __compar[4];
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (!v2)
    goto LABEL_27;
  __base = (char *)malloc_type_malloc(40 * (_QWORD)v2, 0x800402FCC0CB6uLL);
  if (!__base)
    goto LABEL_27;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = v1;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_23;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v40;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v40 != v6)
        objc_enumerationMutation(obj);
      v8 = *(NSString **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v7);
      v9 = NSClassFromString(v8);
      v10 = v9;
      if (qword_271D8 == -1)
      {
        if (!v9)
          goto LABEL_14;
LABEL_10:
        v11 = (NSString *)objc_claimAutoreleasedReturnValue(-[objc_class baxTargetClassName](v10, "baxTargetClassName", v32));
        v12 = NSClassFromString(v11);
        v13 = v12;
        if (qword_271D8 == -1)
        {
          if (v12)
            goto LABEL_12;
        }
        else
        {
          dispatch_once(&qword_271D8, &stru_209C8);
          if (v13)
          {
LABEL_12:
            v14 = (id *)&__base[40 * v5];
            *v14 = v10;
            objc_storeStrong(v14 + 1, v8);
            v15 = sub_12F60(v10, v8);
            v16 = objc_claimAutoreleasedReturnValue(v15);
            v17 = v14[2];
            v14[2] = (id)v16;

            v14[3] = v13;
            v18 = sub_12F60(v13, v11);
            v19 = objc_claimAutoreleasedReturnValue(v18);
            v20 = v14[4];
            v14[4] = (id)v19;

            ++v5;
          }
        }

        goto LABEL_14;
      }
      dispatch_once(&qword_271D8, &stru_209C8);
      if (v10)
        goto LABEL_10;
LABEL_14:
      v7 = (char *)v7 + 1;
    }
    while (v4 != v7);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    v4 = v21;
  }
  while (v21);
LABEL_23:

  v23 = (void *)objc_opt_new(NSMutableArray, v22);
  v25 = (void *)objc_opt_new(NSMutableSet, v24);
  v27 = (void *)objc_opt_new(NSMutableSet, v26);
  __compar[0] = _NSConcreteStackBlock;
  __compar[1] = 3221225472;
  __compar[2] = sub_13010;
  __compar[3] = &unk_209A8;
  v28 = v23;
  v36 = v28;
  v29 = v25;
  v37 = v29;
  v30 = v27;
  v38 = v30;
  qsort_b(__base, v5, 0x28uLL, __compar);
  if (v5)
  {
    v31 = __base;
    do
    {
      objc_msgSend(*(id *)v31, "_baxInstallSafeCategoryOnClass:", *((_QWORD *)v31 + 3), v32);
      v31 += 40;
      --v5;
    }
    while (v5);
  }
  free(__base);

  v1 = v32;
LABEL_27:

}

id sub_12F60(void *a1, void *a2)
{
  id v3;
  id v4;
  objc_class *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", v3);
  v5 = (objc_class *)objc_msgSend(a1, "superclass");
  if (v5)
  {
    v6 = v5;
    do
    {
      objc_msgSend(v4, "insertString:atIndex:", CFSTR(","), 0);
      v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      objc_msgSend(v4, "insertString:atIndex:", v8, 0);

      v6 = (objc_class *)-[objc_class superclass](v6, "superclass");
    }
    while (v6);
  }

  return v4;
}

uint64_t sub_13010(void **a1, void **a2, uint64_t a3)
{
  uint64_t result;

  result = (uint64_t)objc_msgSend(a2[4], "compare:", *(_QWORD *)(a3 + 32));
  if (!result)
  {
    if ((sub_13098(a2, a3, a1[4], a1[5], a1[6]) & 1) != 0)
    {
      return 1;
    }
    else if ((sub_13098((void **)a3, (uint64_t)a2, a1[4], a1[5], a1[6]) & 1) != 0)
    {
      return -1;
    }
    else
    {
      return (uint64_t)objc_msgSend(a2[2], "compare:", *(_QWORD *)(a3 + 16));
    }
  }
  return result;
}

uint64_t sub_13098(void **a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  char v12;
  NSString *v13;
  Class v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  sub_14614(*a1, v9, v10, v11);
  v12 = 0;
  while (objc_msgSend(v9, "count"))
  {
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    objc_msgSend(v11, "addObject:", v13);
    if (-[NSString isEqualToString:](v13, "isEqualToString:", *(_QWORD *)(a2 + 8)))
    {
      objc_msgSend(v9, "removeAllObjects");
      v12 = 1;
    }
    else
    {
      v14 = NSClassFromString(v13);
      sub_14614(v14, v9, v10, v11);
    }

  }
  objc_msgSend(v11, "removeAllObjects");

  return v12 & 1;
}

id BAXLocString(void *a1)
{
  id v1;
  uint64_t v2;
  NSBundle *v3;
  void *v4;
  id v5;

  v1 = a1;
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BookEPUBWebProcessPlugin, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v1, &stru_20B88, CFSTR("Accessibility")));

  if (v5 == v1)
  {
    if (qword_271D8 != -1)
      dispatch_once(&qword_271D8, &stru_209C8);

    v5 = 0;
  }

  return v5;
}

void sub_13614(id a1)
{
  if (qword_271E0 != -1)
    dispatch_once(&qword_271E0, &stru_209E8);
}

void sub_13640(id a1)
{
  if (qword_271E0 != -1)
    dispatch_once(&qword_271E0, &stru_209E8);
}

void sub_13668(id a1)
{
  BAXPerformBlockOnMainThreadAfterDelay(&stru_20A48, 0.1);
}

void sub_1367C(id a1)
{
  NSLog(CFSTR("*** BAX validation error: see log output above."));
  abort();
}

void __BAXValidateMethodSignature(int a1, int a2, int a3, Method m, uint64_t a5, _QWORD *a6)
{
  char *v7;
  char *v8;
  unsigned int NumberOfArguments;
  unsigned int v10;
  unsigned int v11;
  _QWORD *v12;
  char *v13;
  char *v14;

  if (!m)
    return;
  v7 = method_copyReturnType(m);
  v8 = v7;
  if (qword_271D8 != -1)
  {
    dispatch_once(&qword_271D8, &stru_209C8);
    if (!v8)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v7)
LABEL_4:
    free(v8);
LABEL_5:
  NumberOfArguments = method_getNumberOfArguments(m);
  if (NumberOfArguments != 2)
  {
    v10 = NumberOfArguments;
    v11 = 2;
    while (1)
    {
      v12 = a6++;
      if (!*v12)
        goto LABEL_15;
      v13 = method_copyArgumentType(m, v11);
      v14 = v13;
      if (qword_271D8 != -1)
        break;
      if (v13)
        goto LABEL_10;
LABEL_11:
      if (v10 == ++v11)
        goto LABEL_15;
    }
    dispatch_once(&qword_271D8, &stru_209C8);
    if (!v14)
      goto LABEL_11;
LABEL_10:
    free(v14);
    goto LABEL_11;
  }
LABEL_15:
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
}

void __BAXValidateSymbol(char *__symbol)
{
  if (!dlsym(&dword_8, __symbol))
  {
    dlsym((void *)0xFFFFFFFFFFFFFFFELL, __symbol);
    if (qword_271D8 != -1)
      dispatch_once(&qword_271D8, &stru_209C8);
  }
}

void __BAXValidateClassMethod(NSString *a1, void *a2)
{
  NSString *v3;
  objc_class *v4;
  const char *v5;

  v3 = a2;
  v4 = NSClassFromString(a1);
  v5 = NSSelectorFromString(v3);

  class_getClassMethod(v4, v5);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
}

void __BAXValidateClassMethodComplete(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  NSString *v10;
  NSString *v11;
  objc_class *v12;
  const char *v13;
  Method ClassMethod;
  int v15;
  int v16;
  uint64_t v17;
  objc_method *v18;

  v10 = a2;
  v11 = a1;
  v12 = NSClassFromString(v11);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
  v13 = NSSelectorFromString(v10);
  ClassMethod = class_getClassMethod(v12, v13);
  v18 = ClassMethod;
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
  __BAXValidateMethodSignature((int)ClassMethod, v15, v16, v18, v17, &a9);

}

void __BAXValidateIsKindOfClass(NSString *a1, void *a2)
{
  objc_class *v3;
  Class v4;
  objc_class *v5;
  Class Superclass;
  NSString *aClassName;

  aClassName = a2;
  v3 = NSClassFromString(a1);
  v4 = NSClassFromString(aClassName);
  if (v3)
  {
    v5 = v4;
    if (v4)
    {
      do
      {
        Superclass = class_getSuperclass(v3);
        if (!Superclass)
          break;
        v3 = Superclass;
      }
      while (Superclass != v5);
    }
  }
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);

}

void __BAXValidateIvarType(NSString *a1, const char *a2)
{
  objc_class *v3;
  objc_ivar *InstanceVariable;

  v3 = NSClassFromString(a1);
  InstanceVariable = class_getInstanceVariable(v3, a2);
  ivar_getTypeEncoding(InstanceVariable);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
}

void __BAXValidateInstanceMethod(NSString *a1, void *a2)
{
  NSString *v3;
  objc_class *v4;
  const char *v5;
  Method *v6;
  unsigned int outCount;

  v3 = a2;
  v4 = NSClassFromString(a1);
  v5 = NSSelectorFromString(v3);

  class_getInstanceMethod(v4, v5);
  outCount = 0;
  v6 = class_copyMethodList(v4, &outCount);
  if (v6)
    free(v6);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
}

void __BAXValidateInstanceMethodComplete(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  NSString *v10;
  NSString *v11;
  objc_class *v12;
  const char *v13;
  Method InstanceMethod;
  int v15;
  int v16;
  uint64_t v17;
  objc_method *v18;

  v10 = a2;
  v11 = a1;
  v12 = NSClassFromString(v11);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
  v13 = NSSelectorFromString(v10);
  InstanceMethod = class_getInstanceMethod(v12, v13);
  v18 = InstanceMethod;
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
  __BAXValidateMethodSignature((int)InstanceMethod, v15, v16, v18, v17, &a9);

}

void __BAXValidateProperty(NSString *a1, const char *a2)
{
  objc_class *v3;

  v3 = NSClassFromString(a1);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
  class_getProperty(v3, a2);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
}

void __BAXValidateClass(NSString *a1)
{
  objc_class *v1;

  v1 = NSClassFromString(a1);
  class_getName(v1);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
}

void __BAXValidateIvar(NSString *a1, const char *a2)
{
  objc_class *v3;

  v3 = NSClassFromString(a1);
  class_getInstanceVariable(v3, a2);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
}

void __BAXValidateProtocolProperty(NSString *a1, const char *a2)
{
  Protocol *v3;
  Protocol *v4;

  v3 = NSProtocolFromString(a1);
  v4 = (Protocol *)objc_claimAutoreleasedReturnValue(v3);
  protocol_getProperty(v4, a2, 0, 1);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);

}

void __BAXValidateProtocolMethod(NSString *a1, void *a2, BOOL a3, BOOL a4)
{
  NSString *v7;
  Protocol *v8;
  const char *v9;
  Protocol *p;

  v7 = a2;
  v8 = NSProtocolFromString(a1);
  p = (Protocol *)objc_claimAutoreleasedReturnValue(v8);
  v9 = NSSelectorFromString(v7);

  protocol_getMethodDescription(p, v9, a3, a4);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);

}

objc_ivar *__bax_verbose_encode_with_type_encoding_group_class(objc_class *a1, const char *a2)
{
  objc_ivar *result;

  result = class_getInstanceVariable(a1, a2);
  if (result)
    return (objc_ivar *)ivar_getTypeEncoding(result);
  return result;
}

void __BAXSetAssociatedObject(void *a1, const void *a2, void *a3)
{
  objc_setAssociatedObject(a1, a2, a3, (char *)&dword_0 + 1);
}

void __BAXSetAssociatedNonRetainedObject(void *a1, const void *a2, void *a3)
{
  objc_setAssociatedObject(a1, a2, a3, 0);
}

void __BAXSetAssociatedCopiedObject(void *a1, const void *a2, void *a3)
{
  objc_setAssociatedObject(a1, a2, a3, (char *)&dword_0 + 3);
}

id __BAXGetAssociatedBool(void *a1, const void *a2)
{
  id AssociatedObject;
  void *v3;
  id v4;

  AssociatedObject = objc_getAssociatedObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

void __BAXSetAssociatedBool(void *a1, const void *a2, int a3)
{
  void *v5;
  id object;

  object = a1;
  if (a3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  else
    v5 = 0;
  objc_setAssociatedObject(object, a2, v5, (char *)&dword_0 + 1);

}

id __BAXGetAssociatedInteger(void *a1, const void *a2)
{
  id AssociatedObject;
  void *v3;
  id v4;

  AssociatedObject = objc_getAssociatedObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

void __BAXSetAssociatedInteger(void *a1, const void *a2, void *a3)
{
  id object;

  object = a1;
  if (a3)
    a3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_setAssociatedObject(object, a2, a3, (char *)&dword_0 + 1);

}

id __BAXGetAssociatedUnsignedInteger(void *a1, const void *a2)
{
  id AssociatedObject;
  void *v3;
  id v4;

  AssociatedObject = objc_getAssociatedObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

void __BAXSetAssociatedUnsignedInteger(void *a1, const void *a2, void *a3)
{
  id object;

  object = a1;
  if (a3)
    a3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_setAssociatedObject(object, a2, a3, (char *)&dword_0 + 1);

}

id __BAXGetAssociatedRange(void *a1, const void *a2)
{
  id AssociatedObject;
  void *v3;
  void *v4;
  id v5;

  AssociatedObject = objc_getAssociatedObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "rangeValue");
  else
    v5 = 0;

  return v5;
}

void __BAXSetAssociatedRange(void *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id object;

  object = a1;
  if (a3 | a4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4));
  else
    v7 = 0;
  objc_setAssociatedObject(object, a2, v7, (char *)&dword_0 + 1);

}

double __BAXGetAssociatedTimeInterval(void *a1, const void *a2)
{
  id AssociatedObject;
  void *v3;
  double v4;
  double v5;

  AssociatedObject = objc_getAssociatedObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

void __BAXSetAssociatedTimeInterval(void *a1, const void *a2, double a3)
{
  id v5;
  id object;

  object = a1;
  if (a3 == 0.0)
    v5 = 0;
  else
    v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", a3);
  objc_setAssociatedObject(object, a2, v5, (char *)&dword_0 + 1);

}

double __BAXGetAssociatedCGFloat(void *a1, const void *a2)
{
  id AssociatedObject;
  void *v3;
  double v4;
  double v5;

  AssociatedObject = objc_getAssociatedObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

void __BAXSetAssociatedCGFloat(void *a1, const void *a2, double a3)
{
  void *v5;
  id object;

  object = a1;
  if (a3 == 0.0)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_setAssociatedObject(object, a2, v5, (char *)&dword_0 + 1);

}

double __BAXGetAssociatedCGPoint(void *a1, const void *a2)
{
  id AssociatedObject;
  void *v3;
  void *v4;
  double v5;
  double x;

  AssociatedObject = objc_getAssociatedObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "CGPointValue");
    x = v5;
  }
  else
  {
    x = CGPointZero.x;
  }

  return x;
}

void __BAXSetAssociatedCGPoint(void *a1, const void *a2, double a3, double a4)
{
  void *v8;
  id object;

  object = a1;
  if (a3 == CGPointZero.x && a4 == CGPointZero.y)
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a3, a4));
  objc_setAssociatedObject(object, a2, v8, (char *)&dword_0 + 1);

}

double __BAXGetAssociatedCGRect(void *a1, const void *a2)
{
  id AssociatedObject;
  void *v3;
  void *v4;
  double v5;
  double x;

  AssociatedObject = objc_getAssociatedObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "CGRectValue");
    x = v5;
  }
  else
  {
    x = CGRectZero.origin.x;
  }

  return x;
}

void __BAXSetAssociatedCGRect(void *a1, const void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  void *v11;
  id object;
  CGRect v13;
  CGRect v14;

  object = a1;
  v14.origin.x = CGRectZero.origin.x;
  v14.origin.y = CGRectZero.origin.y;
  v14.size.width = CGRectZero.size.width;
  v14.size.height = CGRectZero.size.height;
  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  if (CGRectEqualToRect(v13, v14))
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a3, a4, a5, a6));
  objc_setAssociatedObject(object, a2, v11, (char *)&dword_0 + 1);

}

id __stringForNextArgument(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v1 = a1;
  v3 = objc_opt_class(NSString, v2);
  v5 = objc_opt_class(NSAttributedString, v4);
  if ((objc_opt_isKindOfClass(v1, v3) & 1) != 0)
  {
    v6 = v1;
  }
  else
  {
    if ((objc_opt_isKindOfClass(v1, v5) & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "string"));
  }
  v7 = v6;
LABEL_7:

  return v7;
}

id __BAXStringForVariables(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  id Argument;
  void *v12;
  id *v13;
  id v14;
  id v15;
  void *v16;
  id *v18;

  v9 = a1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", &stru_20B88));
  Argument = __stringForNextArgument(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(Argument);
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v10, "appendString:", v12);
  v18 = (id *)&a9;
  while (1)
  {
    v13 = v18++;
    v14 = *v13;
    v15 = __stringForNextArgument(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (!objc_msgSend(v16, "length"))
      goto LABEL_9;
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("__BAXStringForVariablesSentinel")) & 1) != 0)
      break;
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v10, "appendString:", CFSTR(", "));
    objc_msgSend(v10, "appendString:", v16);
LABEL_9:

  }
  return v10;
}

void sub_14614(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "baxAddSafeCategoryDependenciesToCollection:", v8);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsObject:", v15, (_QWORD)v16) & 1) == 0
          && (objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  objc_msgSend(v10, "removeAllObjects");
}

void sub_149A0(void *a1)
{
  objc_begin_catch(a1);
  if (qword_271D8 != -1)
    dispatch_once(&qword_271D8, &stru_209C8);
  objc_end_catch();
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_BAXLocalizedNumberForNumber_numberStyle_maximumNumberOfDigitsAfterDecimalSeparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:");
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPointValue");
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGSizeValue");
}

id objc_msgSend_JSGlobalContextRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSGlobalContextRef");
}

id objc_msgSend__accessibilityConvertDataArrayToTextMarkerArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityConvertDataArrayToTextMarkerArray:");
}

id objc_msgSend__accessibilityDecreaseSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityDecreaseSelection:");
}

id objc_msgSend__accessibilityIncreaseSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityIncreaseSelection:");
}

id objc_msgSend__accessibilityInternalTextLinkCustomRotors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityInternalTextLinkCustomRotors");
}

id objc_msgSend__accessibilityInternalTextLinks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityInternalTextLinks");
}

id objc_msgSend__accessibilityIsRTL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityIsRTL");
}

id objc_msgSend__accessibilityLineEndMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityLineEndMarker:");
}

id objc_msgSend__accessibilityLineStartMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityLineStartMarker:");
}

id objc_msgSend__accessibilityModifySelection_increase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityModifySelection:increase:");
}

id objc_msgSend__accessibilityMoveSelectionToMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityMoveSelectionToMarker:");
}

id objc_msgSend__accessibilityNextMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityNextMarker:");
}

id objc_msgSend__accessibilityObjectForTextMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityObjectForTextMarker:");
}

id objc_msgSend__accessibilityParentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityParentView");
}

id objc_msgSend__accessibilityPreviousMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityPreviousMarker:");
}

id objc_msgSend__accessibilityRangeForLineNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityRangeForLineNumber:");
}

id objc_msgSend__accessibilityRangeForTextMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityRangeForTextMarker:");
}

id objc_msgSend__accessibilityScrollStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityScrollStatus");
}

id objc_msgSend__accessibilityScrollWithDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityScrollWithDirection:");
}

id objc_msgSend__accessibilitySelectedTextRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilitySelectedTextRange");
}

id objc_msgSend__accessibilitySetBoolValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:");
}

id objc_msgSend__accessibilitySetSelectedTextRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilitySetSelectedTextRange:");
}

id objc_msgSend__accessibilityTextMarkerForPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityTextMarkerForPosition:");
}

id objc_msgSend__accessibilityTextMarkerRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityTextMarkerRange");
}

id objc_msgSend__accessibilityTextMarkerRangeForSelection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityTextMarkerRangeForSelection");
}

id objc_msgSend__accessibilityTextRectsForSpeakThisStringRange_string_wantsSentences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:");
}

id objc_msgSend__addInteractiveDescendantsOfElement_toArray_rootElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addInteractiveDescendantsOfElement:toArray:rootElement:");
}

id objc_msgSend__appendPageTurnToLastElementIgnoringImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appendPageTurnToLastElementIgnoringImages:");
}

id objc_msgSend__axPageScrollString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_axPageScrollString");
}

id objc_msgSend__baxAddCategoryMethod_toClass_isClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxAddCategoryMethod:toClass:isClass:");
}

id objc_msgSend__baxCachedAccessibilityElementTree(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxCachedAccessibilityElementTree");
}

id objc_msgSend__baxCachedAttachmentElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxCachedAttachmentElement");
}

id objc_msgSend__baxHeadingsRotor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxHeadingsRotor");
}

id objc_msgSend__baxHighlightRotor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxHighlightRotor");
}

id objc_msgSend__baxInstallSafeCategoryOnClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxInstallSafeCategoryOnClass:");
}

id objc_msgSend__baxInstallSafeCategoryOnClassNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxInstallSafeCategoryOnClassNamed:");
}

id objc_msgSend__baxIsSettingSelectionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxIsSettingSelectionTimer");
}

id objc_msgSend__baxIsTurning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxIsTurning");
}

id objc_msgSend__baxIsTurningCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxIsTurningCounter");
}

id objc_msgSend__baxSetCachedAccessibilityElementTree_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxSetCachedAccessibilityElementTree:");
}

id objc_msgSend__baxSetCachedAttachmentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxSetCachedAttachmentElement:");
}

id objc_msgSend__baxSetIsSettingSelectionTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxSetIsSettingSelectionTimer:");
}

id objc_msgSend__baxSetIsTurning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxSetIsTurning:");
}

id objc_msgSend__baxSetIsTurningCounter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxSetIsTurningCounter:");
}

id objc_msgSend__baxValidatedValueForKey_expectedClass_expectedTypeEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxValidatedValueForKey:expectedClass:expectedTypeEncoding:");
}

id objc_msgSend__baxValidatedValueForKey_expectedClass_possibleExpectedTypeEncodings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:");
}

id objc_msgSend__beaxParentWebPageObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beaxParentWebPageObject");
}

id objc_msgSend__bkaxIsInteractiveElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bkaxIsInteractiveElement:");
}

id objc_msgSend__bkaxSuperAccessibilityContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bkaxSuperAccessibilityContainer");
}

id objc_msgSend__checkActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkActions");
}

id objc_msgSend__dispatchPageScrolledNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dispatchPageScrolledNotification");
}

id objc_msgSend__elementContainsImageForSpeakScreen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_elementContainsImageForSpeakScreen:");
}

id objc_msgSend__handlePageTurnTraitForRootElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlePageTurnTraitForRootElement:");
}

id objc_msgSend__handleSyntheticElementFor_attributedValue_accessibilityFrame_interactiveElements_rootElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:");
}

id objc_msgSend__handleSyntheticImageElementFor_attributedValue_accessibilityFrame_interactiveElements_rootElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:");
}

id objc_msgSend__iosAccessibilityAttributeValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_iosAccessibilityAttributeValue:");
}

id objc_msgSend__isElementImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isElementImage:");
}

id objc_msgSend__isElementLink_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isElementLink:");
}

id objc_msgSend__isElementStaticText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isElementStaticText:");
}

id objc_msgSend__isElementVisible_forRootElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isElementVisible:forRootElement:");
}

id objc_msgSend__linkSubElementForElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_linkSubElementForElement:");
}

id objc_msgSend__modifySyntheticElement_withRootElement_forInteractiveElements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_modifySyntheticElement:withRootElement:forInteractiveElements:");
}

id objc_msgSend__previousInteractiveElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_previousInteractiveElement:");
}

id objc_msgSend__rangeForVisibleContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rangeForVisibleContent");
}

id objc_msgSend__remoteObjectRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteObjectRegistry");
}

id objc_msgSend__sanitizedCachedElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sanitizedCachedElements");
}

id objc_msgSend__stringFromStartMarker_toEndMarker_attributed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stringFromStartMarker:toEndMarker:attributed:");
}

id objc_msgSend__visibleRangeWithRect_withLineInfos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_visibleRangeWithRect:withLineInfos:");
}

id objc_msgSend_accessibilityArrayOfTextForTextMarkers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityArrayOfTextForTextMarkers:");
}

id objc_msgSend_accessibilityAttributedContentForLineNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityAttributedContentForLineNumber:");
}

id objc_msgSend_accessibilityAttributedPageContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityAttributedPageContent");
}

id objc_msgSend_accessibilityAttributedValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityAttributedValue");
}

id objc_msgSend_accessibilityBoundsForTextMarkers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityBoundsForTextMarkers:");
}

id objc_msgSend_accessibilityContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityContainer");
}

id objc_msgSend_accessibilityContentForLineNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityContentForLineNumber:");
}

id objc_msgSend_accessibilityElementAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityElementAtIndex:");
}

id objc_msgSend_accessibilityElementCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityElementCount");
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityElements");
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityFrame");
}

id objc_msgSend_accessibilityFrameForLineNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityFrameForLineNumber:");
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityLabel");
}

id objc_msgSend_accessibilityLineNumberForPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityLineNumberForPoint:");
}

id objc_msgSend_accessibilityNeedsReload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityNeedsReload");
}

id objc_msgSend_accessibilityOverrideProcessNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityOverrideProcessNotification:");
}

id objc_msgSend_accessibilityOverrideProcessNotification_notificationData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityOverrideProcessNotification:notificationData:");
}

id objc_msgSend_accessibilityPageContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityPageContent");
}

id objc_msgSend_accessibilityScroll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityScroll:");
}

id objc_msgSend_accessibilityStringForTextMarkers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityStringForTextMarkers:");
}

id objc_msgSend_accessibilityTraits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityTraits");
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityValue");
}

id objc_msgSend_accessibilityVisibleCharacterRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityVisibleCharacterRange");
}

id objc_msgSend_accessibilityVisibleContentRect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityVisibleContentRect");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOffsetForPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOffsetForPoint:");
}

id objc_msgSend_addPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPointer:");
}

id objc_msgSend_addSafeCategoryNamesToCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSafeCategoryNamesToCollection:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributedPageContentForBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedPageContentForBookContentElement:");
}

id objc_msgSend_attributedStringForElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedStringForElement");
}

id objc_msgSend_attributedStringForLineNumber_forBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedStringForLineNumber:forBookContentElement:");
}

id objc_msgSend_attributedStringForRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedStringForRange:");
}

id objc_msgSend_attributedSubstringFromRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedSubstringFromRange:");
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedText");
}

id objc_msgSend_attributedValueForRange_forBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedValueForRange:forBookContentElement:");
}

id objc_msgSend_baxAddSafeCategoryDependenciesToCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxAddSafeCategoryDependenciesToCollection:");
}

id objc_msgSend_baxAttachmentElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxAttachmentElement");
}

id objc_msgSend_baxBaseSafeCategoryClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxBaseSafeCategoryClass");
}

id objc_msgSend_baxBookContentElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxBookContentElement");
}

id objc_msgSend_baxBoundsForRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxBoundsForRange:");
}

id objc_msgSend_baxElementIsInteractive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxElementIsInteractive");
}

id objc_msgSend_baxInvalidateCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxInvalidateCaches");
}

id objc_msgSend_baxInvalidateContainerCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxInvalidateContainerCaches");
}

id objc_msgSend_baxInvalidateLineInfos(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxInvalidateLineInfos");
}

id objc_msgSend_baxIsBookContentElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxIsBookContentElement");
}

id objc_msgSend_baxIsInPictureBook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxIsInPictureBook");
}

id objc_msgSend_baxNeedsAttachmentElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxNeedsAttachmentElement");
}

id objc_msgSend_baxSetStoredAttributedPageContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredAttributedPageContent:");
}

id objc_msgSend_baxSetStoredHeadingsRotor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredHeadingsRotor:");
}

id objc_msgSend_baxSetStoredHeadingsRotorIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredHeadingsRotorIndex:");
}

id objc_msgSend_baxSetStoredHighlightRotor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredHighlightRotor:");
}

id objc_msgSend_baxSetStoredHighlightRotorIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredHighlightRotorIndex:");
}

id objc_msgSend_baxSetStoredLineInfos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredLineInfos:");
}

id objc_msgSend_baxSetStoredLinkInfos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredLinkInfos:");
}

id objc_msgSend_baxSetStoredLinkRotor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredLinkRotor:");
}

id objc_msgSend_baxSetStoredLinkRotorIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredLinkRotorIndex:");
}

id objc_msgSend_baxSetStoredVisibleLinkElements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredVisibleLinkElements:");
}

id objc_msgSend_baxSetStoredVisibleLinkInfos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxSetStoredVisibleLinkInfos:");
}

id objc_msgSend_baxStoredAttributedPageContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredAttributedPageContent");
}

id objc_msgSend_baxStoredHeadingsRotor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredHeadingsRotor");
}

id objc_msgSend_baxStoredHeadingsRotorIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredHeadingsRotorIndex");
}

id objc_msgSend_baxStoredHighlightRotor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredHighlightRotor");
}

id objc_msgSend_baxStoredHighlightRotorIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredHighlightRotorIndex");
}

id objc_msgSend_baxStoredLineInfos(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredLineInfos");
}

id objc_msgSend_baxStoredLinkInfos(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredLinkInfos");
}

id objc_msgSend_baxStoredLinkRotor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredLinkRotor");
}

id objc_msgSend_baxStoredLinkRotorIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredLinkRotorIndex");
}

id objc_msgSend_baxStoredVisibleLinkElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredVisibleLinkElements");
}

id objc_msgSend_baxStoredVisibleLinkInfos(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxStoredVisibleLinkInfos");
}

id objc_msgSend_baxTargetClassName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxTargetClassName");
}

id objc_msgSend_baxValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxValueForKey:");
}

id objc_msgSend_baxWebPageObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baxWebPageObject");
}

id objc_msgSend_be_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "be_identifier");
}

id objc_msgSend_bkaxAdditionalAXElementsForCurrentPage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bkaxAdditionalAXElementsForCurrentPage");
}

id objc_msgSend_bookLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bookLayout");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_chapterLineInfosForElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chapterLineInfosForElement:");
}

id objc_msgSend_chapterRangeForRange_forBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chapterRangeForRange:forBookContentElement:");
}

id objc_msgSend_checkActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkActions");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentPage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPage");
}

id objc_msgSend_currentPageLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPageLength");
}

id objc_msgSend_currentPageLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPageLocation");
}

id objc_msgSend_currentPageNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPageNumber");
}

id objc_msgSend_currentReadingState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentReadingState");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultJSContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultJSContext");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_documentChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "documentChanged");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_elementTextRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elementTextRange");
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateIndexesUsingBlock:");
}

id objc_msgSend_evaluateScript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateScript:");
}

id objc_msgSend_exportForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportForContext:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_frameCenterPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameCenterPoint");
}

id objc_msgSend_frameForLineNumber_forBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameForLineNumber:forBookContentElement:");
}

id objc_msgSend_frameForRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameForRange:");
}

id objc_msgSend_frameForRange_forBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameForRange:forBookContentElement:");
}

id objc_msgSend_frameForTextMarkers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameForTextMarkers:");
}

id objc_msgSend_frameInScreenCoordinates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameInScreenCoordinates");
}

id objc_msgSend_hasVisibleControls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasVisibleControls");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSet");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_initWithAccessibilityContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessibilityContainer:");
}

id objc_msgSend_initWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDouble:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithName_actionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:actionHandler:");
}

id objc_msgSend_initWithName_image_actionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:image:actionHandler:");
}

id objc_msgSend_initWithName_itemSearchBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:itemSearchBlock:");
}

id objc_msgSend_initWithObjectWrapperElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectWrapperElement:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithRange_frame_attributedText_element_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRange:frame:attributedText:element:");
}

id objc_msgSend_initWithReferenceElement_container_attributedValue_accessibilityFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReferenceElement:container:attributedValue:accessibilityFrame:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithSystemType_itemSearchBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSystemType:itemSearchBlock:");
}

id objc_msgSend_initWithTargetElement_targetRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTargetElement:targetRange:");
}

id objc_msgSend_initWithTargetElement_targetRange_targetTextMarkerRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTargetElement:targetRange:targetTextMarkerRange:");
}

id objc_msgSend_insertObjects_atIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObjects:atIndexes:");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateCaches");
}

id objc_msgSend_isAccessibilityElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessibilityElement");
}

id objc_msgSend_isAccessibilityLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessibilityLoaded");
}

id objc_msgSend_isAccessibilitySupportLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessibilitySupportLoaded");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFixedLayoutBook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFixedLayoutBook");
}

id objc_msgSend_isMainFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainFrame");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isPaginated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaginated");
}

id objc_msgSend_isRTL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRTL");
}

id objc_msgSend_isSpreadWithChapterBoundary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSpreadWithChapterBoundary");
}

id objc_msgSend_isTextHorizontal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTextHorizontal");
}

id objc_msgSend_isVisiblePageBookmarked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVisiblePageBookmarked");
}

id objc_msgSend_jsContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jsContext");
}

id objc_msgSend_jsContextForWorld_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jsContextForWorld:");
}

id objc_msgSend_knownBookContentElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownBookContentElements");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lineNumberForPoint_forBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineNumberForPoint:forBookContentElement:");
}

id objc_msgSend_lineRangeForCharacterPosition_forBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineRangeForCharacterPosition:forBookContentElement:");
}

id objc_msgSend_lineRangeForLineNumber_forBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineRangeForLineNumber:forBookContentElement:");
}

id objc_msgSend_lineRectsAndText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineRectsAndText");
}

id objc_msgSend_lineRectsForTextMarkerRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineRectsForTextMarkerRange:");
}

id objc_msgSend_linkElementsForElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkElementsForElement:");
}

id objc_msgSend_loadAccessibilitySupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadAccessibilitySupport");
}

id objc_msgSend_loadAccessibilitySupportWithDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadAccessibilitySupportWithDelay");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_mainFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainFrame");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_normalWorld(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "normalWorld");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objCType");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectWrapper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectWrapper");
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offset");
}

id objc_msgSend_pageCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pageCount");
}

id objc_msgSend_performNativeAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performNativeAction:");
}

id objc_msgSend_performValidation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performValidation");
}

id objc_msgSend_performableOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performableOperations");
}

id objc_msgSend_pointValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointValue");
}

id objc_msgSend_positionForTextMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "positionForTextMarker:");
}

id objc_msgSend_postWebAXNotification_notificationData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postWebAXNotification:notificationData:");
}

id objc_msgSend_primaryVisibleContentRect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryVisibleContentRect");
}

id objc_msgSend_processController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processController");
}

id objc_msgSend_rangeInChapter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeInChapter");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeValue");
}

id objc_msgSend_referenceElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceElement");
}

id objc_msgSend_registerBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerBookContentElement:");
}

id objc_msgSend_registerBookContentWrapper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerBookContentWrapper:");
}

id objc_msgSend_registerExportedObject_interface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerExportedObject:interface:");
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectInterface");
}

id objc_msgSend_remoteObjectInterfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectInterfaceWithProtocol:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_screenHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenHeight");
}

id objc_msgSend_screenWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenWidth");
}

id objc_msgSend_searchDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchDirection");
}

id objc_msgSend_secondaryVisibleContentRect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryVisibleContentRect");
}

id objc_msgSend_setAccessibilityAttributedValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityAttributedValue:");
}

id objc_msgSend_setAccessibilityFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityFrame:");
}

id objc_msgSend_setAccessibilityHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityHint:");
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setAccessibilityTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityTraits:");
}

id objc_msgSend_setBe_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBe_identifier:");
}

id objc_msgSend_setBookLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBookLayout:");
}

id objc_msgSend_setCurrentPageLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPageLength:");
}

id objc_msgSend_setCurrentPageLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPageLocation:");
}

id objc_msgSend_setCurrentPageNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPageNumber:");
}

id objc_msgSend_setHasVisibleControls_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasVisibleControls:");
}

id objc_msgSend_setIsAccessibilitySupportLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAccessibilitySupportLoaded:");
}

id objc_msgSend_setIsFixedLayoutBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFixedLayoutBook:");
}

id objc_msgSend_setIsPaginated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPaginated:");
}

id objc_msgSend_setIsRTL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRTL:");
}

id objc_msgSend_setIsSpreadWithChapterBoundary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsSpreadWithChapterBoundary:");
}

id objc_msgSend_setIsTextHorizontal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsTextHorizontal:");
}

id objc_msgSend_setIsVisiblePageBookmarked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsVisiblePageBookmarked:");
}

id objc_msgSend_setLoadDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoadDelegate:");
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumFractionDigits:");
}

id objc_msgSend_setNextNavigableElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextNavigableElement:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectWrapper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectWrapper:");
}

id objc_msgSend_setPageCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPageCount:");
}

id objc_msgSend_setPerformableOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerformableOperations:");
}

id objc_msgSend_setPreviousNavigableElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousNavigableElement:");
}

id objc_msgSend_setPrimaryVisibleContentRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryVisibleContentRect:");
}

id objc_msgSend_setReferenceElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReferenceElement:");
}

id objc_msgSend_setScreenHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenHeight:");
}

id objc_msgSend_setScreenWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenWidth:");
}

id objc_msgSend_setSecondaryVisibleContentRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondaryVisibleContentRect:");
}

id objc_msgSend_setTargetElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetElement:");
}

id objc_msgSend_setTargetNSRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetNSRange:");
}

id objc_msgSend_setVisibleAnnotations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVisibleAnnotations:");
}

id objc_msgSend_setVisibleInTouchRotor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVisibleInTouchRotor:");
}

id objc_msgSend_setWebProcessPlugin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWebProcessPlugin:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedUtilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedUtilities");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringForRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForRange:");
}

id objc_msgSend_stringForTextMarkers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForTextMarkers:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_subtractOffsetForPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtractOffsetForPoint:");
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superclass");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_textMarkerForPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textMarkerForPoint:");
}

id objc_msgSend_textMarkerRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textMarkerRange");
}

id objc_msgSend_toArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toArray");
}

id objc_msgSend_toBool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toBool");
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toDictionary");
}

id objc_msgSend_toggleBookmark(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleBookmark");
}

id objc_msgSend_toggleControlsVisibility(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleControlsVisibility");
}

id objc_msgSend_trimElementSpanningPageBoundary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trimElementSpanningPageBoundary");
}

id objc_msgSend_turnPageWithDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turnPageWithDirection:");
}

id objc_msgSend_unregisterExportedObject_interface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterExportedObject:interface:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateCurrentReadingState_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCurrentReadingState:forKeyPath:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCGRect:");
}

id objc_msgSend_valueWithCGSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCGSize:");
}

id objc_msgSend_valueWithObject_inContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithObject:inContext:");
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithRange:");
}

id objc_msgSend_valueWithRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithRect:");
}

id objc_msgSend_visibleAnnotations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleAnnotations");
}

id objc_msgSend_visibleLinesForBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleLinesForBookContentElement:");
}

id objc_msgSend_visibleLinkElements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleLinkElements:");
}

id objc_msgSend_visibleTextRangeInChapterForBookContentElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:");
}

id objc_msgSend_webProcessPlugin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webProcessPlugin");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
