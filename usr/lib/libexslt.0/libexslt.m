void exsltCommonRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"node-set", (const xmlChar *)"http://exslt.org/common", (xmlXPathFunction)exsltNodeSetFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"object-type", (const xmlChar *)"http://exslt.org/common", (xmlXPathFunction)exsltObjectTypeFunction);
  xsltRegisterExtModuleElement((const xmlChar *)"document", (const xmlChar *)"http://exslt.org/common", MEMORY[0x24BEDF0A8], MEMORY[0x24BEDF0B0]);
}

void exsltNodeSetFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  xsltTransformContextPtr TransformContext;
  xmlDoc *RVT;
  xmlDoc *v6;
  xmlChar *v7;
  xmlNode *v8;
  xmlXPathObject *v9;

  if (a2 == 1)
  {
    value = ctxt->value;
    if (value && (value->type | 8) == 9)
    {
      xsltFunctionNodeSet(ctxt, 1);
    }
    else
    {
      TransformContext = xsltXPathGetTransformContext(ctxt);
      RVT = xsltCreateRVT(TransformContext);
      if (RVT)
      {
        v6 = RVT;
        xsltRegisterLocalRVT(TransformContext, RVT);
        v7 = xmlXPathPopString(ctxt);
        v8 = xmlNewDocText(v6, v7);
        xmlAddChild((xmlNodePtr)v6, v8);
        v9 = xmlXPathNewNodeSet(v8);
        if (!v9)
        {
          xsltTransformError(TransformContext, 0, TransformContext->inst, "exsltNodeSetFunction: Failed to create a node set object.\n");
          TransformContext->state = XSLT_STATE_STOPPED;
        }
        if (v7)
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v7);
        valuePush(ctxt, v9);
      }
      else
      {
        xsltTransformError(TransformContext, 0, TransformContext->inst, "exsltNodeSetFunction: Failed to create a tree fragment.\n");
        TransformContext->state = XSLT_STATE_STOPPED;
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/common.c", 20, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltObjectTypeFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr v3;
  unsigned int v4;
  xmlXPathObject *v5;

  if (a2 == 1)
  {
    v3 = valuePop(ctxt);
    v4 = v3->type - 1;
    if (v4 < 9 && ((0x18Fu >> v4) & 1) != 0)
    {
      v5 = xmlXPathNewCString((&off_24E04C9A0)[v4]);
      xmlXPathFreeObject(v3);
      valuePush(ctxt, v5);
    }
    else
    {
      ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "object-type() invalid arg\n");
      ctxt->error = 11;
      xmlXPathFreeObject(v3);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/common.c", 69, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltDateRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"add", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateAddFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"add-duration", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateAddDurationFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"date", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDateFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"date-time", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDateTimeFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-abbreviation", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayAbbreviationFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInMonthFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-in-week", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInWeekFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInYearFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-name", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayNameFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-of-week-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayOfWeekInMonthFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"difference", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDifferenceFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"duration", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDurationFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"hour-in-day", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateHourInDayFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"leap-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateLeapYearFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"minute-in-hour", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMinuteInHourFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"month-abbreviation", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthAbbreviationFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"month-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthInYearFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"month-name", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthNameFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"second-in-minute", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSecondInMinuteFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"seconds", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSecondsFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"sum", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSumFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"time", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateTimeFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"week-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateWeekInMonthFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"week-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateWeekInYearFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateYearFunction);
}

void exsltDateAddFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlChar *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  xmlChar *v7;
  xmlChar *v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t Date;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(unsigned __int8 *);
  xmlXPathObject *v27;
  BOOL v28;
  uint64_t v29;
  int v30;
  long double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  int v36;
  int64_t v37;
  uint64_t v38;
  unsigned int v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  _QWORD *v49;
  int v50;
  int v51;
  void (**v52)(uint64_t);
  int v53;
  xmlChar *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  xmlChar *v64;
  unint64_t v65;
  xmlChar v66;
  xmlChar *v67;
  int v68;
  xmlChar *v69;
  unsigned int v70;
  xmlChar *v71;
  __int16 v72;
  __int16 v73;
  char v74;
  unsigned int v75;
  xmlChar v76;
  unsigned int v77;
  char v78;
  _OWORD v79[6];
  int v80;
  xmlChar cur[16];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  int v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  if (a2 == 2)
  {
    v3 = xmlXPathPopString(ctxt);
    if (ctxt->error)
      return;
    v4 = v3;
    v5 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v4);
      return;
    }
    v6 = v5;
    v7 = 0;
    if (!v4)
      goto LABEL_30;
    if (!v5)
      goto LABEL_30;
    v8 = (xmlChar *)exsltDateParse(v5);
    v7 = v8;
    if (!v8)
      goto LABEL_30;
    if ((*(_DWORD *)v8 & 0xFFFFFFF8) != 8 || (v9.n128_f64[0] = exsltDateParseDuration(v4, v9), !v10))
    {
      ((void (*)(xmlChar *, __n128))*MEMORY[0x24BEDE758])(v7, v9);
      goto LABEL_29;
    }
    v11 = v10;
    Date = exsltDateCreateDate(*(_DWORD *)v7);
    v13 = Date;
    if (Date)
    {
      v14 = *(_QWORD *)v11 / 12;
      v15 = *(_QWORD *)v11 % 12 + (*((_DWORD *)v7 + 4) & 0xF);
      v16 = v15 - 12;
      if ((unint64_t)v15 < 0xD)
        v17 = *(_QWORD *)v11 / 12;
      else
        v17 = v14 + 1;
      if ((unint64_t)v15 < 0xD)
        v16 = *(_QWORD *)v11 % 12 + (*((_DWORD *)v7 + 4) & 0xF);
      v18 = v15 + 12;
      v19 = v14 - 1;
      v20 = v15 <= 0;
      v21 = v15 <= 0 ? v19 : v17;
      v22 = v20 ? v18 : v16;
      v23 = *(_DWORD *)(Date + 16) & 0xFFFFFFF0 | v22;
      *(_DWORD *)(Date + 16) = v23;
      v24 = v21 + 400 * (*(_QWORD *)(v11 + 8) / 146097);
      if (v24 < 1)
      {
        v25 = *((_QWORD *)v7 + 1);
        if (v24)
          v28 = v25 < (uint64_t)(0x8000000000000002 - v24);
        else
          v28 = 0;
        if (v28)
          goto LABEL_83;
      }
      else
      {
        v25 = *((_QWORD *)v7 + 1);
        if (v25 > (v24 ^ 0x7FFFFFFFFFFFFFFFLL))
        {
LABEL_83:
          ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v13);
          v13 = 0;
          goto LABEL_95;
        }
      }
      v29 = v25 + v24;
      *(_QWORD *)(Date + 8) = v25 + v24;
      v30 = *(_WORD *)(Date + 32) & 0xE001 | (2 * ((*((unsigned __int16 *)v7 + 16) >> 1) & 0xFFF));
      *(_WORD *)(Date + 32) = v30;
      *(_WORD *)(Date + 32) = v30 & 0xFFFE | *((_WORD *)v7 + 16) & 1;
      v31 = *((double *)v7 + 3) + *(double *)(v11 + 16);
      v32 = fmod(v31, 60.0);
      *(double *)(v13 + 24) = v32;
      v33 = (uint64_t)(v31 / 60.0);
      v34 = v33 / 60;
      v35 = v33 % 60 + (((unint64_t)*((unsigned int *)v7 + 4) >> 14) & 0x3F);
      if (v35 > 59)
      {
        ++v34;
        LOBYTE(v35) = v35 - 60;
      }
      v36 = v23 & 0xFFF03FFF | ((v35 & 0x3F) << 14);
      *(_DWORD *)(v13 + 16) = v36;
      v37 = v34 % 24 + (((unint64_t)*((unsigned int *)v7 + 4) >> 9) & 0x1F);
      if (v37 <= 23)
        v38 = v34 / 24;
      else
        v38 = v34 / 24 + 1;
      if (v37 > 23)
        LOBYTE(v37) = v37 - 24;
      v39 = v36 & 0xFFFFC1FF | ((v37 & 0x1F) << 9);
      *(_DWORD *)(v13 + 16) = v39;
      v40 = ((unint64_t)*((unsigned int *)v7 + 4) >> 4) & 0x1F;
      if ((v29 & 3) != 0)
      {
        v41 = daysInMonth[v22 - 1];
      }
      else
      {
        v42 = v22 - 1;
        if (0x8F5C28F5C28F5C29 * v29 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70 && (v29 & 0xF) != 0)
          v41 = daysInMonth[v42];
        else
          v41 = daysInMonthLeap[v42];
      }
      if (v41 >= v40)
      {
        if ((_DWORD)v40)
          v41 = ((unint64_t)*((unsigned int *)v7 + 4) >> 4) & 0x1F;
        else
          v41 = 1;
      }
      v43 = v38 + v41 + *(_QWORD *)(v11 + 8) % 146097;
LABEL_56:
      v44 = (v29 & 0xF) == 0
         || (unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v29) > 0xA3D70A3D70A3D70;
      v45 = v44;
      while (1)
      {
        if (v43 <= 0)
        {
          if ((v39 & 0xE) != 0)
          {
            v39 = v39 & 0xFFFFFFF0 | (v39 - 1) & 0xF;
            *(_DWORD *)(v13 + 16) = v39;
          }
          else
          {
            if (v29 == 0x8000000000000002)
              goto LABEL_83;
            v39 = v39 & 0xFFFFFFF0 | 0xC;
            *(_DWORD *)(v13 + 16) = v39;
            *(_QWORD *)(v13 + 8) = --v29;
          }
          if ((v29 & 3) != 0
            || ((unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v29) <= 0xA3D70A3D70A3D70
              ? (v48 = (v29 & 0xF) == 0)
              : (v48 = 1),
                v49 = daysInMonthLeap,
                !v48))
          {
            v49 = daysInMonth;
          }
          v43 += v49[(v39 & 0xF) - 1];
          goto LABEL_56;
        }
        v46 = (v39 & 0xF) - 1;
        if ((v29 & 3) != 0 || !v45)
          v47 = daysInMonth[v46];
        else
          v47 = daysInMonthLeap[v46];
        if (v43 <= v47)
          break;
        v43 -= v47;
        if ((~v39 & 0xC) == 0)
        {
          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_83;
          v39 = v39 & 0xFFFFFFF0 | 1;
          *(_DWORD *)(v13 + 16) = v39;
          *(_QWORD *)(v13 + 8) = ++v29;
          goto LABEL_56;
        }
        v39 = v39 & 0xFFFFFFF0 | (v39 + 1) & 0xF;
        *(_DWORD *)(v13 + 16) = v39;
      }
      *(_DWORD *)(v13 + 16) = v39 & 0xFFFFFE0F | (16 * (v43 & 0x1F));
      v50 = *(_DWORD *)v13;
      if (*(_DWORD *)v13 != 15)
      {
        if ((v39 & 0xFFE00) != 0 || v32 != 0.0)
        {
          v51 = 15;
          goto LABEL_94;
        }
        if (v50 == 14)
          goto LABEL_95;
        if ((v43 & 0x1F) != 1)
        {
          v51 = 14;
          goto LABEL_94;
        }
        if (v50 != 12 && (v39 & 0xF) != 1)
        {
          v51 = 12;
LABEL_94:
          *(_DWORD *)v13 = v51;
        }
      }
    }
LABEL_95:
    v52 = (void (**)(uint64_t))MEMORY[0x24BEDE758];
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v7);
    (*v52)(v11);
    if (v13)
    {
      v53 = *(_DWORD *)v13;
      if (*(_DWORD *)v13 == 1)
      {
        v54 = exsltDateFormatTime(v13);
        goto LABEL_157;
      }
      if (v53 == 14)
      {
        v54 = exsltDateFormatDate(v13);
        goto LABEL_157;
      }
      if (v53 == 15)
      {
        v54 = exsltDateFormatDateTime(v13);
LABEL_157:
        v7 = v54;
        goto LABEL_158;
      }
      if ((v53 & 8) == 0)
      {
        v7 = 0;
LABEL_158:
        (*v52)(v13);
        goto LABEL_30;
      }
      v87 = 0;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      *(_OWORD *)cur = 0u;
      v82 = 0u;
      v55 = *(_QWORD *)(v13 + 8);
      if (v55 <= 0)
      {
        cur[0] = 45;
        v56 = 1;
      }
      else
      {
        v56 = 0;
      }
      v80 = 0;
      v57 = 1 - v55;
      if (v55 >= 1)
        v57 = v55;
      memset(v79, 0, sizeof(v79));
      if ((uint64_t)v57 < 1)
      {
        v61 = (char *)v79;
      }
      else
      {
        v58 = 0;
        do
        {
          v59 = v58 + 1;
          *((_BYTE *)v79 + v58) = (v57 % 0xA) | 0x30;
          if (v57 < 0xA)
            break;
          v57 /= 0xAuLL;
        }
        while (v58++ < 0x62);
        v61 = (char *)v79 + v59;
      }
      v62 = v61 - (char *)v79;
      if (v61 - (char *)v79 <= 3)
      {
        memset(v61, 48, (char *)v79 + 4 - v61);
        v61 = (char *)v79 + 4;
      }
      if (v61 <= (char *)v79)
      {
        if (v53 != 12)
          goto LABEL_137;
        v67 = (xmlChar *)((unint64_t)cur | v56);
      }
      else
      {
        v63 = 4;
        if (v62 > 4)
          v63 = v62;
        v64 = (xmlChar *)v79 + v63 - 1;
        do
        {
          v65 = v56++;
          v20 = v64 > (xmlChar *)v79;
          v66 = *v64--;
          cur[v65] = v66;
        }
        while (v20 && v65 < 0x62);
        if (v53 != 12)
        {
LABEL_137:
          v71 = &cur[v56];
          v72 = *(_WORD *)(v13 + 32);
          if ((v72 & 0x1FFF) != 0)
          {
            v73 = 8 * v72;
            if ((unsigned __int16)(8 * v72) > 0xFu)
            {
              v75 = v73 >> 4;
              if (v73 < 0)
                v75 = -v75;
              if (v56 <= 98)
              {
                if ((*(_WORD *)(v13 + 32) & 0x1000) != 0)
                  v76 = 45;
                else
                  v76 = 43;
                cur[v56] = v76;
                if (v56 != 98)
                {
                  cur[v56 + 1] = (v75 / 0x258 - 10 * ((429496730 * (unint64_t)(v75 / 0x258)) >> 32)) | 0x30;
                  if (v56 <= 96)
                  {
                    cur[v56 + 2] = (v75 / 0x3C - 10 * ((429496730 * (unint64_t)(v75 / 0x3C)) >> 32)) | 0x30;
                    if (v56 != 96)
                    {
                      cur[v56 + 3] = 58;
                      if (v56 < 95)
                      {
                        v77 = v75 % 0x3C;
                        v78 = v75 % 0x3C / 0xA;
                        cur[v56 + 4] = v78 | 0x30;
                        v71 = &cur[v56 + 5];
                        if (v56 == 94)
                          goto LABEL_156;
                        v74 = (v77 - 10 * v78) | 0x30;
                        goto LABEL_141;
                      }
                    }
                  }
                }
                v56 = 99;
              }
              v71 = &cur[v56];
              goto LABEL_156;
            }
            if (v56 <= 98)
            {
              v74 = 90;
LABEL_141:
              *v71++ = v74;
            }
          }
LABEL_156:
          *v71 = 0;
          v54 = xmlStrdup(cur);
          goto LABEL_157;
        }
        if (v65 > 0x61)
        {
LABEL_131:
          if (v56 <= 98)
          {
            v68 = *(_DWORD *)(v13 + 16);
            cur[v56] = ((v68 & 0xEu) > 9) | 0x30;
            if (v56 == 98)
            {
              v56 = 99;
            }
            else
            {
              v69 = &cur[v56];
              v70 = v68 & 0xF;
              if (v70 >= 0xA)
                LOBYTE(v70) = v70 - 10;
              v56 += 2;
              v69[1] = v70 | 0x30;
            }
          }
          goto LABEL_137;
        }
        v67 = &cur[v56];
      }
      ++v56;
      *v67 = 45;
      goto LABEL_131;
    }
LABEL_29:
    v7 = 0;
LABEL_30:
    v26 = (void (**)(unsigned __int8 *))MEMORY[0x24BEDE758];
    ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v4);
    (*v26)(v6);
    if (v7)
      v27 = xmlXPathWrapString(v7);
    else
      v27 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
    valuePush(ctxt, v27);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3629, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltDateAddDurationFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlChar *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  __n128 v6;
  unsigned __int8 *v7;
  xmlChar *v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  __n128 v12;
  xmlChar *v13;
  _QWORD *Duration;
  uint64_t v15;
  void (**v16)(xmlChar *);
  void (**v17)(unsigned __int8 *);
  xmlXPathObject *v18;

  if (a2 == 2)
  {
    v3 = xmlXPathPopString(ctxt);
    if (ctxt->error)
      return;
    v4 = v3;
    v5 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v4);
      return;
    }
    v7 = v5;
    v8 = 0;
    if (!v4 || !v5)
      goto LABEL_19;
    v10.n128_f64[0] = exsltDateParseDuration(v5, v6);
    if (v9)
    {
      v11 = v9;
      v12.n128_f64[0] = exsltDateParseDuration(v4, v10);
      v8 = v13;
      if (!v13)
      {
LABEL_17:
        ((void (*)(uint64_t, __n128))*MEMORY[0x24BEDE758])(v11, v12);
LABEL_19:
        v17 = (void (**)(unsigned __int8 *))MEMORY[0x24BEDE758];
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v4);
        (*v17)(v7);
        if (v8)
          v18 = xmlXPathWrapString(v8);
        else
          v18 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
        valuePush(ctxt, v18);
        return;
      }
      Duration = exsltDateCreateDuration();
      v15 = (uint64_t)Duration;
      if (Duration && !_exsltDateAddDurCalc((uint64_t)Duration, v11, (uint64_t)v8))
      {
        ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v15);
        v15 = 0;
      }
      v16 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
      ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v11);
      (*v16)(v8);
      if (v15)
      {
        v8 = exsltDateFormatDuration(v15);
        v11 = v15;
        goto LABEL_17;
      }
    }
    v8 = 0;
    goto LABEL_19;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3666, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltDateDateFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  const char *v5;
  _DWORD *v6;
  uint64_t v7;
  char v8;
  xmlChar *v9;
  xmlXPathObject *v10;

  if (a2 >= 2)
  {
    v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3183, 12);
    if (!ctxt)
      return;
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 != 1)
    goto LABEL_12;
  v4 = xmlXPathPopString(ctxt);
  if (ctxt->error)
  {
    v3 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3189, 11);
    goto LABEL_7;
  }
  v5 = (const char *)v4;
  if (!v4)
  {
LABEL_12:
    v7 = exsltDateCurrent();
    v5 = 0;
    v8 = 1;
    if (!v7)
      goto LABEL_17;
    goto LABEL_13;
  }
  v6 = (_DWORD *)exsltDateParse(v4);
  if (!v6)
  {
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  v7 = (uint64_t)v6;
  if ((*v6 & 0xFFFFFFFE) != 0xE)
  {
    ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v6);
    goto LABEL_16;
  }
  v8 = 0;
LABEL_13:
  v9 = exsltDateFormatDate(v7);
  ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v7);
  if (v9)
  {
    v10 = xmlXPathWrapString(v9);
    goto LABEL_18;
  }
LABEL_17:
  ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0D0])(*MEMORY[0x24BEDF0D8], "{http://exslt.org/dates-and-times}date: invalid date or format %s\n", v5);
  v10 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
LABEL_18:
  valuePush(ctxt, v10);
  if ((v8 & 1) == 0)
    ((void (*)(const char *))*MEMORY[0x24BEDE758])(v5);
}

void exsltDateDateTimeFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  uint64_t v3;
  uint64_t v4;
  xmlChar *v5;
  xmlXPathObject *v6;

  if (a2)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3158, 12);
    if (ctxt)
      ctxt->error = 12;
  }
  else
  {
    v3 = exsltDateCurrent();
    if (v3 && (v4 = v3, v5 = exsltDateFormatDateTime(v3), ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v4), v5))
      v6 = xmlXPathWrapString(v5);
    else
      v6 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
    valuePush(ctxt, v6);
  }
}

void exsltDateDayAbbreviationFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  xmlChar *v4;
  unsigned __int8 *v5;
  double v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  const xmlChar *v10;
  xmlChar *v11;
  xmlXPathObject *v12;

  if (a2 >= 2)
  {
    v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3532, 12);
    if (!ctxt)
      return;
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3539, 11);
      goto LABEL_7;
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = exsltDateDayInWeek(v5);
  if (xmlXPathIsNaN(v6))
    v7 = 1;
  else
    v7 = v6 < 1.0;
  LODWORD(v8) = (int)v6;
  v9 = v7 || v6 > 7.0;
  v8 = (int)v8;
  if (v9)
    v8 = 0;
  v10 = (const xmlChar *)&exsltDateDayAbbreviation_dayAbbreviations + 4 * v8;
  if (v5)
    ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
  v11 = xmlStrdup(v10);
  v12 = xmlXPathWrapString(v11);
  valuePush(ctxt, v12);
}

void exsltDateDayInMonthFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  _DWORD *v6;
  char v8;
  double v9;
  xmlXPathObject *v10;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3461, 11);
        goto LABEL_7;
      }
      v5 = v4;
      if (v4)
      {
        v6 = (_DWORD *)exsltDateParse(v4);
        if (v6)
        {
          if (*v6 <= 0xFu && ((1 << *v6) & 0xC044) != 0)
          {
            v8 = 0;
LABEL_17:
            v9 = (double)((v6[4] >> 4) & 0x1F);
            ((void (*)(void))*MEMORY[0x24BEDE758])();
            if ((v8 & 1) != 0)
              goto LABEL_23;
            goto LABEL_22;
          }
          ((void (*)(void))*MEMORY[0x24BEDE758])();
        }
        v9 = *MEMORY[0x24BEDEF40];
LABEL_22:
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
        goto LABEL_23;
      }
    }
    v6 = (_DWORD *)exsltDateCurrent();
    if (!v6)
    {
      v9 = *MEMORY[0x24BEDEF40];
LABEL_23:
      v10 = xmlXPathNewFloat(v9);
      valuePush(ctxt, v10);
      return;
    }
    v5 = 0;
    v8 = 1;
    goto LABEL_17;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3461, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateDayInWeekFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  double v5;
  xmlXPathObject *v6;
  unsigned __int8 *v7;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3479, 11);
        goto LABEL_7;
      }
      v7 = v4;
      v5 = exsltDateDayInWeek(v4);
      if (v7)
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v7);
    }
    else
    {
      v5 = exsltDateDayInWeek(0);
    }
    v6 = xmlXPathNewFloat(v5);
    valuePush(ctxt, v6);
    return;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3479, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateDayInYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  BOOL v9;
  _QWORD *v10;
  int64_t v11;
  double v12;
  xmlXPathObject *v13;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3452, 11);
        goto LABEL_7;
      }
      v5 = v4;
      if (v4)
      {
        v6 = exsltDateParse(v4);
        if (v6)
        {
          if ((*(_DWORD *)v6 & 0xFFFFFFFE) == 0xE)
          {
            v7 = 0;
LABEL_14:
            v8 = *(_QWORD *)(v6 + 8);
            if ((v8 & 3) == 0
              && (0x8F5C28F5C28F5C29 * v8 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
                ? (v9 = (*(_QWORD *)(v6 + 8) & 0xFLL) == 0)
                : (v9 = 1),
                  v9))
            {
              v10 = &dayInLeapYearByMonth;
            }
            else
            {
              v10 = &dayInYearByMonth;
            }
            v11 = v10[(*(_DWORD *)(v6 + 16) & 0xF) - 1] + (((unint64_t)*(unsigned int *)(v6 + 16) >> 4) & 0x1F);
            ((void (*)(void))*MEMORY[0x24BEDE758])();
            v12 = (double)v11;
            if ((v7 & 1) != 0)
              goto LABEL_28;
            goto LABEL_27;
          }
          ((void (*)(void))*MEMORY[0x24BEDE758])();
        }
        v12 = *MEMORY[0x24BEDEF40];
LABEL_27:
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
        goto LABEL_28;
      }
    }
    v6 = exsltDateCurrent();
    if (!v6)
    {
      v12 = *MEMORY[0x24BEDEF40];
LABEL_28:
      v13 = xmlXPathNewFloat(v12);
      valuePush(ctxt, v13);
      return;
    }
    v5 = 0;
    v7 = 1;
    goto LABEL_14;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3452, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateDayNameFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  xmlChar *v4;
  unsigned __int8 *v5;
  double v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  const xmlChar *v10;
  xmlChar *v11;
  xmlXPathObject *v12;

  if (a2 >= 2)
  {
    v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3495, 12);
    if (!ctxt)
      return;
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3502, 11);
      goto LABEL_7;
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = exsltDateDayInWeek(v5);
  if (xmlXPathIsNaN(v6))
    v7 = 1;
  else
    v7 = v6 < 1.0;
  v8 = v7 || v6 > 7.0;
  v9 = (int)v6;
  if (v8)
    v9 = 0;
  v10 = (const xmlChar *)&exsltDateDayName_dayNames + 10 * v9;
  if (v5)
    ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
  v11 = xmlStrdup(v10);
  v12 = xmlXPathWrapString(v11);
  valuePush(ctxt, v12);
}

void exsltDateDayOfWeekInMonthFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  _DWORD *v6;
  char v7;
  unsigned int v8;
  double v9;
  xmlXPathObject *v10;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3470, 11);
        goto LABEL_7;
      }
      v5 = v4;
      if (v4)
      {
        v6 = (_DWORD *)exsltDateParse(v4);
        if (v6)
        {
          if ((*v6 & 0xFFFFFFFE) == 0xE)
          {
            v7 = 0;
LABEL_14:
            v8 = (((char)((unsigned __int16)(147 * (((v6[4] >> 4) & 0x1F) - 1)) >> 8) >> 2)
                                 + ((((unsigned __int16)(147 * (((v6[4] >> 4) & 0x1F) - 1)) >> 8) & 0x80) >> 7)
                                 + 1);
            ((void (*)(void))*MEMORY[0x24BEDE758])();
            v9 = (double)v8;
            if ((v7 & 1) != 0)
              goto LABEL_20;
            goto LABEL_19;
          }
          ((void (*)(void))*MEMORY[0x24BEDE758])();
        }
        v9 = *MEMORY[0x24BEDEF40];
LABEL_19:
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
        goto LABEL_20;
      }
    }
    v6 = (_DWORD *)exsltDateCurrent();
    if (!v6)
    {
      v9 = *MEMORY[0x24BEDEF40];
LABEL_20:
      v10 = xmlXPathNewFloat(v9);
      valuePush(ctxt, v10);
      return;
    }
    v5 = 0;
    v7 = 1;
    goto LABEL_14;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3470, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateDifferenceFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlChar *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  xmlChar *v7;
  uint64_t v8;
  unsigned int *v9;
  _DWORD *v10;
  _DWORD *v11;
  double *v12;
  void (**v13)(_DWORD *);
  void (**v14)(unsigned __int8 *);
  xmlXPathObject *v15;

  if (a2 == 2)
  {
    v3 = xmlXPathPopString(ctxt);
    if (ctxt->error)
      return;
    v4 = v3;
    v5 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v4);
      return;
    }
    v6 = v5;
    v7 = 0;
    if (!v4 || !v5)
      goto LABEL_20;
    v8 = exsltDateParse(v5);
    if (v8)
    {
      v9 = (unsigned int *)v8;
      v10 = (_DWORD *)exsltDateParse(v4);
      if (!v10)
      {
        v7 = 0;
        v11 = v9;
        goto LABEL_19;
      }
      v11 = v10;
      if ((*v9 & 0xFFFFFFF8) != 8 || (*v10 & 0xFFFFFFF8) != 8)
      {
        ((void (*)(unsigned int *))*MEMORY[0x24BEDE758])(v9);
        v7 = 0;
        goto LABEL_19;
      }
      v12 = _exsltDateDifference(v9, (uint64_t)v10, 0);
      v13 = (void (**)(_DWORD *))MEMORY[0x24BEDE758];
      ((void (*)(unsigned int *))*MEMORY[0x24BEDE758])(v9);
      (*v13)(v11);
      if (v12)
      {
        v7 = exsltDateFormatDuration((uint64_t)v12);
        v11 = v12;
LABEL_19:
        ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v11);
        goto LABEL_20;
      }
    }
    v7 = 0;
LABEL_20:
    v14 = (void (**)(unsigned __int8 *))MEMORY[0x24BEDE758];
    ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v4);
    (*v14)(v6);
    if (v7)
      v15 = xmlXPathWrapString(v7);
    else
      v15 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
    valuePush(ctxt, v15);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3703, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltDateDurationFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  xmlChar *v4;
  xmlChar *v5;
  double v6;
  char v7;
  double v8;
  double *Duration;
  double *v11;
  xmlChar *v12;
  xmlXPathObject *v13;

  if (a2 >= 2)
  {
    v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3741, 12);
    if (!ctxt)
      return;
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 != 1)
    goto LABEL_10;
  v4 = xmlXPathPopString(ctxt);
  if (ctxt->error)
  {
    v3 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3748, 11);
    goto LABEL_7;
  }
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x22077CD3C](v4);
    v7 = 0;
  }
  else
  {
LABEL_10:
    v6 = exsltDateSeconds(0);
    v5 = 0;
    v7 = 1;
  }
  if (!xmlXPathIsNaN(v6))
  {
    v8 = floor(v6 / 86400.0);
    if (v8 > -9.22337204e18 && v8 < 9.22337204e18)
    {
      Duration = (double *)exsltDateCreateDuration();
      if (Duration)
      {
        v11 = Duration;
        *((_QWORD *)Duration + 1) = (uint64_t)v8;
        Duration[2] = v6 + v8 * -86400.0;
        v12 = exsltDateFormatDuration((uint64_t)Duration);
        ((void (*)(double *))*MEMORY[0x24BEDE758])(v11);
        if ((v7 & 1) != 0)
          goto LABEL_22;
        goto LABEL_21;
      }
    }
  }
  v12 = 0;
  if ((v7 & 1) == 0)
LABEL_21:
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v5);
LABEL_22:
  if (v12)
    v13 = xmlXPathWrapString(v12);
  else
    v13 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
  valuePush(ctxt, v13);
}

void exsltDateHourInDayFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  _DWORD *v6;
  char v7;
  double v8;
  xmlXPathObject *v9;

  if (a2 < 2)
  {
    if (a2 != 1)
      goto LABEL_14;
    v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3563, 11);
      goto LABEL_7;
    }
    v5 = v4;
    if (v4)
    {
      v6 = (_DWORD *)exsltDateParse(v4);
      if (!v6)
      {
LABEL_13:
        v8 = *MEMORY[0x24BEDEF40];
        goto LABEL_17;
      }
      v7 = 0;
      if (*v6 != 1 && *v6 != 15)
      {
        ((void (*)(void))*MEMORY[0x24BEDE758])();
        goto LABEL_13;
      }
    }
    else
    {
LABEL_14:
      v6 = (_DWORD *)exsltDateCurrent();
      if (!v6)
      {
        v8 = *MEMORY[0x24BEDEF40];
        goto LABEL_19;
      }
      v5 = 0;
      v7 = 1;
    }
    v8 = (double)((v6[4] >> 9) & 0x1F);
    ((void (*)(void))*MEMORY[0x24BEDE758])();
    if ((v7 & 1) != 0)
    {
LABEL_19:
      v9 = xmlXPathNewFloat(v8);
      valuePush(ctxt, v9);
      return;
    }
LABEL_17:
    ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
    goto LABEL_19;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3563, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateLeapYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  _DWORD *v6;
  _DWORD *v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  xmlXPathObject *v14;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3303, 11);
        goto LABEL_7;
      }
      v5 = v4;
      if (v4)
      {
        v6 = (_DWORD *)exsltDateParse(v4);
        if (v6)
        {
          v7 = v6;
          if (*v6 <= 0xFu && ((1 << *v6) & 0xD100) != 0)
          {
            v9 = 0;
LABEL_17:
            v11 = *((_QWORD *)v7 + 1);
            v12 = 0x8F5C28F5C28F5C29 * v11 + 0x51EB851EB851EB8 > 0xA3D70A3D70A3D70
               || (*((_QWORD *)v7 + 1) & 0xFLL) == 0;
            v13 = (v11 & 3) == 0 && v12;
            v14 = xmlXPathNewBoolean(v13);
            ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v7);
            if ((v9 & 1) != 0)
              goto LABEL_29;
            goto LABEL_28;
          }
          ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v6);
        }
        v14 = xmlXPathNewFloat(*MEMORY[0x24BEDEF40]);
LABEL_28:
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
        goto LABEL_29;
      }
    }
    v10 = exsltDateCurrent();
    if (!v10)
    {
      v14 = xmlXPathNewFloat(*MEMORY[0x24BEDEF40]);
LABEL_29:
      valuePush(ctxt, v14);
      return;
    }
    v7 = (_DWORD *)v10;
    v5 = 0;
    v9 = 1;
    goto LABEL_17;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3296, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateMinuteInHourFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  _DWORD *v6;
  char v7;
  double v8;
  xmlXPathObject *v9;

  if (a2 < 2)
  {
    if (a2 != 1)
      goto LABEL_14;
    v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3572, 11);
      goto LABEL_7;
    }
    v5 = v4;
    if (v4)
    {
      v6 = (_DWORD *)exsltDateParse(v4);
      if (!v6)
      {
LABEL_13:
        v8 = *MEMORY[0x24BEDEF40];
        goto LABEL_17;
      }
      v7 = 0;
      if (*v6 != 1 && *v6 != 15)
      {
        ((void (*)(void))*MEMORY[0x24BEDE758])();
        goto LABEL_13;
      }
    }
    else
    {
LABEL_14:
      v6 = (_DWORD *)exsltDateCurrent();
      if (!v6)
      {
        v8 = *MEMORY[0x24BEDEF40];
        goto LABEL_19;
      }
      v5 = 0;
      v7 = 1;
    }
    v8 = (double)((v6[4] >> 14) & 0x3F);
    ((void (*)(void))*MEMORY[0x24BEDE758])();
    if ((v7 & 1) != 0)
    {
LABEL_19:
      v9 = xmlXPathNewFloat(v8);
      valuePush(ctxt, v9);
      return;
    }
LABEL_17:
    ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
    goto LABEL_19;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3572, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateMonthAbbreviationFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  xmlChar *v4;
  unsigned __int8 *v5;
  double v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  const xmlChar *v10;
  xmlChar *v11;
  xmlXPathObject *v12;

  if (a2 >= 2)
  {
    v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3404, 12);
    if (!ctxt)
      return;
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3411, 11);
      goto LABEL_7;
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = exsltDateMonthInYear(v5);
  if (xmlXPathIsNaN(v6))
    v7 = 1;
  else
    v7 = v6 < 1.0;
  LODWORD(v8) = (int)v6;
  v9 = v7 || v6 > 12.0;
  v8 = (int)v8;
  if (v9)
    v8 = 0;
  v10 = (const xmlChar *)&exsltDateMonthAbbreviation_monthAbbreviations + 4 * v8;
  if (v5)
    ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
  v11 = xmlStrdup(v10);
  v12 = xmlXPathWrapString(v11);
  valuePush(ctxt, v12);
}

void exsltDateMonthInYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  double v5;
  xmlXPathObject *v6;
  unsigned __int8 *v7;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3351, 11);
        goto LABEL_7;
      }
      v7 = v4;
      v5 = exsltDateMonthInYear(v4);
      if (v7)
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v7);
    }
    else
    {
      v5 = exsltDateMonthInYear(0);
    }
    v6 = xmlXPathNewFloat(v5);
    valuePush(ctxt, v6);
    return;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3351, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateMonthNameFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  xmlChar *v4;
  unsigned __int8 *v5;
  double v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  const xmlChar *v10;
  xmlChar *v11;
  xmlXPathObject *v12;

  if (a2 >= 2)
  {
    v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3367, 12);
    if (!ctxt)
      return;
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3374, 11);
      goto LABEL_7;
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = exsltDateMonthInYear(v5);
  if (xmlXPathIsNaN(v6))
    v7 = 1;
  else
    v7 = v6 < 1.0;
  v8 = v7 || v6 > 12.0;
  v9 = (int)v6;
  if (v8)
    v9 = 0;
  v10 = (const xmlChar *)&exsltDateMonthName_monthNames + 10 * v9;
  if (v5)
    ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
  v11 = xmlStrdup(v10);
  v12 = xmlXPathWrapString(v11);
  valuePush(ctxt, v12);
}

void exsltDateSecondInMinuteFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  xmlXPathObject *v9;

  if (a2 < 2)
  {
    if (a2 != 1)
      goto LABEL_13;
    v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3581, 11);
      goto LABEL_7;
    }
    v5 = v4;
    if (!v4)
    {
LABEL_13:
      v8 = exsltDateCurrent();
      if (v8)
      {
        v7 = *(double *)(v8 + 24);
        ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v8);
      }
      else
      {
        v7 = *MEMORY[0x24BEDEF40];
      }
      goto LABEL_19;
    }
    v6 = exsltDateParse(v4);
    if (v6)
    {
      if (*(_DWORD *)v6 == 1 || *(_DWORD *)v6 == 15)
      {
        v7 = *(double *)(v6 + 24);
        ((void (*)(void))*MEMORY[0x24BEDE758])();
LABEL_18:
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
LABEL_19:
        v9 = xmlXPathNewFloat(v7);
        valuePush(ctxt, v9);
        return;
      }
      ((void (*)(void))*MEMORY[0x24BEDE758])();
    }
    v7 = *MEMORY[0x24BEDEF40];
    goto LABEL_18;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3581, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateSecondsFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  int v3;
  unsigned __int8 *v4;
  double v5;
  xmlXPathObject *v6;
  unsigned __int8 *v7;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3604, 11);
        goto LABEL_7;
      }
      v7 = v4;
      v5 = exsltDateSeconds(v4);
      if (v7)
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v7);
    }
    else
    {
      v5 = exsltDateSeconds(0);
    }
    v6 = xmlXPathNewFloat(v5);
    valuePush(ctxt, v6);
    return;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3597, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateSumFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  xmlNode *user;
  xmlNodeSetPtr v5;
  xmlNodeSet *v6;
  _QWORD *Duration;
  uint64_t v8;
  void (**v9)(uint64_t);
  uint64_t v10;
  unsigned __int8 *v11;
  __n128 v12;
  unsigned __int8 *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  _BOOL4 v17;
  xmlChar *v18;
  xmlXPathObject *v19;
  xmlXPathObject *v20;

  if (a2 == 1)
  {
    value = ctxt->value;
    if (value && value->BOOLval)
    {
      user = (xmlNode *)value->user;
      value->BOOLval = 0;
      value->user = 0;
    }
    else
    {
      user = 0;
    }
    v5 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error)
      return;
    v6 = v5;
    if (!v5)
      goto LABEL_28;
    if (v5->nodeNr)
    {
      Duration = exsltDateCreateDuration();
      if (Duration)
      {
        v8 = (uint64_t)Duration;
        v9 = (void (**)(uint64_t))MEMORY[0x24BEDE758];
        if (v6->nodeNr < 1)
        {
LABEL_19:
          v18 = exsltDateFormatDuration(v8);
          (*v9)(v8);
          xmlXPathFreeNodeSet(v6);
          if (user)
            xmlFreeNodeList(user);
          if (v18)
          {
            v19 = xmlXPathWrapString(v18);
LABEL_29:
            valuePush(ctxt, v19);
            return;
          }
        }
        else
        {
          v10 = 0;
          while (1)
          {
            v11 = xmlXPathCastNodeToString(v6->nodeTab[v10]);
            if (!v11)
            {
              xmlXPathFreeNodeSet(v6);
              (*v9)(v8);
              return;
            }
            v13 = v11;
            v15 = exsltDateParseDuration(v11, v12);
            if (!v14)
              break;
            v16 = v14;
            v17 = _exsltDateAddDurCalc(v8, v8, v14);
            (*v9)(v16);
            (*v9)((uint64_t)v13);
            if (!v17)
              goto LABEL_27;
            if (++v10 >= v6->nodeNr)
              goto LABEL_19;
          }
          ((void (*)(unsigned __int8 *, double))*v9)(v13, v15);
LABEL_27:
          (*v9)(v8);
          xmlXPathFreeNodeSet(v6);
        }
LABEL_28:
        v19 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
        goto LABEL_29;
      }
    }
    else
    {
      v20 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
      valuePush(ctxt, v20);
    }
    xmlXPathFreeNodeSet(v6);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 2855, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltDateTimeFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  const char *v5;
  _DWORD *v6;
  uint64_t v7;
  char v8;
  xmlChar *v9;
  xmlXPathObject *v10;

  if (a2 >= 2)
  {
    v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3222, 12);
    if (!ctxt)
      return;
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 != 1)
    goto LABEL_14;
  v4 = xmlXPathPopString(ctxt);
  if (ctxt->error)
  {
    v3 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3228, 11);
    goto LABEL_7;
  }
  v5 = (const char *)v4;
  if (v4)
  {
    v6 = (_DWORD *)exsltDateParse(v4);
    if (!v6)
    {
LABEL_13:
      v8 = 0;
      goto LABEL_17;
    }
    v7 = (uint64_t)v6;
    v8 = 0;
    if (*v6 != 1 && *v6 != 15)
    {
      ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v6);
      goto LABEL_13;
    }
  }
  else
  {
LABEL_14:
    v7 = exsltDateCurrent();
    v5 = 0;
    v8 = 1;
    if (!v7)
      goto LABEL_17;
  }
  v9 = exsltDateFormatTime(v7);
  ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v7);
  if (v9)
  {
    v10 = xmlXPathWrapString(v9);
    goto LABEL_18;
  }
LABEL_17:
  ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0D0])(*MEMORY[0x24BEDF0D8], "{http://exslt.org/dates-and-times}time: invalid date or format %s\n", v5);
  v10 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
LABEL_18:
  valuePush(ctxt, v10);
  if ((v8 & 1) == 0)
    ((void (*)(const char *))*MEMORY[0x24BEDE758])(v5);
}

void exsltDateWeekInMonthFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  _DWORD *v6;
  _DWORD *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  xmlXPathObject *v19;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3443, 11);
        goto LABEL_7;
      }
      v5 = v4;
      if (v4)
      {
        v6 = (_DWORD *)exsltDateParse(v4);
        if (v6)
        {
          v7 = v6;
          if ((*v6 & 0xFFFFFFFE) == 0xE)
          {
            v8 = 0;
LABEL_14:
            v10 = *((_QWORD *)v7 + 1);
            if ((v10 & 3) == 0
              && (0x8F5C28F5C28F5C29 * v10 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
                ? (v11 = (*((_QWORD *)v7 + 1) & 0xFLL) == 0)
                : (v11 = 1),
                  v11))
            {
              v12 = &dayInLeapYearByMonth;
            }
            else
            {
              v12 = &dayInYearByMonth;
            }
            v13 = v7[4];
            v14 = _exsltDateDayInWeek(v12[(v7[4] & 0xF) - 1] + 1, v10);
            v15 = v14 + 6;
            if ((unint64_t)(v14 + 6) >= 7)
              v15 = v14 - 1;
            v16 = (unsigned __int128)((uint64_t)(((v13 >> 4) & 0x1F) + v15 - 1) * (__int128)0x4924924924924925) >> 64;
            v17 = (v16 >> 1) + ((unint64_t)v16 >> 63) + 1;
            ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v7);
            v18 = (double)v17;
            if ((v8 & 1) != 0)
              goto LABEL_30;
            goto LABEL_29;
          }
          ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v6);
        }
        v18 = *MEMORY[0x24BEDEF40];
LABEL_29:
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
        goto LABEL_30;
      }
    }
    v9 = exsltDateCurrent();
    if (!v9)
    {
      v18 = *MEMORY[0x24BEDEF40];
LABEL_30:
      v19 = xmlXPathNewFloat(v18);
      valuePush(ctxt, v19);
      return;
    }
    v7 = (_DWORD *)v9;
    v5 = 0;
    v8 = 1;
    goto LABEL_14;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3443, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateWeekInYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  _DWORD *v6;
  _DWORD *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  xmlXPathObject *v27;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3434, 11);
        goto LABEL_7;
      }
      v5 = v4;
      if (v4)
      {
        v6 = (_DWORD *)exsltDateParse(v4);
        if (v6)
        {
          v7 = v6;
          if ((*v6 & 0xFFFFFFFE) == 0xE)
          {
            v8 = 0;
            goto LABEL_14;
          }
          ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v6);
        }
        v18 = *MEMORY[0x24BEDEF40];
LABEL_55:
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
        goto LABEL_56;
      }
    }
    v9 = exsltDateCurrent();
    if (!v9)
    {
      v18 = *MEMORY[0x24BEDEF40];
LABEL_56:
      v27 = xmlXPathNewFloat(v18);
      valuePush(ctxt, v27);
      return;
    }
    v7 = (_DWORD *)v9;
    v5 = 0;
    v8 = 1;
LABEL_14:
    v10 = *((_QWORD *)v7 + 1);
    if ((v10 & 3) == 0
      && (0x8F5C28F5C28F5C29 * v10 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
        ? (v11 = (*((_QWORD *)v7 + 1) & 0xFLL) == 0)
        : (v11 = 1),
          v11))
    {
      v12 = &dayInLeapYearByMonth;
    }
    else
    {
      v12 = &dayInYearByMonth;
    }
    v13 = v12[(v7[4] & 0xF) - 1] + (((unint64_t)v7[4] >> 4) & 0x1F);
    v14 = _exsltDateDayInWeek(v13, *((_QWORD *)v7 + 1));
    v15 = v14 + 6;
    if ((unint64_t)(v14 + 6) >= 7)
      v15 = v14 - 1;
    v16 = v13 - v15 + 3;
    if (v16 <= 0)
    {
      v19 = v10 - 1;
      if (v10 == 1)
        v19 = -1;
      v20 = (v19 & 0xF) == 0 || 0x8F5C28F5C28F5C29 * v19 + 0x51EB851EB851EB8 > 0xA3D70A3D70A3D70;
      v21 = 365;
      if (v20)
        v21 = 366;
      v11 = (v19 & 3) == 0;
      v17 = 365;
      if (v11)
        v17 = v21;
    }
    else if ((v10 & 3) != 0)
    {
      if ((unint64_t)v16 <= 0x16D)
        goto LABEL_51;
      v17 = -365;
    }
    else
    {
      v22 = v10 % 25;
      v23 = 365;
      if ((v10 & 0xF) == 0)
        v23 = 366;
      if (v22)
        v23 = 366;
      if (v16 <= v23)
      {
LABEL_51:
        v25 = (unsigned __int128)((v16 - 1) * (__int128)0x4924924924924925) >> 64;
        v26 = (v25 >> 1) + ((unint64_t)v25 >> 63) + 1;
        ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v7);
        v18 = (double)v26;
        if ((v8 & 1) != 0)
          goto LABEL_56;
        goto LABEL_55;
      }
      if ((v10 & 0xF) != 0)
        v24 = -365;
      else
        v24 = -366;
      if (v22)
        v17 = -366;
      else
        v17 = v24;
    }
    v16 += v17;
    goto LABEL_51;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3434, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

void exsltDateYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  char v8;
  double v9;
  xmlXPathObject *v10;

  if (a2 < 2)
  {
    if (a2 == 1)
    {
      v4 = xmlXPathPopString(ctxt);
      if (ctxt->error)
      {
        v3 = 11;
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3269, 11);
        goto LABEL_7;
      }
      v5 = v4;
      if (v4)
      {
        v6 = exsltDateParse(v4);
        if (v6)
        {
          if (*(_DWORD *)v6 <= 0xFu && ((1 << *(_DWORD *)v6) & 0xD100) != 0)
          {
            v8 = 0;
LABEL_17:
            v9 = (double)(uint64_t)(*(_QWORD *)(v6 + 8) - (*(_QWORD *)(v6 + 8) < 1));
            ((void (*)(void))*MEMORY[0x24BEDE758])();
            if ((v8 & 1) != 0)
              goto LABEL_23;
            goto LABEL_22;
          }
          ((void (*)(void))*MEMORY[0x24BEDE758])();
        }
        v9 = *MEMORY[0x24BEDEF40];
LABEL_22:
        ((void (*)(unsigned __int8 *))*MEMORY[0x24BEDE758])(v5);
        goto LABEL_23;
      }
    }
    v6 = exsltDateCurrent();
    if (!v6)
    {
      v9 = *MEMORY[0x24BEDEF40];
LABEL_23:
      v10 = xmlXPathNewFloat(v9);
      valuePush(ctxt, v10);
      return;
    }
    v5 = 0;
    v8 = 1;
    goto LABEL_17;
  }
  v3 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3262, 12);
  if (ctxt)
LABEL_7:
    ctxt->error = v3;
}

int exsltDateXpathCtxtRegister(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  int result;

  if (!ctxt)
    return -1;
  if (!prefix)
    return -1;
  if (xmlXPathRegisterNs(ctxt, prefix, (const xmlChar *)"http://exslt.org/dates-and-times"))
    return -1;
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"add", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateAddFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"add-duration", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateAddDurationFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"date", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDateFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"date-time", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDateTimeFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-abbreviation", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayAbbreviationFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInMonthFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-in-week", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInWeekFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInYearFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-name", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayNameFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-of-week-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayOfWeekInMonthFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"difference", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDifferenceFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"duration", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDurationFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"hour-in-day", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateHourInDayFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"leap-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateLeapYearFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"minute-in-hour", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMinuteInHourFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"month-abbreviation", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthAbbreviationFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"month-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthInYearFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"month-name", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthNameFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"second-in-minute", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSecondInMinuteFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"seconds", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSecondsFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"sum", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSumFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"time", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateTimeFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"week-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateWeekInMonthFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"week-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateWeekInYearFunction))
  {
    return -1;
  }
  result = xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateYearFunction);
  if (result)
    return -1;
  return result;
}

uint64_t exsltDateParse(unsigned __int8 *a1)
{
  uint64_t Date;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  BOOL v7;
  BOOL v8;
  int v9;
  int v10;
  BOOL v11;
  BOOL v12;
  unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned __int8 *v17;
  int v18;
  unsigned int v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unsigned __int8 *v25;
  int v26;
  int v27;
  unint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  double v33;
  unsigned __int8 *v34;
  int v35;
  BOOL v37;
  unsigned int v38;
  unsigned __int8 *v40;

  v40 = a1;
  Date = exsltDateCreateDate(0);
  v3 = Date;
  if (Date)
  {
    v4 = *a1;
    if (v4 == 45)
    {
      if (a1[1] == 45)
      {
        v5 = a1[2];
        v40 = a1 + 2;
        if (v5 == 45)
        {
          v40 = a1 + 3;
          if (!_exsltDateParseGDay(Date, &v40))
          {
            v6 = *v40;
            v7 = (v6 - 43) > 0x2F || ((1 << (v6 - 43)) & 0x800000000005) == 0;
            v8 = !v7 || v6 == 0;
            if (v8 && !_exsltDateParseTimeZone(v3, &v40) && !*v40)
            {
              v9 = 2;
LABEL_101:
              *(_DWORD *)v3 = v9;
              return v3;
            }
          }
        }
        else if (!_exsltDateParseGMonth(Date, &v40))
        {
          v34 = v40;
          if (*v40 == 45)
          {
            ++v40;
            if (v34[1] == 45)
            {
              v40 = v34 + 2;
              v35 = v34[2];
              v37 = (v35 - 43) <= 0x2F && ((1 << (v35 - 43)) & 0x800000000005) != 0
                 || v35 == 0;
              if (v37 && !_exsltDateParseTimeZone(v3, &v40) && !*v40)
              {
                v9 = 4;
                goto LABEL_101;
              }
            }
            else if (!_exsltDateParseGDay(v3, &v40))
            {
              if ((v38 = *v40 - 43, v38 <= 0x2F) && ((1 << v38) & 0x800000000005) != 0 || !*v40)
              {
                if (!_exsltDateParseTimeZone(v3, &v40) && !*v40)
                {
                  v9 = 6;
                  goto LABEL_101;
                }
              }
            }
          }
        }
LABEL_110:
        ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v3);
        return 0;
      }
    }
    else
    {
      if ((v4 - 48) > 9)
        goto LABEL_29;
      if (!_exsltDateParseTime(Date, &v40))
      {
        v10 = *v40;
        v11 = (v10 - 43) > 0x2F || ((1 << (v10 - 43)) & 0x800000000005) == 0;
        v12 = !v11 || v10 == 0;
        if (v12 && !_exsltDateParseTimeZone(v3, &v40))
        {
          if (!*v40)
          {
            v9 = 1;
            goto LABEL_101;
          }
          goto LABEL_110;
        }
      }
    }
    v4 = *a1;
LABEL_29:
    v40 = a1;
    if ((v4 - 58) > 0xFFFFFFF5 || v4 == 45 || v4 == 43)
    {
      v13 = v4 == 45 ? a1 + 1 : a1;
      v14 = *v13;
      if ((v14 - 48) <= 9)
      {
        v15 = *(_QWORD *)(v3 + 8);
        v16 = -1;
        v17 = v13;
        while (v15 <= 0xCCCCCCCCCCCCCCBLL)
        {
          v15 = (v14 - 48) + 10 * v15;
          *(_QWORD *)(v3 + 8) = v15;
          v18 = *++v17;
          v14 = v18;
          ++v16;
          if ((v18 - 48) >= 0xA)
          {
            if (v16 < 3 || v16 != 3 && *v13 == 48 || !v15)
              goto LABEL_110;
            if (v4 == 45)
            {
              *(_QWORD *)(v3 + 8) = 1 - v15;
              v14 = *v17;
            }
            v40 = v17;
            if ((v14 - 43) > 0x2F || ((1 << (v14 - 43)) & 0x800000000005) == 0)
            {
              if (v14)
                goto LABEL_110;
            }
            if (_exsltDateParseTimeZone(v3, &v40))
            {
              if (*v40 != 45)
                goto LABEL_110;
              ++v40;
              if (_exsltDateParseGMonth(v3, &v40))
                goto LABEL_110;
              v19 = *v40 - 43;
              if (v19 > 0x2F || ((1 << v19) & 0x800000000005) == 0)
              {
                if (*v40)
                  goto LABEL_110;
              }
              if (_exsltDateParseTimeZone(v3, &v40))
              {
                if (*v40 != 45)
                  goto LABEL_110;
                ++v40;
                if (_exsltDateParseGDay(v3, &v40))
                  goto LABEL_110;
                v20 = *(unsigned int *)(v3 + 16);
                v21 = (*(_DWORD *)(v3 + 16) & 0xF) - 1;
                if (v21 > 0xB)
                  goto LABEL_110;
                v22 = *(_QWORD *)(v3 + 8);
                if ((v22 & 3) != 0
                  || 0x8F5C28F5C28F5C29 * v22 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70 && (v22 & 0xF) != 0)
                {
                  v23 = (v20 >> 4) & 0x1F;
                  v24 = &daysInMonth;
                }
                else
                {
                  v23 = (v20 >> 4) & 0x1F;
                  v24 = &daysInMonthLeap;
                }
                if (v24[v21] < v23)
                  goto LABEL_110;
                v25 = v40;
                v26 = *v40;
                if (((v26 - 43) > 0x2F || ((1 << (v26 - 43)) & 0x800000000005) == 0)
                  && *v40
                  || (v27 = _exsltDateParseTimeZone(v3, &v40), v25 = v40, v26 = *v40, v27))
                {
                  if (v26 == 84)
                  {
                    v40 = v25 + 1;
                    if (!_exsltDateParseTime(v3, &v40)
                      && !_exsltDateParseTimeZone(v3, &v40)
                      && !*v40)
                    {
                      v28 = *(unsigned int *)(v3 + 16);
                      v29 = (*(_DWORD *)(v3 + 16) & 0xF) - 1;
                      if (v29 <= 0xB)
                      {
                        v30 = *(_QWORD *)(v3 + 8);
                        if ((v30 & 3) != 0
                          || 0x8F5C28F5C28F5C29 * v30 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70 && (v30 & 0xF) != 0)
                        {
                          v31 = (v28 >> 4) & 0x1F;
                          v32 = &daysInMonth;
                        }
                        else
                        {
                          v31 = (v28 >> 4) & 0x1F;
                          v32 = &daysInMonthLeap;
                        }
                        if (v32[v29] >= v31 && (~(_DWORD)v28 & 0x3000) != 0 && (v28 & 0xF0000) != 0xF0000)
                        {
                          v33 = *(double *)(v3 + 24);
                          if (v33 >= 0.0
                            && v33 < 60.0
                            && (unsigned __int16)((unsigned __int16)(8 * *(_WORD *)(v3 + 32) + 23024) >> 4) <= 0xB3Eu)
                          {
                            v9 = 15;
                            goto LABEL_101;
                          }
                        }
                      }
                    }
                  }
                  goto LABEL_110;
                }
                if (*v40)
                  goto LABEL_110;
                v9 = 14;
              }
              else
              {
                if (*v40)
                  goto LABEL_110;
                v9 = 12;
              }
            }
            else
            {
              if (*v40)
                goto LABEL_110;
              v9 = 8;
            }
            goto LABEL_101;
          }
        }
      }
    }
    goto LABEL_110;
  }
  return v3;
}

double exsltDateParseDuration(unsigned __int8 *a1, __n128 a2)
{
  int v2;
  unsigned __int8 *v3;
  _BYTE *v4;
  int v5;
  uint64_t *Duration;
  __n128 v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  double v19;
  int v20;
  BOOL v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v2 = *a1;
  if (v2 == 45)
    v3 = a1 + 1;
  else
    v3 = a1;
  v5 = *v3;
  v4 = v3 + 1;
  if (v5 == 80)
  {
    if (*v4)
    {
      Duration = exsltDateCreateDuration();
      if (Duration)
      {
        v8 = *v4;
        if (*v4)
        {
          v9 = 0;
          v10 = 0;
          a2.n128_u64[0] = 0;
          v7.n128_u64[0] = 10.0;
          while (v10 <= 5)
          {
            if (v8 == 84)
            {
              if (v10 > 3)
                goto LABEL_57;
              v11 = *++v4;
              v8 = v11;
              v10 = 3u;
            }
            else if (v10 == 3)
            {
              goto LABEL_57;
            }
            if ((v8 - 48) <= 9)
            {
              v12 = 0;
              while (v12 <= 0xCCCCCCCCCCCCCCCLL)
              {
                v13 = (v8 - 48);
                v14 = 10 * v12;
                if (v14 > (v13 ^ 0x7FFFFFFFFFFFFFFFLL))
                  break;
                v12 = v13 + v14;
                v15 = *++v4;
                v8 = v15;
                if ((v15 - 48) >= 0xA)
                {
                  v16 = 1;
                  goto LABEL_21;
                }
              }
              goto LABEL_57;
            }
            v12 = 0;
            v16 = 0;
LABEL_21:
            if (v8 == 46)
            {
              v18 = *++v4;
              v17 = v18;
              if ((v18 - 48) <= 9)
              {
                v19 = 1.0;
                do
                {
                  v19 = v19 / 10.0;
                  a2.n128_f64[0] = a2.n128_f64[0] + (double)(v17 - 48) * v19;
                  v20 = *++v4;
                  v17 = v20;
                }
                while ((v20 - 48) < 0xA);
                v16 = 1;
              }
            }
            else
            {
              v17 = v8;
            }
            while (v17 != byte_21C4A1C20[v10])
            {
              if (v10 != 2)
              {
                v21 = v10++ == 5;
                if (!v21)
                  continue;
              }
              goto LABEL_57;
            }
            v21 = v8 != 46 || v10 == 5;
            v22 = !v21;
            if (!v16 || (v22 & 1) != 0)
              goto LABEL_57;
            switch(v10)
            {
              case 0u:
                if (v12 > 0xAAAAAAAAAAAAAAALL)
                  goto LABEL_57;
                v23 = 12 * v12;
                goto LABEL_45;
              case 1u:
                if (*Duration > (v12 ^ 0x7FFFFFFFFFFFFFFFLL))
                  goto LABEL_57;
                v23 = *Duration + v12;
LABEL_45:
                *Duration = v23;
                break;
              case 2u:
                Duration[1] = v12;
                break;
              case 3u:
                v24 = Duration[1];
                if (v24 > ((v12 / 24) ^ 0x7FFFFFFFFFFFFFFFLL))
                  goto LABEL_57;
                Duration[1] = v24 + v12 / 24;
                v9 = 3600 * (v12 % 24);
                break;
              case 4u:
                v25 = Duration[1];
                if (v25 > ((v12 / 1440) ^ 0x7FFFFFFFFFFFFFFFLL))
                  goto LABEL_57;
                Duration[1] = v25 + v12 / 1440;
                v9 += 60 * (v12 % 1440);
                break;
              case 5u:
                v26 = Duration[1];
                if (v26 > ((v12 / 86400) ^ 0x7FFFFFFFFFFFFFFFLL))
                  goto LABEL_57;
                Duration[1] = v26 + v12 / 86400;
                v9 += v12 % 86400;
                break;
              default:
                break;
            }
            ++v10;
            v27 = *++v4;
            v8 = v27;
            if (!v27)
              goto LABEL_56;
          }
          goto LABEL_57;
        }
        v9 = 0;
        a2.n128_u64[0] = 0;
LABEL_56:
        v28 = Duration[1];
        if (v28 > ((v9 / 86400) ^ 0x7FFFFFFFFFFFFFFFLL))
        {
LABEL_57:
          ((void (*)(__n128, __n128))*MEMORY[0x24BEDE758])(a2, v7);
          return a2.n128_f64[0];
        }
        v29 = v28 + v9 / 86400;
        Duration[1] = v29;
        a2.n128_f64[0] = a2.n128_f64[0] + (double)(v9 % 86400);
        Duration[2] = a2.n128_u64[0];
        if (v2 == 45)
        {
          *Duration = -*Duration;
          Duration[1] = -v29;
          if (a2.n128_f64[0] != 0.0)
          {
            a2.n128_f64[0] = 86400.0 - a2.n128_f64[0];
            Duration[2] = a2.n128_u64[0];
            Duration[1] = ~v29;
          }
        }
      }
    }
  }
  return a2.n128_f64[0];
}

uint64_t exsltDateCreateDate(int a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(40);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)(v2 + 32) = 0;
    *(_OWORD *)v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_DWORD *)(v2 + 16) = *(_DWORD *)(v2 + 16) & 0xFFFFFE00 | 0x11;
    if (a1)
      *(_DWORD *)v2 = a1;
  }
  else
  {
    ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltDateCreateDate: out of memory\n");
  }
  return v3;
}

uint64_t _exsltDateParseGDay(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t result;
  int v6;

  v2 = (uint64_t)*a2;
  v3 = **a2;
  if ((v3 - 58) < 0xFFFFFFF6)
    return 1;
  v4 = *(unsigned __int8 *)(v2 + 1);
  if ((v4 - 58) < 0xFFFFFFF6)
    return 1;
  v6 = v4 + 10 * v3;
  if ((v6 - 529) > 0x1E)
    return 2;
  result = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 16) & 0xFFFFFE0F | (16 * (((16 * v6 + 256) >> 4) & 0x1F));
  *a2 = (unsigned __int8 *)(v2 + 2);
  return result;
}

uint64_t _exsltDateParseTimeZone(uint64_t a1, unsigned __int8 **a2)
{
  unsigned __int8 *v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  int v12;
  int v13;
  unsigned int v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  if (!a2)
    return 0xFFFFFFFFLL;
  v2 = *a2;
  v3 = **a2;
  v4 = 1;
  if (v3 <= 0x2C)
  {
    if (!**a2)
    {
      *(_WORD *)(a1 + 32) &= 0xE000u;
      goto LABEL_14;
    }
    if (v3 != 43)
      return v4;
    goto LABEL_10;
  }
  if (v3 == 45)
  {
LABEL_10:
    v5 = v2[1];
    if ((v5 - 58) < 0xFFFFFFF6)
      return 1;
    v6 = v2[2];
    if ((v6 - 58) < 0xFFFFFFF6)
      return 1;
    v8 = v6 + 10 * v5;
    if (v8 > 0x227)
      return 2;
    if (v2[3] != 58)
      return 1;
    v9 = 120 * v8;
    v10 = (120 * v8 + 2176) & 0x1FF8;
    v11 = *(_WORD *)(a1 + 32) & 0xE001;
    *(_WORD *)(a1 + 32) = v11 | v10;
    v12 = v2[4];
    if ((v12 - 58) < 0xFFFFFFF6)
      return 1;
    v13 = v2[5];
    if ((v13 - 58) < 0xFFFFFFF6)
      return 1;
    v14 = v13 + 10 * v12;
    if (v14 > 0x24B)
      return 2;
    v15 = v9 + 2 * v14;
    v16 = v15 + 9312;
    v17 = -9312 - v15;
    v18 = v3 == 45 ? v17 : v16;
    *(_WORD *)(a1 + 32) = v18 & 0x1FFE | v11;
    if ((unsigned __int16)((unsigned __int16)(8 * v18 + 23024) >> 4) > 0xB3Eu)
      return 2;
    v2 += 6;
LABEL_14:
    v4 = 0;
    *a2 = v2;
    return v4;
  }
  if (v3 == 90)
  {
    *(_WORD *)(a1 + 32) = *(_WORD *)(a1 + 32) & 0xE000 | 1;
    ++v2;
    goto LABEL_14;
  }
  return v4;
}

uint64_t _exsltDateParseGMonth(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t result;
  int v6;

  v2 = (uint64_t)*a2;
  v3 = **a2;
  if ((v3 - 58) < 0xFFFFFFF6)
    return 1;
  v4 = *(unsigned __int8 *)(v2 + 1);
  if ((v4 - 58) < 0xFFFFFFF6)
    return 1;
  v6 = v4 + 10 * v3;
  if ((v6 - 529) > 0xB)
    return 2;
  result = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 16) & 0xFFFFFFF0 | v6 & 0xF;
  *a2 = (unsigned __int8 *)(v2 + 2);
  return result;
}

uint64_t _exsltDateParseTime(uint64_t a1, unsigned __int8 **a2)
{
  unsigned __int8 *v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  uint64_t v14;
  double v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  unsigned int v21;
  double v22;
  int v23;
  BOOL v24;

  v2 = *a2;
  v3 = **a2;
  if ((v3 - 58) < 0xFFFFFFF6)
    return 1;
  v4 = v2[1];
  if ((v4 - 58) < 0xFFFFFFF6)
    return 1;
  v5 = v4 + 10 * v3;
  if (v5 > 0x227)
    return 2;
  if (v2[2] != 58)
    return 1;
  v6 = (v5 << 9) + 0x2000;
  v7 = *(_DWORD *)(a1 + 16) & 0xFFFFC1FF | (((v6 >> 9) & 0x1F) << 9);
  *(_DWORD *)(a1 + 16) = v7;
  v8 = v2[3];
  if ((v8 - 58) < 0xFFFFFFF6)
    return 1;
  v9 = v2[4];
  if ((v9 - 58) < 0xFFFFFFF6)
    return 1;
  v10 = v9 + 10 * v8;
  if (v10 > 0x24B)
    return 2;
  v11 = (v10 << 14) + 786432;
  *(_DWORD *)(a1 + 16) = v7 & 0xFFF03FFF | (((v11 >> 14) & 0x3F) << 14);
  if (v2[5] != 58)
    return 1;
  v12 = v2[6];
  if ((v12 - 58) < 0xFFFFFFF6)
    return 1;
  v13 = v2[7];
  if ((v13 - 58) < 0xFFFFFFF6)
    return 1;
  v16 = (double)(v13 + 10 * v12 - 528);
  *(double *)(a1 + 24) = v16;
  v17 = v2 + 8;
  if (v2[8] == 46)
  {
    v20 = v2[9];
    v18 = v2 + 9;
    v19 = v20;
    v21 = v20 - 48;
    if ((v20 - 48) > 9)
      return 1;
    v22 = 1.0;
    v17 = v18;
    do
    {
      v22 = v22 / 10.0;
      v16 = v16 + (double)(v19 - 48) * v22;
      *(double *)(a1 + 24) = v16;
      v23 = *++v17;
      v19 = v23;
    }
    while ((v23 - 48) < 0xA);
    if (v21 > 9)
      return 1;
  }
  v14 = 2;
  if ((~v6 & 0x3000) != 0 && (v11 & 0xF0000) != 0xF0000)
  {
    v24 = v16 >= 0.0 && v16 < 60.0;
    if (v24 && (unsigned __int16)((unsigned __int16)(8 * *(_WORD *)(a1 + 32) + 23024) >> 4) <= 0xB3Eu)
    {
      v14 = 0;
      *a2 = v17;
      return v14;
    }
    return 2;
  }
  return v14;
}

_QWORD *exsltDateCreateDuration()
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = (_QWORD *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(24);
  v1 = v0;
  if (v0)
  {
    *v0 = 0;
    v0[1] = 0;
    v0[2] = 0;
  }
  else
  {
    ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltDateCreateDuration: out of memory\n");
  }
  return v1;
}

xmlChar *exsltDateFormatDateTime(uint64_t a1)
{
  unint64_t v1;
  unsigned int v2;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  _QWORD *v7;
  xmlChar *result;
  double v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  xmlChar *v19;
  unint64_t v20;
  BOOL v21;
  xmlChar v22;
  xmlChar *v23;
  xmlChar *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  xmlChar *v32;
  xmlChar v33;
  _BOOL4 v34;
  unsigned __int8 *v35;
  uint64_t v36;
  int v37;
  signed __int16 v38;
  char v39;
  unsigned int v40;
  char v41;
  xmlChar *v42;
  unsigned __int8 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  int v51;
  xmlChar cur[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v1 = *(unsigned int *)(a1 + 16);
  v2 = (*(_DWORD *)(a1 + 16) & 0xF) - 1;
  if (v2 > 0xB)
    return 0;
  v4 = *(_QWORD *)(a1 + 8);
  if ((v4 & 3) == 0
    && (0x8F5C28F5C28F5C29 * v4 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
      ? (v5 = (*(_QWORD *)(a1 + 8) & 0xFLL) == 0)
      : (v5 = 1),
        v5))
  {
    v6 = (v1 >> 4) & 0x1F;
    v7 = &daysInMonthLeap;
  }
  else
  {
    v6 = (v1 >> 4) & 0x1F;
    v7 = &daysInMonth;
  }
  if (v7[v2] < v6)
    return 0;
  result = 0;
  if ((~(_DWORD)v1 & 0x3000) != 0 && (v1 & 0xF0000) != 0xF0000)
  {
    v9 = *(double *)(a1 + 24);
    v10 = v9 >= 0.0 && v9 < 60.0;
    if (!v10 || (unsigned __int16)((unsigned __int16)(8 * *(_WORD *)(a1 + 32) + 23024) >> 4) > 0xB3Eu)
      return 0;
    v58 = 0;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    *(_OWORD *)cur = 0u;
    v53 = 0u;
    if (v4 <= 0)
    {
      cur[0] = 45;
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    v51 = 0;
    v12 = 1 - v4;
    if (v4 >= 1)
      v12 = v4;
    v49 = 0uLL;
    v50 = 0uLL;
    v47 = 0uLL;
    v48 = 0uLL;
    v45 = 0uLL;
    v46 = 0uLL;
    if ((uint64_t)v12 < 1)
    {
      v16 = (char *)&v45;
    }
    else
    {
      v13 = 0;
      do
      {
        v14 = v13 + 1;
        *((_BYTE *)&v45 + v13) = (v12 % 0xA) | 0x30;
        if (v12 < 0xA)
          break;
        v12 /= 0xAuLL;
        v15 = v13++ >= 0x62;
      }
      while (!v15);
      v16 = (char *)&v45 + v14;
    }
    v17 = v16 - (char *)&v45;
    if (v16 - (char *)&v45 <= 3)
    {
      memset(v16, 48, (char *)&v45 + 4 - v16);
      v16 = (char *)&v45 + 4;
    }
    if (v16 <= (char *)&v45)
    {
      v23 = (xmlChar *)((unint64_t)cur | v11);
    }
    else
    {
      v18 = 4;
      if (v17 > 4)
        v18 = v17;
      v19 = (xmlChar *)&v45 + v18 - 1;
      do
      {
        v20 = v11++;
        v21 = v19 > (xmlChar *)&v45;
        v22 = *v19--;
        cur[v20] = v22;
      }
      while (v21 && v20 < 0x62);
      if (v20 > 0x61)
      {
LABEL_46:
        if (v11 <= 98)
        {
          cur[v11] = ((v1 & 0xE) > 9) | 0x30;
          if (v11 == 98)
            goto LABEL_58;
          cur[v11 + 1] = ((v1 & 0xF) % 0xA) | 0x30;
          if (v11 > 96)
            goto LABEL_58;
          cur[v11 + 2] = 45;
          if (v11 == 96)
            goto LABEL_58;
          cur[v11 + 3] = ((unsigned __int16)(26 * ((v1 >> 4) & 0x1E)) >> 8) | 0x30;
          if (v11 > 94
            || (cur[v11 + 4] = (((v1 >> 4) & 0x1F)
                              - 10 * ((unsigned __int16)(26 * ((v1 >> 4) & 0x1F)) >> 8)) | 0x30,
                v11 == 94)
            || (cur[v11 + 5] = 84, v11 > 92)
            || (cur[v11 + 6] = ((unsigned __int16)(26 * ((v1 >> 9) & 0x1E)) >> 8) | 0x30, v11 == 92)
            || (cur[v11 + 7] = (((v1 >> 9) & 0x1F)
                              - 10 * ((unsigned __int16)(26 * ((v1 >> 9) & 0x1F)) >> 8)) | 0x30,
                v11 > 90)
            || (cur[v11 + 8] = 58, v11 == 90)
            || (cur[v11 + 9] = ((unsigned __int16)(26 * ((v1 >> 14) & 0x3E)) >> 8) | 0x30, v11 > 88)
            || (cur[v11 + 10] = (((v1 >> 14) & 0x3F)
                               - 10 * ((unsigned __int16)(26 * ((v1 >> 14) & 0x3F)) >> 8)) | 0x30,
                v11 == 88))
          {
LABEL_58:
            v11 = 99;
          }
          else
          {
            v44 = v11 + 12;
            cur[v11 + 11] = 58;
            if (v9 >= 10.0 || v11 > 86)
            {
              v11 += 12;
            }
            else
            {
              v11 += 13;
              cur[v44] = 48;
            }
          }
        }
        v24 = xmlXPathCastNumberToString(v9);
        v32 = &cur[v11];
        v33 = *v24;
        v34 = v11 < 99;
        if (*v24 && v11 <= 98)
        {
          v35 = v24 + 1;
          do
          {
            v36 = v11 + 1;
            cur[v11] = v33;
            v37 = *v35++;
            v33 = v37;
            v34 = (unint64_t)v11 < 0x62;
            if (!v37)
              break;
            v15 = (unint64_t)v11++ >= 0x62;
          }
          while (!v15);
          v32 = &cur[v36];
        }
        else
        {
          v36 = v11;
        }
        ((void (*)(xmlChar *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x24BEDE758])(v24, v25, v26, v27, v28, v29, v30, v31, v45, *((_QWORD *)&v45 + 1), v46, *((_QWORD *)&v46 + 1), v47);
        v38 = 8 * *(_WORD *)(a1 + 32);
        if ((unsigned __int16)v38 <= 0xFu)
        {
          if (!v34)
          {
LABEL_86:
            *v32 = 0;
            return xmlStrdup(cur);
          }
          v39 = 90;
LABEL_70:
          *v32++ = v39;
          goto LABEL_86;
        }
        if (v38 >= 0)
          v40 = v38 >> 4;
        else
          v40 = -(v38 >> 4);
        if (v34)
        {
          if ((*(_WORD *)(a1 + 32) & 0x1000) != 0)
            v41 = 45;
          else
            v41 = 43;
          *v32 = v41;
          if (v36 != 98)
          {
            cur[v36 + 1] = (v40 / 0x258 - 10 * ((429496730 * (unint64_t)(v40 / 0x258)) >> 32)) | 0x30;
            if (v36 <= 96)
            {
              cur[v36 + 2] = (v40 / 0x3C - 10 * ((429496730 * (unint64_t)(v40 / 0x3C)) >> 32)) | 0x30;
              if (v36 != 96)
              {
                v42 = &cur[v36];
                cur[v36 + 3] = 58;
                if (v36 < 95)
                {
                  v43 = v40 % 0x3C;
                  v42[4] = (v43 / 0xAu) | 0x30;
                  v32 = v42 + 5;
                  if (v36 == 94)
                    goto LABEL_86;
                  v39 = (v43 % 0xAu) | 0x30;
                  goto LABEL_70;
                }
              }
            }
          }
          v36 = 99;
        }
        v32 = &cur[v36];
        goto LABEL_86;
      }
      v23 = &cur[v11];
    }
    ++v11;
    *v23 = 45;
    goto LABEL_46;
  }
  return result;
}

xmlChar *exsltDateFormatDate(uint64_t a1)
{
  unint64_t v1;
  unsigned int v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  double v9;
  __int16 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  xmlChar *v20;
  unint64_t v21;
  BOOL v22;
  xmlChar v23;
  xmlChar *v24;
  xmlChar *v25;
  xmlChar *v26;
  __int16 v27;
  char v28;
  unsigned int v29;
  xmlChar v30;
  unsigned int v31;
  char v32;
  _OWORD v33[6];
  int v34;
  xmlChar cur[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v1 = *(unsigned int *)(a1 + 16);
  v2 = (*(_DWORD *)(a1 + 16) & 0xF) - 1;
  if (v2 > 0xB)
    return 0;
  v3 = *(_QWORD *)(a1 + 8);
  if ((v3 & 3) == 0
    && (0x8F5C28F5C28F5C29 * v3 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
      ? (v4 = (*(_QWORD *)(a1 + 8) & 0xFLL) == 0)
      : (v4 = 1),
        v4))
  {
    v5 = (v1 >> 4) & 0x1F;
    v6 = &daysInMonthLeap;
  }
  else
  {
    v5 = (v1 >> 4) & 0x1F;
    v6 = &daysInMonth;
  }
  if (v6[v2] < v5)
    return 0;
  v7 = 0;
  if ((~(_DWORD)v1 & 0x3000) != 0 && (v1 & 0xF0000) != 0xF0000)
  {
    v9 = *(double *)(a1 + 24);
    if (v9 < 0.0 || v9 >= 60.0)
      return 0;
    v11 = *(_WORD *)(a1 + 32);
    if ((unsigned __int16)((unsigned __int16)(8 * v11 + 23024) >> 4) > 0xB3Eu)
      return 0;
    v41 = 0;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    *(_OWORD *)cur = 0u;
    v36 = 0u;
    if (v3 <= 0)
    {
      cur[0] = 45;
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
    v34 = 0;
    v13 = 1 - v3;
    if (v3 >= 1)
      v13 = v3;
    memset(v33, 0, sizeof(v33));
    if ((uint64_t)v13 < 1)
    {
      v17 = (char *)v33;
    }
    else
    {
      v14 = 0;
      do
      {
        v15 = v14 + 1;
        *((_BYTE *)v33 + v14) = (v13 % 0xA) | 0x30;
        if (v13 < 0xA)
          break;
        v13 /= 0xAuLL;
      }
      while (v14++ < 0x62);
      v17 = (char *)v33 + v15;
    }
    v18 = v17 - (char *)v33;
    if (v17 - (char *)v33 <= 3)
    {
      memset(v17, 48, (char *)v33 + 4 - v17);
      v17 = (char *)v33 + 4;
    }
    if (v17 <= (char *)v33)
    {
      v24 = (xmlChar *)((unint64_t)cur | v12);
    }
    else
    {
      v19 = 4;
      if (v18 > 4)
        v19 = v18;
      v20 = (xmlChar *)v33 + v19 - 1;
      do
      {
        v21 = v12++;
        v22 = v20 > (xmlChar *)v33;
        v23 = *v20--;
        cur[v21] = v23;
      }
      while (v22 && v21 < 0x62);
      if (v21 > 0x61)
      {
LABEL_46:
        if (v12 <= 98)
        {
          cur[v12] = ((v1 & 0xE) > 9) | 0x30;
          if (v12 == 98
            || (cur[v12 + 1] = ((v1 & 0xF) % 0xA) | 0x30, v12 > 96)
            || (cur[v12 + 2] = 45, v12 == 96)
            || (cur[v12 + 3] = ((unsigned __int16)(26 * ((v1 >> 4) & 0x1E)) >> 8) | 0x30, v12 > 94))
          {
            v12 = 99;
          }
          else
          {
            v25 = &cur[v12];
            v12 += 5;
            v25[4] = (((v1 >> 4) & 0x1F)
                    - 10 * ((unsigned __int16)(26 * ((v1 >> 4) & 0x1F)) >> 8)) | 0x30;
          }
        }
        v26 = &cur[v12];
        if ((v11 & 0x1FFF) == 0)
          goto LABEL_72;
        v27 = 8 * v11;
        if ((unsigned __int16)(8 * v11) <= 0xFu)
        {
          if (v12 > 98)
          {
LABEL_72:
            *v26 = 0;
            return xmlStrdup(cur);
          }
          v28 = 90;
LABEL_57:
          *v26++ = v28;
          goto LABEL_72;
        }
        v29 = v27 >> 4;
        if (v27 < 0)
          v29 = -v29;
        if (v12 <= 98)
        {
          if ((v11 & 0x1000) != 0)
            v30 = 45;
          else
            v30 = 43;
          cur[v12] = v30;
          if (v12 != 98)
          {
            cur[v12 + 1] = (v29 / 0x258 - 10 * ((429496730 * (unint64_t)(v29 / 0x258)) >> 32)) | 0x30;
            if (v12 <= 96)
            {
              cur[v12 + 2] = (v29 / 0x3C - 10 * ((429496730 * (unint64_t)(v29 / 0x3C)) >> 32)) | 0x30;
              if (v12 != 96)
              {
                cur[v12 + 3] = 58;
                if (v12 < 95)
                {
                  v31 = v29 % 0x3C;
                  v32 = v29 % 0x3C / 0xA;
                  cur[v12 + 4] = v32 | 0x30;
                  v26 = &cur[v12 + 5];
                  if (v12 == 94)
                    goto LABEL_72;
                  v28 = (v31 - 10 * v32) | 0x30;
                  goto LABEL_57;
                }
              }
            }
          }
          v12 = 99;
        }
        v26 = &cur[v12];
        goto LABEL_72;
      }
      v24 = &cur[v12];
    }
    ++v12;
    *v24 = 45;
    goto LABEL_46;
  }
  return (xmlChar *)v7;
}

xmlChar *exsltDateFormatTime(uint64_t a1)
{
  unsigned int v1;
  unsigned int v2;
  double v5;
  BOOL v6;
  unsigned int v7;
  unint64_t v8;
  xmlChar *v10;
  xmlChar v11;
  unsigned __int8 *v12;
  unint64_t v13;
  int v14;
  _BOOL4 v15;
  xmlChar *v17;
  __int16 v18;
  __int16 v19;
  char v20;
  unsigned int v21;
  char v22;
  xmlChar *v23;
  unsigned int v24;
  xmlChar cur[6];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[30];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 16);
  v2 = (v1 >> 9) & 0x1F;
  if ((~v1 & 0xF0000) != 0 && v2 <= 0x17)
  {
    v5 = *(double *)(a1 + 24);
    v6 = v5 >= 0.0 && v5 < 60.0;
    if (v6 && (unsigned __int16)((unsigned __int16)(8 * *(_WORD *)(a1 + 32) + 23024) >> 4) <= 0xB3Eu)
    {
      v29 = 0u;
      memset(v30, 0, sizeof(v30));
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      v7 = (205 * v2) >> 11;
      cur[0] = v7 | 0x30;
      cur[1] = (v2 - 10 * v7) | 0x30;
      cur[2] = 58;
      cur[3] = ((unsigned __int16)(26 * ((v1 >> 14) & 0x3E)) >> 8) | 0x30;
      cur[4] = (((v1 >> 14) & 0x3F) - 10 * ((unsigned __int16)(26 * ((v1 >> 14) & 0x3F)) >> 8)) | 0x30;
      cur[5] = 58;
      if (v5 >= 10.0)
      {
        v8 = 6;
      }
      else
      {
        LOBYTE(v26) = 48;
        v8 = 7;
      }
      v10 = xmlXPathCastNumberToString(v5);
      v11 = *v10;
      if (*v10)
      {
        v12 = v10 + 1;
        v13 = v8;
        do
        {
          v8 = v13 + 1;
          cur[v13] = v11;
          v14 = *v12++;
          v11 = v14;
          v15 = v13 < 0x62;
          if (!v14)
            break;
        }
        while (v13++ < 0x62);
        v17 = &cur[v8];
      }
      else
      {
        v17 = &cur[v8];
        v15 = 1;
      }
      ((void (*)(void))*MEMORY[0x24BEDE758])();
      v18 = *(_WORD *)(a1 + 32);
      if ((v18 & 0x1FFF) == 0)
        goto LABEL_42;
      v19 = 8 * v18;
      if ((unsigned __int16)(8 * v18) > 0xFu)
      {
        if (v19 >= 0)
          v21 = v19 >> 4;
        else
          v21 = -(v19 >> 4);
        if (!v15
          || ((*(_WORD *)(a1 + 32) & 0x1000) != 0 ? (v22 = 45) : (v22 = 43),
              (*v17 = v22, v8 == 98)
           || (cur[v8 + 1] = (v21 / 0x258 - 10 * ((429496730 * (unint64_t)(v21 / 0x258)) >> 32)) | 0x30, v8 > 0x60)
           || (cur[v8 + 2] = (v21 / 0x3C - 10 * ((429496730 * (unint64_t)(v21 / 0x3C)) >> 32)) | 0x30, v8 == 96)
           || (v23 = &cur[v8], cur[v8 + 3] = 58, v8 >= 0x5F)))
        {
          v17 = &v30[29];
          goto LABEL_42;
        }
        v24 = v21 % 0x3C;
        v23[4] = (v24 / 0xAu) | 0x30;
        v17 = v23 + 5;
        if (v8 != 94)
        {
          v20 = (v24 % 0xAu) | 0x30;
          goto LABEL_27;
        }
      }
      else if (v15)
      {
        v20 = 90;
LABEL_27:
        *v17++ = v20;
      }
LABEL_42:
      *v17 = 0;
      return xmlStrdup(cur);
    }
  }
  return 0;
}

xmlChar *exsltDateFormatDuration(uint64_t a1)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  double v5;
  int v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  BOOL v11;
  int v12;
  double v13;
  BOOL v14;
  xmlChar *p_cur;
  unint64_t v16;
  xmlChar *v18;
  _BYTE *v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  xmlChar *v24;
  _BYTE *v25;
  xmlChar v26;
  _BOOL4 v27;
  unsigned __int8 *v28;
  unint64_t v29;
  int v30;
  BOOL v31;
  xmlChar *v32;
  _BYTE *v33;
  xmlChar v34;
  _BOOL4 v35;
  unsigned __int8 *v36;
  unint64_t v37;
  int v38;
  double v39;
  xmlChar *v40;
  _BYTE *v41;
  xmlChar v42;
  _BOOL4 v43;
  unsigned __int8 *v44;
  unint64_t v45;
  int v46;
  double v47;
  xmlChar *v48;
  _BYTE *v49;
  xmlChar v50;
  _BOOL4 v51;
  unsigned __int8 *v52;
  unint64_t v53;
  int v54;
  _BYTE *v55;
  xmlChar *v56;
  xmlChar v57;
  _BOOL4 v58;
  unsigned __int8 *v59;
  unint64_t v60;
  int v61;
  xmlChar cur;
  _BYTE v63[99];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v1 = *(double *)(a1 + 16);
  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  if (v1 == 0.0 && v3 == 0)
  {
    if (!v2)
      return xmlStrdup((const xmlChar *)"P0D");
    v6 = 0;
    v5 = 0.0;
  }
  else
  {
    v5 = (double)v3;
    if (v3 < 0)
    {
      if (v1 == 0.0)
      {
        v7 = (double)v3;
      }
      else
      {
        v1 = 86400.0 - v1;
        v7 = v5 + 1.0;
      }
      v5 = -v7;
      v6 = 45;
    }
    else
    {
      v6 = 0;
    }
  }
  v8 = (double)(v2 / 12);
  v9 = v2 % 12;
  v10 = (double)(v2 % 12);
  memset(v63, 0, sizeof(v63));
  if (v2 >= -11)
  {
    v11 = v9 < 0;
  }
  else
  {
    v8 = -v8;
    v11 = 1;
  }
  if (v11)
    v12 = 45;
  else
    v12 = v6;
  if (v9 >= 0)
    v13 = v10;
  else
    v13 = -v10;
  cur = v12;
  v14 = v12 == 45;
  if (v12 == 45)
    p_cur = v63;
  else
    p_cur = &cur;
  if (v14)
    v16 = 2;
  else
    v16 = 1;
  *p_cur = 80;
  if (v8 != 0.0 && v8 >= 1.0)
  {
    v18 = xmlXPathCastNumberToString(floor(v8));
    v19 = &v63[v16 - 1];
    LOBYTE(v20) = *v18;
    if (*v18)
    {
      v21 = 0;
      do
      {
        v22 = v16 + v21;
        v19[v21] = v20;
        v20 = v18[++v21];
      }
      while (v20 && v22 < 0x62);
      ((void (*)(void))*MEMORY[0x24BEDE758])();
      if (v22 > 0x61)
      {
        v16 = 99;
        goto LABEL_42;
      }
      v16 += v21;
      v19 += v21;
    }
    else
    {
      ((void (*)(void))*MEMORY[0x24BEDE758])();
    }
    ++v16;
    *v19 = 89;
  }
LABEL_42:
  if (v13 != 0.0 && v13 >= 1.0)
  {
    v24 = xmlXPathCastNumberToString(floor(v13));
    v25 = &v63[v16 - 1];
    v26 = *v24;
    v27 = v16 < 0x63;
    if (*v24 && v16 <= 0x62)
    {
      v28 = v24 + 1;
      do
      {
        v29 = v16 + 1;
        v63[v16 - 1] = v26;
        v30 = *v28++;
        v26 = v30;
        v27 = v16 < 0x62;
        if (!v30)
          break;
        v31 = v16++ >= 0x62;
      }
      while (!v31);
      v25 = &v63[v29 - 1];
    }
    else
    {
      v29 = v16;
    }
    ((void (*)(void))*MEMORY[0x24BEDE758])();
    if (v27)
    {
      v16 = v29 + 1;
      *v25 = 77;
    }
    else
    {
      v16 = 99;
    }
  }
  if (v5 < 1.0)
    goto LABEL_66;
  v32 = xmlXPathCastNumberToString(floor(v5));
  v33 = &v63[v16 - 1];
  v34 = *v32;
  v35 = v16 < 0x63;
  if (*v32 && v16 <= 0x62)
  {
    v36 = v32 + 1;
    do
    {
      v37 = v16 + 1;
      v63[v16 - 1] = v34;
      v38 = *v36++;
      v34 = v38;
      v35 = v16 < 0x62;
      if (!v38)
        break;
      v31 = v16++ >= 0x62;
    }
    while (!v31);
    v33 = &v63[v37 - 1];
  }
  else
  {
    v37 = v16;
  }
  ((void (*)(void))*MEMORY[0x24BEDE758])();
  if (v35)
  {
    v16 = v37 + 1;
    *v33 = 68;
LABEL_66:
    if (v1 > 0.0 && v16 <= 0x62)
      v63[v16++ - 1] = 84;
    goto LABEL_70;
  }
  v16 = 99;
LABEL_70:
  if (v1 >= 3600.0)
  {
    v39 = floor(v1 / 3600.0);
    v40 = xmlXPathCastNumberToString(v39);
    v41 = &v63[v16 - 1];
    v42 = *v40;
    v43 = v16 < 0x63;
    if (*v40 && v16 <= 0x62)
    {
      v44 = v40 + 1;
      do
      {
        v45 = v16 + 1;
        v63[v16 - 1] = v42;
        v46 = *v44++;
        v42 = v46;
        v43 = v16 < 0x62;
        if (!v46)
          break;
        v31 = v16++ >= 0x62;
      }
      while (!v31);
      v41 = &v63[v45 - 1];
    }
    else
    {
      v45 = v16;
    }
    ((void (*)(void))*MEMORY[0x24BEDE758])();
    if (v43)
    {
      v16 = v45 + 1;
      *v41 = 72;
    }
    else
    {
      v16 = 99;
    }
    v1 = v1 + v39 * -3600.0;
  }
  if (v1 >= 60.0)
  {
    v47 = floor(v1 / 60.0);
    v48 = xmlXPathCastNumberToString(v47);
    v49 = &v63[v16 - 1];
    v50 = *v48;
    v51 = v16 < 0x63;
    if (*v48 && v16 <= 0x62)
    {
      v52 = v48 + 1;
      do
      {
        v53 = v16 + 1;
        v63[v16 - 1] = v50;
        v54 = *v52++;
        v50 = v54;
        v51 = v16 < 0x62;
        if (!v54)
          break;
        v31 = v16++ >= 0x62;
      }
      while (!v31);
      v49 = &v63[v53 - 1];
    }
    else
    {
      v53 = v16;
    }
    ((void (*)(void))*MEMORY[0x24BEDE758])();
    if (v51)
    {
      v16 = v53 + 1;
      *v49 = 77;
    }
    else
    {
      v16 = 99;
    }
    v1 = v1 + v47 * -60.0;
  }
  v55 = &v63[v16 - 1];
  if (v1 > 0.0)
  {
    v56 = xmlXPathCastNumberToString(v1);
    v57 = *v56;
    v58 = v16 < 0x63;
    if (*v56 && v16 <= 0x62)
    {
      v59 = v56 + 1;
      do
      {
        v60 = v16 + 1;
        v63[v16 - 1] = v57;
        v61 = *v59++;
        v57 = v61;
        v58 = v16 < 0x62;
        if (!v61)
          break;
        v31 = v16++ >= 0x62;
      }
      while (!v31);
      v55 = &v63[v60 - 1];
    }
    ((void (*)(void))*MEMORY[0x24BEDE758])();
    if (v58)
      *v55++ = 83;
  }
  *v55 = 0;
  return xmlStrdup(&cur);
}

BOOL _exsltDateAddDurCalc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v3 = *(_QWORD *)a2;
  if (*(uint64_t *)a2 < 1)
  {
    v4 = *(_QWORD *)a3;
    if (v3)
      v5 = v4 <= (uint64_t)(0x8000000000000000 - v3);
    else
      v5 = 0;
    if (v5)
      return 0;
  }
  else
  {
    v4 = *(_QWORD *)a3;
    if (*(_QWORD *)a3 > (v3 ^ 0x7FFFFFFFFFFFFFFFLL))
      return 0;
  }
  v6 = v4 + v3;
  *(_QWORD *)a1 = v6;
  v7 = *(_QWORD *)(a2 + 8);
  if (v7 < 1)
  {
    v8 = *(_QWORD *)(a3 + 8);
    if (v7 && v8 <= (uint64_t)(0x8000000000000000 - v7))
      return 0;
  }
  else
  {
    v8 = *(_QWORD *)(a3 + 8);
    if (v8 > (v7 ^ 0x7FFFFFFFFFFFFFFFLL))
      return 0;
  }
  v9 = v8 + v7;
  *(_QWORD *)(a1 + 8) = v9;
  v10 = *(double *)(a2 + 16) + *(double *)(a3 + 16);
  *(double *)(a1 + 16) = v10;
  if (v10 >= 86400.0)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    v10 = v10 + -86400.0;
    *(double *)(a1 + 16) = v10;
    *(_QWORD *)(a1 + 8) = ++v9;
  }
  if ((v9 & 0x8000000000000000) == 0)
    return !v9 && v10 <= 0.0 || (v6 & 0x8000000000000000) == 0;
  return v6 <= 0;
}

uint64_t exsltDateCurrent()
{
  uint64_t Date;
  char *v1;
  const char *v2;
  int tm_sec;
  int v4;
  int v5;
  int v7;
  time_t v8;
  tm v9;
  tm v10;

  Date = exsltDateCreateDate(15);
  if (Date)
  {
    memset(&v10, 0, sizeof(v10));
    memset(&v9, 0, sizeof(v9));
    v8 = 0;
    v1 = getenv("SOURCE_DATE_EPOCH");
    if (!v1 || (v2 = v1, *__error() = 0, v8 = strtol(v2, 0, 10), *__error()) || !gmtime_r(&v8, &v10))
    {
      v8 = time(0);
      localtime_r(&v8, &v10);
    }
    *(_QWORD *)(Date + 8) = v10.tm_year + 1900;
    tm_sec = v10.tm_sec;
    *(_DWORD *)(Date + 16) = *(_DWORD *)(Date + 16) & 0xFFF00000 | (LOBYTE(v10.tm_mon) + 1) & 0xF | (16 * (v10.tm_mday & 0x1F)) & 0x1FF | ((v10.tm_hour & 0x1F) << 9) & 0x3FFF | ((v10.tm_min & 0x3F) << 14);
    *(double *)(Date + 24) = (double)tm_sec;
    gmtime_r(&v8, &v9);
    v4 = 3600 * v10.tm_hour + 60 * v10.tm_min + v10.tm_sec;
    if (v10.tm_year < v9.tm_year)
      goto LABEL_8;
    if (v10.tm_year <= v9.tm_year)
    {
      if (v10.tm_mon < v9.tm_mon)
      {
LABEL_8:
        v5 = v4 - 86400;
LABEL_13:
        *(_WORD *)(Date + 32) = *(_WORD *)(Date + 32) & 0xE000 | (2
                                                                * (((v5
                                                                   - (3600 * v9.tm_hour
                                                                    + 60 * v9.tm_min
                                                                    + v9.tm_sec))
                                                                  / 60) & 0xFFF));
        return Date;
      }
      if (v10.tm_mon <= v9.tm_mon)
      {
        v7 = v4 + 86400;
        if (v10.tm_mday <= v9.tm_mday)
          v7 = 3600 * v10.tm_hour + 60 * v10.tm_min + v10.tm_sec;
        v5 = v4 - 86400;
        if (v10.tm_mday >= v9.tm_mday)
          v5 = v7;
        goto LABEL_13;
      }
    }
    v5 = v4 + 86400;
    goto LABEL_13;
  }
  return Date;
}

double exsltDateDayInWeek(unsigned __int8 *a1)
{
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _QWORD *v5;
  uint64_t v7;

  if (a1)
  {
    v1 = (_DWORD *)exsltDateParse(a1);
    if (!v1)
      return *MEMORY[0x24BEDEF40];
    v2 = (uint64_t)v1;
    if ((*v1 & 0xFFFFFFFE) != 0xE)
    {
      ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v1);
      return *MEMORY[0x24BEDEF40];
    }
  }
  else
  {
    v2 = exsltDateCurrent();
    if (!v2)
      return *MEMORY[0x24BEDEF40];
  }
  v3 = *(_QWORD *)(v2 + 8);
  if ((v3 & 3) == 0
    && (0x8F5C28F5C28F5C29 * v3 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
      ? (v4 = (*(_QWORD *)(v2 + 8) & 0xFLL) == 0)
      : (v4 = 1),
        v4))
  {
    v5 = &dayInLeapYearByMonth;
  }
  else
  {
    v5 = &dayInYearByMonth;
  }
  v7 = _exsltDateDayInWeek(v5[(*(_DWORD *)(v2 + 16) & 0xF) - 1] + (((unint64_t)*(unsigned int *)(v2 + 16) >> 4) & 0x1F), v3)+ 1;
  ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v2);
  return (double)v7;
}

uint64_t _exsltDateDayInWeek(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = ((unint64_t)-a2 * (unsigned __int128)0x2492492492492493uLL) >> 64;
  v3 = (uint64_t)(a1
               - (-a2 / 0x190uLL
                + ((unint64_t)-a2 >> 2))
               - (-7 * ((v2 + ((unint64_t)(-a2 - v2) >> 1)) >> 2)
                - a2)
               + -a2 / 0x64uLL
               - 2)
     % 7;
  v4 = v3 + (v3 < 0 ? 7uLL : 0);
  if (a2 <= 0)
    return v4;
  else
    return (uint64_t)(~((a2 - 1) / 0x64uLL)
                   + a1
                   + a2
                   - 7 * (a2 / 7uLL)
                   + ((unint64_t)(a2 - 1) >> 2)
                   + (a2 - 1) / 0x190uLL)
         % 7;
}

double *_exsltDateDifference(unsigned int *a1, uint64_t a2, int a3)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v7;
  double *Duration;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *a1;
  if ((*a1 & 0xFFFFFFF8) != 8)
    return 0;
  v5 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 0xFFFFFFF8) != 8)
    return 0;
  v7 = (uint64_t)a1;
  if (v4 != v5)
  {
    if (v4 >= v5)
      v4 = *(_DWORD *)a2;
    else
      a1 = (unsigned int *)a2;
    _exsltDateTruncateDate((uint64_t)a1, v4);
  }
  Duration = (double *)exsltDateCreateDuration();
  v9 = Duration;
  if (Duration)
  {
    if (*(_DWORD *)v7 == 8)
    {
      if (!a3)
        goto LABEL_14;
    }
    else if (!a3 && *(_DWORD *)v7 == 12)
    {
LABEL_14:
      v10 = *(_QWORD *)(v7 + 8);
      if ((unint64_t)(v10 - 0x555555555555555) >= 0xF555555555555557)
      {
        v11 = *(_QWORD *)(a2 + 8);
        if ((unint64_t)(v11 - 0x555555555555555) >= 0xF555555555555557)
        {
          *(_QWORD *)Duration = (*(_DWORD *)(a2 + 16) & 0xF)
                              - (unint64_t)(*(_DWORD *)(v7 + 16) & 0xF)
                              + 12 * (v11 - v10);
          return v9;
        }
      }
      goto LABEL_19;
    }
    if ((unint64_t)(*(_QWORD *)(v7 + 8) - 0x2CD38620EB5681) >= 0xFFA658F3BE2952FFLL
      && (unint64_t)(*(_QWORD *)(a2 + 8) - 0x2CD38620EB5681) >= 0xFFA658F3BE2952FFLL)
    {
      v13 = *(double *)(a2 + 24)
          + (double)(60 * ((*(_DWORD *)(a2 + 16) >> 14) & 0x3F) + 3600 * ((*(_DWORD *)(a2 + 16) >> 9) & 0x1F))
          - (*(double *)(v7 + 24)
           + (double)(60 * ((*(_DWORD *)(v7 + 16) >> 14) & 0x3F) + 3600 * ((*(_DWORD *)(v7 + 16) >> 9) & 0x1F)));
      Duration[2] = v13;
      v14 = v13
          + (double)(60 * ((*(unsigned __int16 *)(v7 + 32) << 19 >> 20) - ((__int16)(8 * *(_WORD *)(a2 + 32)) >> 4)));
      v15 = vcvtmd_s64_f64(v14 / 86400.0);
      Duration[2] = v14 - (double)(uint64_t)(86400 * v15);
      v16 = _exsltDateCastYMToDays(a2);
      v17 = _exsltDateCastYMToDays(v7);
      *((_QWORD *)v9 + 1) = v16 - v17;
      *((_QWORD *)v9 + 1) = v16
                          - v17
                          + ((*(_DWORD *)(a2 + 16) >> 4) & 0x1F)
                          - ((*(_DWORD *)(v7 + 16) >> 4) & 0x1F)
                          + v15;
      return v9;
    }
LABEL_19:
    ((void (*)(double *))*MEMORY[0x24BEDE758])(Duration);
    return 0;
  }
  return v9;
}

uint64_t _exsltDateTruncateDate(uint64_t result, int a2)
{
  if ((a2 & 1) != 0)
  {
    if ((a2 & 2) != 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(result + 16) = *(_DWORD *)(result + 16) & 0xFFFFFE0F | 0x10;
    if ((a2 & 4) != 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(result + 16) &= 0xFFF001FF;
  *(_QWORD *)(result + 24) = 0;
  if ((a2 & 2) == 0)
    goto LABEL_7;
LABEL_3:
  if ((a2 & 4) == 0)
LABEL_4:
    *(_DWORD *)(result + 16) = *(_DWORD *)(result + 16) & 0xFFFFFFF0 | 1;
LABEL_5:
  *(_DWORD *)result = a2;
  return result;
}

uint64_t _exsltDateCastYMToDays(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  BOOL v3;
  _QWORD *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 <= 0)
  {
    v6 = 365 * v1;
    v7 = (unint64_t)-v1 >> 2;
    v8 = -v1 / 0x64uLL;
    v9 = -v1 / 0x190uLL;
    if ((v1 & 3) == 0
      && ((unint64_t)(0x70A3D70A3D70A3D7 * v1) <= 0xA3D70A3D70A3D70
        ? (v10 = (*(_QWORD *)(a1 + 8) & 0xFLL) == 0)
        : (v10 = 1),
          v10))
    {
      v11 = &dayInLeapYearByMonth;
    }
    else
    {
      v11 = &dayInYearByMonth;
    }
    return v6 - v7 - v9 + v8 + v11[(*(_DWORD *)(a1 + 16) & 0xF) - 1] - 366;
  }
  else
  {
    v2 = (v1 - 1) / 0x190uLL - (v1 - 1) / 0x64uLL + ((unint64_t)(v1 - 1) >> 2) + 365 * (v1 - 1);
    if ((v1 & 3) == 0
      && (0x8F5C28F5C28F5C29 * v1 <= 0xA3D70A3D70A3D70 ? (v3 = (*(_QWORD *)(a1 + 8) & 0xFLL) == 0) : (v3 = 1), v3))
    {
      v4 = &dayInLeapYearByMonth;
    }
    else
    {
      v4 = &dayInYearByMonth;
    }
    return v2 + v4[(*(_DWORD *)(a1 + 16) & 0xF) - 1];
  }
}

double exsltDateSeconds(unsigned __int8 *a1)
{
  double *v1;
  double v2;
  _DWORD *v4;
  __n128 v5;
  uint64_t v6;
  __n128 v7;
  uint64_t Date;
  uint64_t v9;
  double *v10;

  v1 = (double *)MEMORY[0x24BEDEF40];
  v2 = *MEMORY[0x24BEDEF40];
  if (a1)
  {
    v4 = (_DWORD *)exsltDateParse(a1);
    if (!v4)
    {
      v7.n128_f64[0] = exsltDateParseDuration(a1, v5);
      if (v6)
      {
        if (!*(_QWORD *)v6)
        {
          v7.n128_f64[0] = (double)*(uint64_t *)(v6 + 8);
          v2 = *(double *)(v6 + 16) + v7.n128_f64[0] * 86400.0;
        }
        ((void (*)(uint64_t, __n128))*MEMORY[0x24BEDE758])(v6, v7);
      }
      return v2;
    }
  }
  else
  {
    v4 = (_DWORD *)exsltDateCurrent();
    if (!v4)
      return *v1;
  }
  if (*v4 >= 8u)
  {
    Date = exsltDateCreateDate(15);
    if (Date)
    {
      v9 = Date;
      *(_QWORD *)(Date + 8) = 1970;
      *(_DWORD *)(Date + 16) = *(_DWORD *)(Date + 16) & 0xFFFFFE00 | 0x11;
      *(_WORD *)(Date + 32) |= 1u;
      v10 = _exsltDateDifference((unsigned int *)Date, (uint64_t)v4, 1);
      if (v10)
      {
        v2 = v10[2] + (double)*((uint64_t *)v10 + 1) * 86400.0;
        ((void (*)(void))*MEMORY[0x24BEDE758])();
      }
      ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v9);
    }
  }
  ((void (*)(_DWORD *, __n128))*MEMORY[0x24BEDE758])(v4, v5);
  return v2;
}

double exsltDateMonthInYear(unsigned __int8 *a1)
{
  _DWORD *v1;
  double v3;

  if (a1)
  {
    v1 = (_DWORD *)exsltDateParse(a1);
    if (v1)
    {
      if (*v1 <= 0xFu && ((1 << *v1) & 0xD050) != 0)
        goto LABEL_10;
      ((void (*)(void))*MEMORY[0x24BEDE758])();
    }
    return *MEMORY[0x24BEDEF40];
  }
  v1 = (_DWORD *)exsltDateCurrent();
  if (!v1)
    return *MEMORY[0x24BEDEF40];
LABEL_10:
  v3 = (double)(v1[4] & 0xF);
  ((void (*)(void))*MEMORY[0x24BEDE758])();
  return v3;
}

void exsltDynRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"evaluate", (const xmlChar *)"http://exslt.org/dynamic", (xmlXPathFunction)exsltDynEvaluateFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"map", (const xmlChar *)"http://exslt.org/dynamic", (xmlXPathFunction)exsltDynMapFunction);
}

xmlXPathParserContext *exsltDynEvaluateFunction(xmlXPathParserContext *result, int a2)
{
  xmlXPathParserContext *v3;
  xmlChar *v4;
  const xmlChar *v5;
  xmlXPathObject *v6;
  xsltTransformContext *TransformContext;
  xmlXPathObject *v8;

  if (!result)
    return result;
  v3 = result;
  if (a2 != 1)
  {
    TransformContext = xsltXPathGetTransformContext(result);
    xsltPrintErrorContext(TransformContext, 0, 0);
    result = (xmlXPathParserContext *)((uint64_t (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "dyn:evalute() : invalid number of args %d\n", a2);
    v3->error = 12;
    return result;
  }
  v4 = xmlXPathPopString(result);
  if (!v4)
  {
LABEL_11:
    v8 = xmlXPathNewNodeSet(0);
    return (xmlXPathParserContext *)valuePush(v3, v8);
  }
  v5 = v4;
  if (!xmlStrlen(v4))
  {
    ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v5);
    goto LABEL_11;
  }
  v6 = xmlXPathEval(v5, v3->context);
  if (!v6)
  {
    ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "dyn:evaluate() : unable to evaluate expression '%s'\n", (const char *)v5);
    v6 = xmlXPathNewNodeSet(0);
  }
  valuePush(v3, v6);
  return (xmlXPathParserContext *)((uint64_t (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v5);
}

void exsltDynMapFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlChar *v3;
  xmlXPathObjectPtr v4;
  xmlNodeSetPtr v5;
  xsltTransformContextPtr TransformContext;
  xsltTransformContext *v7;
  xmlXPathCompExprPtr v8;
  xmlXPathCompExpr *v9;
  xmlXPathContextPtr context;
  int contextSize;
  uint64_t proximityPosition;
  xmlDoc *RVT;
  int nodeNr;
  xmlXPathContextPtr v15;
  uint64_t v16;
  xmlNodePtr v17;
  xmlXPathContextPtr v18;
  xmlXPathObjectPtr v19;
  xmlXPathObject *v20;
  int *p_nodeNr;
  uint64_t v22;
  const xmlChar *stringval;
  xmlNode *v24;
  const char *v25;
  uint64_t v26;
  xmlChar *v27;
  xmlNodePtr v28;
  xsltTransformContext *v29;
  int v30;
  xmlDoc *doc;
  xmlNode *node;
  xmlNode *parent;

  if (a2 == 2)
  {
    v3 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v4 = 0;
LABEL_11:
      if (v3)
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
      valuePush(ctxt, v4);
      return;
    }
    v5 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error)
    {
      v4 = 0;
      goto LABEL_9;
    }
    v4 = xmlXPathNewNodeSet(0);
    if (!v4)
    {
      ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltDynMapFunction: ret == NULL\n");
      goto LABEL_9;
    }
    TransformContext = xsltXPathGetTransformContext(ctxt);
    if (!TransformContext)
    {
      v29 = xsltXPathGetTransformContext(ctxt);
      xsltTransformError(v29, 0, 0, "dyn:map : internal error tctxt == NULL\n");
      goto LABEL_9;
    }
    if (!v3 || (v7 = TransformContext, !xmlStrlen(v3)) || (v8 = xmlXPathCtxtCompile(v7->xpathCtxt, v3)) == 0)
    {
LABEL_9:
      if (v5)
        xmlXPathFreeNodeSet(v5);
      goto LABEL_11;
    }
    v9 = v8;
    context = ctxt->context;
    doc = context->doc;
    node = context->node;
    contextSize = context->contextSize;
    proximityPosition = context->proximityPosition;
    RVT = xsltCreateRVT(v7);
    if (!RVT)
    {
      xsltTransformError(v7, 0, 0, "dyn:map : internal error container == NULL\n");
      goto LABEL_53;
    }
    parent = (xmlNode *)RVT;
    xsltRegisterLocalRVT(v7, RVT);
    if (v5 && v5->nodeNr >= 1)
    {
      xmlXPathNodeSetSort(v5);
      nodeNr = v5->nodeNr;
      v15 = ctxt->context;
      *(_QWORD *)&v15->contextSize = v5->nodeNr;
      if (nodeNr < 1)
      {
LABEL_49:
        v15->doc = doc;
        v15->node = node;
        v15->contextSize = contextSize;
        v15->proximityPosition = proximityPosition;
LABEL_53:
        xmlXPathFreeCompExpr(v9);
        goto LABEL_9;
      }
      v16 = 0;
      v30 = contextSize;
      do
      {
        v17 = v5->nodeTab[v16];
        v18 = ctxt->context;
        ++v18->proximityPosition;
        v18->node = v17;
        if (v17->type != XML_NAMESPACE_DECL
          || (v17 = (xmlNodePtr)v17->_private) != 0 && v17->type == XML_ELEMENT_NODE)
        {
          v18->doc = v17->doc;
          v19 = xmlXPathCompiledEval(v9, v18);
          if (v19)
          {
            v20 = v19;
            switch(v19->type)
            {
              case XPATH_NODESET:
                p_nodeNr = &v19->nodesetval->nodeNr;
                if (p_nodeNr && *p_nodeNr >= 1)
                {
                  v22 = 0;
                  do
                  {
                    xmlXPathNodeSetAdd(v4->nodesetval, *(xmlNodePtr *)(*((_QWORD *)p_nodeNr + 1) + 8 * v22++));
                    p_nodeNr = &v20->nodesetval->nodeNr;
                  }
                  while (v22 < *p_nodeNr);
                }
                break;
              case XPATH_BOOLEAN:
                if (v19->BOOLval)
                  stringval = (const xmlChar *)"true";
                else
                  stringval = (const xmlChar *)&unk_21C4A0E0A;
                v24 = parent;
                v25 = "BOOLean";
                goto LABEL_44;
              case XPATH_NUMBER:
                v26 = proximityPosition;
                v27 = xmlXPathCastNumberToString(v19->floatval);
                v28 = xmlNewTextChild(parent, 0, (const xmlChar *)"number", v27);
                if (v27)
                  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v27);
                proximityPosition = v26;
                contextSize = v30;
                if (!v28)
                  break;
                goto LABEL_45;
              case XPATH_STRING:
                stringval = v19->stringval;
                v24 = parent;
                v25 = "string";
LABEL_44:
                v28 = xmlNewTextChild(v24, 0, (const xmlChar *)v25, stringval);
                if (v28)
                {
LABEL_45:
                  v28->ns = xmlNewNs(v28, (const xmlChar *)"http://exslt.org/common", (const xmlChar *)"exsl");
                  xmlXPathNodeSetAddUnique(v4->nodesetval, v28);
                }
                break;
              default:
                break;
            }
            xmlXPathFreeObject(v20);
          }
        }
        else
        {
          ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "Internal error in exsltDynMapFunction: Cannot retrieve the doc of a namespace node.\n");
        }
        ++v16;
      }
      while (v16 < v5->nodeNr);
    }
    v15 = ctxt->context;
    goto LABEL_49;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/dynamic.c", 105, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltRegisterAll(void)
{
  xsltInitGlobals();
  exsltCommonRegister();
  exsltMathRegister();
  exsltSetsRegister();
  exsltFuncRegister();
  exsltStrRegister();
  exsltDateRegister();
  exsltSaxonRegister();
  exsltDynRegister();
}

void exsltFuncRegister(void)
{
  xsltRegisterExtModuleFull((const xmlChar *)"http://exslt.org/functions", (xsltExtInitFunction)exsltFuncInit, (xsltExtShutdownFunction)exsltFuncShutdown, (xsltStyleExtInitFunction)exsltFuncStyleInit, (xsltStyleExtShutdownFunction)exsltFuncStyleShutdown);
  xsltRegisterExtModuleTopLevel((const xmlChar *)"function", (const xmlChar *)"http://exslt.org/functions", (xsltTopLevelFunction)exsltFuncFunctionComp);
  xsltRegisterExtModuleElement((const xmlChar *)"result", (const xmlChar *)"http://exslt.org/functions", (xsltPreComputeFunction)exsltFuncResultComp, (xsltTransformFunction)exsltFuncResultElem);
}

_QWORD *exsltFuncInit(xsltStylesheetPtr *a1, const xmlChar *a2)
{
  uint64_t v4;
  _QWORD *v5;
  xmlHashTable *ExtData;
  xsltStylesheet *v7;
  xsltStylesheetPtr Import;
  xsltStylesheet *v9;
  xmlHashTable *ExtInfo;
  _QWORD v12[2];

  v4 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(32);
  v5 = (_QWORD *)v4;
  if (v4)
  {
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_QWORD *)(v4 + 8) = 0;
    *(_DWORD *)(v4 + 24) = 0;
    ExtData = (xmlHashTable *)xsltStyleGetExtData(*a1, a2);
    v12[1] = ExtData;
    *v5 = ExtData;
    xmlHashScanFull(ExtData, (xmlHashScannerFull)exsltFuncRegisterFunc, a1);
    v7 = *a1;
    v12[0] = a1;
    Import = xsltNextImport(v7);
    if (Import)
    {
      v9 = Import;
      do
      {
        ExtInfo = xsltGetExtInfo(v9, a2);
        if (ExtInfo)
          xmlHashScanFull(ExtInfo, (xmlHashScannerFull)exsltFuncRegisterImportFunc, v12);
        v9 = xsltNextImport(v9);
      }
      while (v9);
    }
  }
  else
  {
    ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltFuncInit: not enough memory\n");
  }
  return v5;
}

uint64_t exsltFuncShutdown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xmlXPathObject *v4;

  v4 = *(xmlXPathObject **)(a3 + 8);
  if (v4)
    xmlXPathFreeObject(v4);
  return ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE758])(a3);
}

xmlHashTablePtr exsltFuncStyleInit()
{
  return xmlHashCreate(1);
}

void exsltFuncStyleShutdown(int a1, int a2, xmlHashTablePtr table)
{
  xmlHashFree(table, (xmlHashDeallocator)exsltFuncFreeDataEntry);
}

xsltStylesheet *exsltFuncFunctionComp(xsltStylesheet *result, xmlNode *node)
{
  xsltStylesheet *v3;
  xmlChar *Prop;
  xmlChar *v5;
  uint64_t (**v6)(xmlChar *);
  xmlNsPtr v7;
  xmlNsPtr v8;
  xmlChar *v9;
  xmlChar *v10;
  _xmlNode *children;
  xmlNs *ns;
  xmlHashTable *ExtData;
  xmlChar *prefix;

  if (!result || !node || node->type != XML_ELEMENT_NODE)
    return result;
  v3 = result;
  prefix = 0;
  Prop = xmlGetProp(node, (const xmlChar *)"name");
  v5 = xmlSplitQName2(Prop, &prefix);
  v6 = (uint64_t (**)(xmlChar *))MEMORY[0x24BEDE758];
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Prop);
  if (!v5 || !prefix)
  {
    result = (xsltStylesheet *)((uint64_t (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "func:function: not a QName\n");
    if (!v5)
      return result;
    return (xsltStylesheet *)(*v6)(v5);
  }
  v7 = xmlSearchNs(node->doc, node, prefix);
  if (!v7)
  {
    ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "func:function: undeclared prefix %s\n", (const char *)prefix);
    (*v6)(v5);
    return (xsltStylesheet *)(*v6)(prefix);
  }
  v8 = v7;
  (*v6)(prefix);
  xsltParseTemplateContent(v3, node);
  v9 = (xmlChar *)exsltFuncNewFunctionData();
  if (!v9)
    return (xsltStylesheet *)(*v6)(v5);
  v10 = v9;
  children = node->children;
  for (*((_QWORD *)v9 + 1) = children; children; ++*(_DWORD *)v10)
  {
    if (children->type != XML_ELEMENT_NODE)
      break;
    ns = children->ns;
    if (!ns)
      break;
    if (!xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
      break;
    if (!xmlStrEqual(*(const xmlChar **)(*((_QWORD *)v10 + 1) + 16), (const xmlChar *)"param"))
      break;
    children = *(_xmlNode **)(*((_QWORD *)v10 + 1) + 48);
    *((_QWORD *)v10 + 1) = children;
  }
  ExtData = (xmlHashTable *)xsltStyleGetExtData(v3, (const xmlChar *)"http://exslt.org/functions");
  if (ExtData)
  {
    if (xmlHashAddEntry2(ExtData, v8->href, v5, v10) < 0)
    {
      xsltTransformError(0, v3, node, "Failed to register function {%s}%s\n", (const char *)v8->href, (const char *)v5);
      ++v3->errors;
      (*v6)(v10);
    }
    else
    {
      ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0D0])(*MEMORY[0x24BEDF0D8], "exsltFuncFunctionComp: register {%s}%s\n", (const char *)v8->href, (const char *)v5);
    }
    return (xsltStylesheet *)(*v6)(v5);
  }
  ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltFuncFunctionComp: no stylesheet data\n");
  (*v6)(v5);
  return (xsltStylesheet *)(*v6)(v10);
}

uint64_t exsltFuncResultComp(xsltStylesheet *a1, uint64_t a2, void (__cdecl *a3)(xsltTransformContextPtr, xmlNodePtr, xmlNodePtr, xsltElemPreCompPtr))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xmlChar *NsProp;
  xmlChar *v15;
  xmlNsPtr *NsList;
  int v17;
  uint64_t v18;

  v3 = 0;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v7 = *(_QWORD *)(a2 + 48);
      if (v7)
      {
        while (1)
        {
          if (*(_DWORD *)(v7 + 8) == 1)
          {
            v8 = *(_QWORD *)(v7 + 72);
            if (!v8
              || !xmlStrEqual(*(const xmlChar **)(v8 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
              || !xmlStrEqual(*(const xmlChar **)(v7 + 16), (const xmlChar *)"fallback"))
            {
              break;
            }
          }
          v7 = *(_QWORD *)(v7 + 48);
          if (!v7)
            goto LABEL_10;
        }
        ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltFuncResultElem: only xsl:fallback is allowed to follow func:result\n");
        goto LABEL_34;
      }
LABEL_10:
      v9 = *(_QWORD *)(a2 + 40);
      if (v9)
      {
        while (1)
        {
          if (*(_DWORD *)(v9 + 8) == 1)
          {
            v10 = *(_QWORD *)(v9 + 72);
            if (v10)
            {
              if (xmlStrEqual(*(const xmlChar **)(v10 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
                && xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"stylesheet"))
              {
                break;
              }
            }
          }
          v11 = *(_QWORD *)(v9 + 72);
          if (v11 && xmlStrEqual(*(const xmlChar **)(v11 + 16), (const xmlChar *)"http://exslt.org/functions"))
          {
            if (xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"function"))
              goto LABEL_25;
            if (xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"result"))
            {
              ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "func:result element not allowed within another func:result element\n");
              goto LABEL_34;
            }
          }
          if (*(_DWORD *)(v9 + 8) == 1)
          {
            v12 = *(_QWORD *)(v9 + 72);
            if (v12)
            {
              if (xmlStrEqual(*(const xmlChar **)(v12 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
                && (xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"variable")
                 || xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"param")))
              {
                ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "func:result element not allowed within a variable binding element\n");
                goto LABEL_34;
              }
            }
          }
          v9 = *(_QWORD *)(v9 + 40);
          if (!v9)
            goto LABEL_25;
        }
        ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "func:result element not a descendant of a func:function\n");
LABEL_34:
        v3 = 0;
LABEL_36:
        ++a1->errors;
        return v3;
      }
LABEL_25:
      v13 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(64);
      v3 = v13;
      if (!v13)
      {
        xsltPrintErrorContext(0, 0, 0);
        ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltFuncResultComp : malloc failed\n");
        goto LABEL_36;
      }
      *(_OWORD *)(v13 + 32) = 0u;
      *(_OWORD *)(v13 + 48) = 0u;
      *(_OWORD *)v13 = 0u;
      *(_OWORD *)(v13 + 16) = 0u;
      xsltInitElemPreComp((xsltElemPreCompPtr)v13, a1, (xmlNodePtr)a2, a3, (xsltElemPreCompDeallocator)exsltFreeFuncResultPreComp);
      *(_QWORD *)(v3 + 40) = 0;
      NsProp = xmlGetNsProp((const xmlNode *)a2, (const xmlChar *)"select", 0);
      if (NsProp)
      {
        v15 = NsProp;
        *(_QWORD *)(v3 + 40) = xsltXPathCompileFlags(a1, NsProp, 0);
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v15);
      }
      NsList = xmlGetNsList(*(const xmlDoc **)(a2 + 64), (const xmlNode *)a2);
      *(_QWORD *)(v3 + 48) = NsList;
      if (NsList)
      {
        v17 = -1;
        do
        {
          v18 = (uint64_t)*NsList++;
          ++v17;
        }
        while (v18);
        *(_DWORD *)(v3 + 56) = v17;
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t exsltFuncResultElem(xsltTransformContext *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void **ExtData;
  void **v8;
  uint64_t result;
  uint64_t (*v10)(uint64_t, const char *);
  uint64_t v11;
  const char *v12;
  xmlXPathCompExpr *v13;
  uint64_t v14;
  xmlDoc *RVT;
  xmlDoc *v16;
  xmlXPathContext *xpathCtxt;
  xmlNsPtr *namespaces;
  int nsNr;
  xmlNodePtr node;
  xmlXPathObject *v21;
  xmlXPathContextPtr v22;
  uint64_t v23;
  xmlNode *insert;

  ExtData = (void **)xsltGetExtData(a1, (const xmlChar *)"http://exslt.org/functions");
  if (!ExtData)
  {
    v10 = (uint64_t (*)(uint64_t, const char *))*MEMORY[0x24BEDF0E0];
    v11 = *MEMORY[0x24BEDF0E8];
    v12 = "exsltFuncReturnElem: data == NULL\n";
    return v10(v11, v12);
  }
  v8 = ExtData;
  if (ExtData[1])
  {
    result = ((uint64_t (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "func:result already instanciated\n");
LABEL_4:
    *((_DWORD *)v8 + 6) = 1;
    return result;
  }
  a1->contextVariable = ExtData[2];
  v13 = *(xmlXPathCompExpr **)(a4 + 40);
  v14 = *(_QWORD *)(a3 + 24);
  if (!v13)
  {
    if (v14)
    {
      RVT = xsltCreateRVT(a1);
      if (!RVT)
      {
        result = ((uint64_t (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltFuncResultElem: out of memory\n");
        goto LABEL_4;
      }
      v16 = RVT;
      xsltRegisterLocalRVT(a1, RVT);
      if (linkedOnOrAfterFall2023OSVersions())
        v16->compression = 2;
      else
        v16->psvi = (void *)2;
      insert = a1->insert;
      a1->insert = (xmlNodePtr)v16;
      xsltApplyOneTemplate(a1, a1->node, *(xmlNodePtr *)(a3 + 24), 0, 0);
      a1->insert = insert;
      result = (uint64_t)xmlXPathNewValueTree((xmlNodePtr)v16);
      v23 = result;
      if (result)
      {
        *(_DWORD *)(result + 16) = 0;
      }
      else
      {
        result = ((uint64_t (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltFuncResultElem: ret == NULL\n");
        *((_DWORD *)v8 + 6) = 1;
      }
    }
    else
    {
      result = (uint64_t)xmlXPathNewCString((const char *)&unk_21C4A0E0A);
      v23 = result;
    }
    goto LABEL_23;
  }
  if (v14)
  {
    result = ((uint64_t (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "func:result content must be empty if the function has a select attribute\n");
    goto LABEL_4;
  }
  xpathCtxt = a1->xpathCtxt;
  namespaces = xpathCtxt->namespaces;
  nsNr = xpathCtxt->nsNr;
  node = xpathCtxt->node;
  xpathCtxt->namespaces = *(xmlNsPtr **)(a4 + 48);
  xpathCtxt->nsNr = *(_DWORD *)(a4 + 56);
  xpathCtxt->node = a1->node;
  v21 = xmlXPathCompiledEval(v13, xpathCtxt);
  v22 = a1->xpathCtxt;
  v22->node = node;
  v22->nsNr = nsNr;
  v22->namespaces = namespaces;
  if (!v21)
  {
    v10 = (uint64_t (*)(uint64_t, const char *))*MEMORY[0x24BEDF0E0];
    v11 = *MEMORY[0x24BEDF0E8];
    v12 = "exsltFuncResultElem: ret == NULL\n";
    return v10(v11, v12);
  }
  v23 = (uint64_t)v21;
  result = xsltFlagRVTs(a1, v21, 2);
LABEL_23:
  v8[1] = (void *)v23;
  return result;
}

uint64_t exsltFuncRegisterFunc(uint64_t result, xsltTransformContext *a2, const char *a3, const char *a4)
{
  if (result && a2 && a3)
  {
    if (a4)
    {
      ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0D0])(*MEMORY[0x24BEDF0D8], "exsltFuncRegisterFunc: register {%s}%s\n", a3, a4);
      return xsltRegisterExtFunction(a2, (const xmlChar *)a4, (const xmlChar *)a3, (xmlXPathFunction)exsltFuncFunctionFunction);
    }
  }
  return result;
}

xmlHashTable *exsltFuncRegisterImportFunc(xmlHashTable *result, uint64_t a2, xmlChar *name, xmlChar *name2)
{
  xmlHashTable *v7;

  if (result)
  {
    if (a2)
    {
      if (name)
      {
        if (name2)
        {
          if (*(_QWORD *)a2)
          {
            v7 = result;
            result = *(xmlHashTable **)(a2 + 8);
            if (result)
            {
              result = (xmlHashTable *)xmlHashLookup2(result, name, name2);
              if (!result)
              {
                result = (xmlHashTable *)exsltFuncNewFunctionData();
                if (result)
                {
                  *(_OWORD *)result = *(_OWORD *)v7;
                  if (xmlHashAddEntry2(*(xmlHashTablePtr *)(a2 + 8), name, name2, result) < 0)
                  {
                    return (xmlHashTable *)((uint64_t (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "Failed to register function {%s}%s\n", (const char *)name, (const char *)name2);
                  }
                  else
                  {
                    ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0D0])(*MEMORY[0x24BEDF0D8], "exsltFuncRegisterImportFunc: register {%s}%s\n", (const char *)name, (const char *)name2);
                    return (xmlHashTable *)xsltRegisterExtFunction(*(xsltTransformContextPtr *)a2, name2, name, (xmlXPathFunction)exsltFuncFunctionFunction);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void exsltFuncFunctionFunction(xmlXPathParserContext *a1, int a2)
{
  xsltTransformContextPtr TransformContext;
  void *ExtData;
  xmlHashTable *v6;
  uint64_t v7;
  int *v8;
  int v9;
  int v10;
  uint64_t v11;
  xmlNode *v12;
  char v13;
  int depth;
  xmlNodePtr node;
  int varsBase;
  xsltStackElem *v17;
  _QWORD *v18;
  uint64_t (**v19)(uint64_t);
  int v20;
  _QWORD *v21;
  int v22;
  int v23;
  xmlNode *prev;
  _xsltStackElem *v25;
  int v26;
  xsltStackElemPtr v27;
  xmlXPathObject *value;
  _QWORD *v29;
  BOOL v30;
  xmlNodePtr v31;
  xmlNode *insert;
  uint64_t v33;
  xmlXPathObject *v34;
  int v35;
  xmlNode *v36;
  uint64_t v37;
  int *v38;

  TransformContext = xsltXPathGetTransformContext(a1);
  ExtData = xsltGetExtData(TransformContext, (const xmlChar *)"http://exslt.org/functions");
  v6 = *(xmlHashTable **)ExtData;
  v7 = *((_QWORD *)ExtData + 1);
  *((_QWORD *)ExtData + 1) = 0;
  v8 = (int *)xmlHashLookup2(v6, a1->context->functionURI, a1->context->function);
  if (!v8)
  {
    ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "{%s}%s: not found\n", (const char *)a1->context->functionURI, (const char *)a1->context->function);
    v10 = 9;
    goto LABEL_5;
  }
  v9 = *v8;
  if (*v8 < a2)
  {
    ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "{%s}%s: called with too many arguments\n", (const char *)a1->context->functionURI, (const char *)a1->context->function);
    v10 = 12;
LABEL_5:
    a1->error = v10;
    return;
  }
  v11 = *((_QWORD *)v8 + 1);
  if (v11 && (v12 = *(xmlNode **)(v11 + 56)) != 0)
  {
    v13 = 0;
  }
  else
  {
    if (v9)
    {
      ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltFuncFunctionFunction: nargs != 0 and param == NULL\n");
      return;
    }
    v12 = 0;
    v13 = 1;
  }
  depth = TransformContext->depth;
  if (depth >= TransformContext->maxTemplateDepth)
  {
    xsltTransformError(TransformContext, 0, 0, "exsltFuncFunctionFunction: Potentially infinite recursion detected in function {%s}%s.\n", (const char *)a1->context->functionURI, (const char *)a1->context->function);
    TransformContext->state = XSLT_STATE_STOPPED;
  }
  else
  {
    TransformContext->depth = depth + 1;
    node = TransformContext->xpathCtxt->node;
    varsBase = TransformContext->varsBase;
    TransformContext->varsBase = TransformContext->varsNr;
    v37 = v7;
    v38 = v8;
    v36 = node;
    v35 = varsBase;
    if ((v13 & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      if (a2 < 1)
      {
        v18 = 0;
      }
      else
      {
        v18 = 0;
        v19 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE910];
        v20 = a2;
        do
        {
          v21 = v18;
          v18 = (_QWORD *)(*v19)(16);
          *v18 = v21;
          v18[1] = valuePop(a1);
          --v20;
        }
        while (v20);
        v9 = *v38;
      }
      if (v9 < 1)
      {
        v23 = 1;
      }
      else
      {
        v22 = 0;
        v23 = v9 + 1;
        while (1)
        {
          prev = v12->prev;
          if (!prev)
            break;
          ++v22;
          v12 = v12->prev;
          if (v9 == v22)
          {
            v12 = prev;
            goto LABEL_28;
          }
        }
        v23 = v22 + 1;
      }
LABEL_28:
      v25 = 0;
      v26 = v9 - a2;
      do
      {
        v27 = xsltParseStylesheetCallerParam(TransformContext, v12);
        v17 = v27;
        if (v23 > v26)
        {
          v27->computed = 1;
          value = v27->value;
          if (value)
            xmlXPathFreeObject(value);
          v29 = (_QWORD *)*v18;
          v17->value = (xmlXPathObjectPtr)v18[1];
          ((void (*)(_QWORD *))*MEMORY[0x24BEDE758])(v18);
          v18 = v29;
        }
        xsltLocalVariablePush(TransformContext, v17, -1);
        v17->next = v25;
        v12 = v12->next;
        v25 = v17;
        v30 = __OFSUB__(v23--, 1);
      }
      while (!((v23 < 0) ^ v30 | (v23 == 0)));
    }
    v31 = xmlNewDocNode(TransformContext->output, 0, (const xmlChar *)"fake", 0);
    insert = TransformContext->insert;
    v33 = *((_QWORD *)ExtData + 2);
    *((_QWORD *)ExtData + 2) = TransformContext->contextVariable;
    TransformContext->insert = v31;
    TransformContext->contextVariable = 0;
    xsltApplyOneTemplate(TransformContext, TransformContext->node, *((xmlNodePtr *)v38 + 1), 0, 0);
    xsltLocalVariablePop(TransformContext, TransformContext->varsBase, -2);
    TransformContext->insert = insert;
    TransformContext->contextVariable = (void *)*((_QWORD *)ExtData + 2);
    TransformContext->varsBase = v35;
    *((_QWORD *)ExtData + 2) = v33;
    if (v17)
      xsltFreeStackElemList(v17);
    TransformContext->xpathCtxt->node = v36;
    if (!*((_DWORD *)ExtData + 6))
    {
      v34 = (xmlXPathObject *)*((_QWORD *)ExtData + 1);
      if (v34)
        xsltFlagRVTs(TransformContext, *((xmlXPathObjectPtr *)ExtData + 1), 1);
      else
        v34 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
      *((_QWORD *)ExtData + 1) = v37;
      if (v31->children)
      {
        xmlDebugDumpNode((FILE *)*MEMORY[0x24BDAC8D8], v31, 1);
        ((void (*)(_QWORD, const char *, ...))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "{%s}%s: cannot write to result tree while executing a function\n", (const char *)a1->context->functionURI, (const char *)a1->context->function);
        xmlFreeNode(v31);
        xmlXPathFreeObject(v34);
      }
      else
      {
        xmlFreeNode(v31);
        valuePush(a1, v34);
      }
    }
    --TransformContext->depth;
  }
}

_QWORD *exsltFuncNewFunctionData()
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = (_QWORD *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(16);
  v1 = v0;
  if (v0)
  {
    *v0 = 0;
    v0[1] = 0;
    *(_DWORD *)v0 = 0;
  }
  else
  {
    ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltFuncNewFunctionData: not enough memory\n");
  }
  return v1;
}

uint64_t exsltFuncFreeDataEntry()
{
  return ((uint64_t (*)(void))*MEMORY[0x24BEDE758])();
}

uint64_t exsltFreeFuncResultPreComp(uint64_t result)
{
  uint64_t v1;
  xmlXPathCompExpr *v2;
  uint64_t (**v3)(uint64_t);

  if (result)
  {
    v1 = result;
    v2 = *(xmlXPathCompExpr **)(result + 40);
    if (v2)
      xmlXPathFreeCompExpr(v2);
    v3 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE758];
    if (*(_QWORD *)(v1 + 48))
      ((void (*)(void))*MEMORY[0x24BEDE758])();
    return (*v3)(v1);
  }
  return result;
}

void exsltMathRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"min", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathMinFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"max", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathMaxFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"highest", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathHighestFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"lowest", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathLowestFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"constant", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathConstantFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"random", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathRandomFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"abs", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAbsFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"sqrt", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathSqrtFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"power", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathPowerFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"log", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathLogFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"sin", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathSinFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"cos", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathCosFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"tan", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathTanFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"asin", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAsinFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"acos", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAcosFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"atan", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAtanFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"atan2", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAtan2Function);
  xsltRegisterExtModuleFunction((const xmlChar *)"exp", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathExpFunction);
}

xmlNodeSetPtr exsltMathMinFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  xmlNode *user;
  xmlNodeSetPtr result;
  xmlNodeSet *v6;
  double v7;
  xmlXPathObject *v8;
  uint64_t v9;
  double v10;

  if (a2 != 1)
  {
    result = (xmlNodeSetPtr)((uint64_t (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "math:min: invalid number of arguments\n");
    ctxt->error = 12;
    return result;
  }
  value = ctxt->value;
  if (value && value->BOOLval)
  {
    user = (xmlNode *)value->user;
    value->BOOLval = 0;
    value->user = 0;
  }
  else
  {
    user = 0;
  }
  result = xmlXPathPopNodeSet(ctxt);
  if (!ctxt->error)
  {
    v6 = result;
    if (result)
    {
      if (result->nodeNr)
      {
        v7 = xmlXPathCastNodeToNumber(*result->nodeTab);
        if (!xmlXPathIsNaN(v7))
        {
          if (v6->nodeNr < 2)
            goto LABEL_12;
          v9 = 1;
          while (1)
          {
            v10 = xmlXPathCastNodeToNumber(v6->nodeTab[v9]);
            if (xmlXPathIsNaN(v10))
              break;
            if (v10 < v7)
              v7 = v10;
            if (++v9 >= v6->nodeNr)
              goto LABEL_12;
          }
        }
      }
    }
    v7 = *MEMORY[0x24BEDEF40];
LABEL_12:
    xmlXPathFreeNodeSet(v6);
    if (user)
      xmlFreeNodeList(user);
    v8 = xmlXPathNewFloat(v7);
    return (xmlNodeSetPtr)valuePush(ctxt, v8);
  }
  return result;
}

void exsltMathMaxFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  xmlNode *user;
  xmlNodeSetPtr v5;
  xmlNodeSet *v6;
  double v7;
  xmlXPathObject *v8;
  uint64_t v9;
  double v10;

  if (a2 == 1)
  {
    value = ctxt->value;
    if (value && value->BOOLval)
    {
      user = (xmlNode *)value->user;
      value->BOOLval = 0;
      value->user = 0;
    }
    else
    {
      user = 0;
    }
    v5 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error)
      return;
    v6 = v5;
    if (v5)
    {
      if (v5->nodeNr)
      {
        v7 = xmlXPathCastNodeToNumber(*v5->nodeTab);
        if (!xmlXPathIsNaN(v7))
        {
          if (v6->nodeNr < 2)
            goto LABEL_14;
          v9 = 1;
          while (1)
          {
            v10 = xmlXPathCastNodeToNumber(v6->nodeTab[v9]);
            if (xmlXPathIsNaN(v10))
              break;
            if (v10 > v7)
              v7 = v10;
            if (++v9 >= v6->nodeNr)
              goto LABEL_14;
          }
        }
      }
    }
    v7 = *MEMORY[0x24BEDEF40];
LABEL_14:
    xmlXPathFreeNodeSet(v6);
    if (user)
      xmlFreeNodeList(user);
    v8 = xmlXPathNewFloat(v7);
    valuePush(ctxt, v8);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 136, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltMathHighestFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  xmlNode *user;
  xmlNodeSetPtr v5;
  xmlNodeSet *v6;
  xmlNodeSetPtr v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t nodeNr;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  xmlXPathObject *v15;

  if (a2 == 1)
  {
    value = ctxt->value;
    if (value && value->BOOLval)
    {
      user = (xmlNode *)value->user;
      value->BOOLval = 0;
      value->user = 0;
    }
    else
    {
      user = 0;
    }
    v5 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      v6 = v5;
      v7 = xmlXPathNodeSetCreate(0);
      if (v6)
      {
        if (v6->nodeNr)
        {
          v8 = xmlXPathCastNodeToNumber(*v6->nodeTab);
          if (!xmlXPathIsNaN(v8))
          {
            xmlXPathNodeSetAddUnique(v7, *v6->nodeTab);
            if (v6->nodeNr >= 2)
            {
              v9 = 1;
              while (1)
              {
                v10 = xmlXPathCastNodeToNumber(v6->nodeTab[v9]);
                if (xmlXPathIsNaN(v10))
                  break;
                if (v10 >= v8)
                {
                  if (v10 <= v8)
                  {
                    xmlXPathNodeSetAddUnique(v7, v6->nodeTab[v9]);
                  }
                  else
                  {
                    nodeNr = v7->nodeNr;
                    if ((int)nodeNr >= 1)
                    {
                      v12 = nodeNr + 1;
                      do
                        v7->nodeTab[(v12-- - 2)] = 0;
                      while (v12 > 1);
                      v7->nodeNr = 0;
                    }
                    xmlXPathNodeSetAddUnique(v7, v6->nodeTab[v9]);
                    v8 = v10;
                  }
                }
                if (++v9 >= v6->nodeNr)
                  goto LABEL_30;
              }
              v13 = v7->nodeNr;
              if ((int)v13 >= 1)
              {
                v14 = v13 + 1;
                do
                  v7->nodeTab[(v14-- - 2)] = 0;
                while (v14 > 1);
                v7->nodeNr = 0;
              }
            }
          }
        }
      }
LABEL_30:
      xmlXPathFreeNodeSet(v6);
      if (user)
        xmlFreeNodeList(user);
      v15 = xmlXPathWrapNodeSet(v7);
      valuePush(ctxt, v15);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 216, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathLowestFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  xmlNode *user;
  xmlNodeSetPtr v5;
  xmlNodeSet *v6;
  xmlNodeSetPtr v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t nodeNr;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  xmlXPathObject *v15;

  if (a2 == 1)
  {
    value = ctxt->value;
    if (value && value->BOOLval)
    {
      user = (xmlNode *)value->user;
      value->BOOLval = 0;
      value->user = 0;
    }
    else
    {
      user = 0;
    }
    v5 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      v6 = v5;
      v7 = xmlXPathNodeSetCreate(0);
      if (v6)
      {
        if (v6->nodeNr)
        {
          v8 = xmlXPathCastNodeToNumber(*v6->nodeTab);
          if (!xmlXPathIsNaN(v8))
          {
            xmlXPathNodeSetAddUnique(v7, *v6->nodeTab);
            if (v6->nodeNr >= 2)
            {
              v9 = 1;
              while (1)
              {
                v10 = xmlXPathCastNodeToNumber(v6->nodeTab[v9]);
                if (xmlXPathIsNaN(v10))
                  break;
                if (v10 <= v8)
                {
                  if (v10 < v8)
                  {
                    nodeNr = v7->nodeNr;
                    if ((int)nodeNr >= 1)
                    {
                      v12 = nodeNr + 1;
                      do
                        v7->nodeTab[(v12-- - 2)] = 0;
                      while (v12 > 1);
                      v7->nodeNr = 0;
                    }
                    xmlXPathNodeSetAddUnique(v7, v6->nodeTab[v9]);
                    v8 = v10;
                  }
                  else
                  {
                    xmlXPathNodeSetAddUnique(v7, v6->nodeTab[v9]);
                  }
                }
                if (++v9 >= v6->nodeNr)
                  goto LABEL_30;
              }
              v13 = v7->nodeNr;
              if ((int)v13 >= 1)
              {
                v14 = v13 + 1;
                do
                  v7->nodeTab[(v14-- - 2)] = 0;
                while (v14 > 1);
                v7->nodeNr = 0;
              }
            }
          }
        }
      }
LABEL_30:
      xmlXPathFreeNodeSet(v6);
      if (user)
        xmlFreeNodeList(user);
      v15 = xmlXPathWrapNodeSet(v7);
      valuePush(ctxt, v15);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 297, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathConstantFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  double v4;
  xmlChar *v5;
  const xmlChar *v6;
  int IsNaN;
  void (**v8)(const xmlChar *);
  const char *v9;
  double v10;
  int v11;
  int v12;
  xmlChar *v13;
  xmlChar *v14;
  xmlXPathObject *v15;

  if (a2 == 2)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      v5 = xmlXPathPopString(ctxt);
      if (!ctxt->error)
      {
        v6 = v5;
        if (!v5)
        {
          v10 = *MEMORY[0x24BEDEF40];
LABEL_32:
          v15 = xmlXPathNewFloat(v10);
          valuePush(ctxt, v15);
          return;
        }
        IsNaN = xmlXPathIsNaN(v4);
        v8 = (void (**)(const xmlChar *))MEMORY[0x24BEDE758];
        if (v4 < 1.0 || IsNaN)
          goto LABEL_30;
        if (xmlStrEqual(v6, (const xmlChar *)"PI"))
        {
          v9 = "3.1415926535897932384626433832795028841971693993751";
        }
        else if (xmlStrEqual(v6, (const xmlChar *)"E"))
        {
          v9 = "2.71828182845904523536028747135266249775724709369996";
        }
        else if (xmlStrEqual(v6, (const xmlChar *)"SQRRT2"))
        {
          v9 = "1.41421356237309504880168872420969807856967187537694";
        }
        else if (xmlStrEqual(v6, (const xmlChar *)"LN2"))
        {
          v9 = "0.69314718055994530941723212145817656807550013436025";
        }
        else if (xmlStrEqual(v6, (const xmlChar *)"LN10"))
        {
          v9 = "2.30258509299404568402";
        }
        else if (xmlStrEqual(v6, (const xmlChar *)"LOG2E"))
        {
          v9 = "1.4426950408889634074";
        }
        else
        {
          if (!xmlStrEqual(v6, (const xmlChar *)"SQRT1_2"))
            goto LABEL_30;
          v9 = "0.70710678118654752440";
        }
        v11 = xmlStrlen((const xmlChar *)v9);
        if (v4 <= (double)v11)
          v12 = (int)v4;
        else
          v12 = v11;
        v13 = xmlStrsub((const xmlChar *)v9, 0, v12);
        if (v13)
        {
          v14 = v13;
          v10 = MEMORY[0x22077CD3C]();
          (*v8)(v14);
LABEL_31:
          (*v8)(v6);
          goto LABEL_32;
        }
LABEL_30:
        v10 = *MEMORY[0x24BEDEF40];
        goto LABEL_31;
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 438, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathRandomFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  int v3;
  xmlXPathObject *v4;

  if (a2)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 488, 12);
    if (ctxt)
      ctxt->error = 12;
  }
  else
  {
    v3 = rand();
    v4 = xmlXPathNewFloat((double)v3 / 2147483650.0);
    valuePush(ctxt, v4);
  }
}

void exsltMathAbsFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  double v4;
  int IsNaN;
  double v6;
  double v7;
  xmlXPathObject *v8;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      IsNaN = xmlXPathIsNaN(v3);
      v6 = *MEMORY[0x24BEDEF40];
      v7 = fabs(v4);
      if (!IsNaN)
        v6 = v7;
      v8 = xmlXPathNewFloat(v6);
      valuePush(ctxt, v8);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 532, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathSqrtFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  double v4;
  int IsNaN;
  double v6;
  double v7;
  xmlXPathObject *v8;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      IsNaN = xmlXPathIsNaN(v3);
      v6 = *MEMORY[0x24BEDEF40];
      v7 = sqrt(v4);
      if (!IsNaN)
        v6 = v7;
      v8 = xmlXPathNewFloat(v6);
      valuePush(ctxt, v8);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 575, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathPowerFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  long double v6;
  double v7;
  xmlXPathObject *v8;

  if (a2 == 2)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      v5 = xmlXPathPopNumber(ctxt);
      if (!ctxt->error)
      {
        v6 = v5;
        if (xmlXPathIsNaN(v5) || xmlXPathIsNaN(v4))
          v7 = *MEMORY[0x24BEDEF40];
        else
          v7 = pow(v6, v4);
        v8 = xmlXPathNewFloat(v7);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 620, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathLogFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  xmlXPathObject *v6;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      if (xmlXPathIsNaN(v3))
        v5 = *MEMORY[0x24BEDEF40];
      else
        v5 = log(v4);
      v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 668, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathSinFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  xmlXPathObject *v6;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      if (xmlXPathIsNaN(v3))
        v5 = *MEMORY[0x24BEDEF40];
      else
        v5 = sin(v4);
      v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 711, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathCosFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  xmlXPathObject *v6;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      if (xmlXPathIsNaN(v3))
        v5 = *MEMORY[0x24BEDEF40];
      else
        v5 = cos(v4);
      v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 754, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathTanFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  xmlXPathObject *v6;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      if (xmlXPathIsNaN(v3))
        v5 = *MEMORY[0x24BEDEF40];
      else
        v5 = tan(v4);
      v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 797, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathAsinFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  xmlXPathObject *v6;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      if (xmlXPathIsNaN(v3))
        v5 = *MEMORY[0x24BEDEF40];
      else
        v5 = asin(v4);
      v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 840, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathAcosFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  xmlXPathObject *v6;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      if (xmlXPathIsNaN(v3))
        v5 = *MEMORY[0x24BEDEF40];
      else
        v5 = acos(v4);
      v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 883, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathAtanFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  xmlXPathObject *v6;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      if (xmlXPathIsNaN(v3))
        v5 = *MEMORY[0x24BEDEF40];
      else
        v5 = atan(v4);
      v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 926, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathAtan2Function(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  long double v6;
  double v7;
  xmlXPathObject *v8;

  if (a2 == 2)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      v5 = xmlXPathPopNumber(ctxt);
      if (!ctxt->error)
      {
        v6 = v5;
        if (xmlXPathIsNaN(v5) || xmlXPathIsNaN(v4))
          v7 = *MEMORY[0x24BEDEF40];
        else
          v7 = atan2(v6, v4);
        v8 = xmlXPathNewFloat(v7);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 971, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltMathExpFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  double v3;
  long double v4;
  double v5;
  xmlXPathObject *v6;

  if (a2 == 1)
  {
    v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      if (xmlXPathIsNaN(v3))
        v5 = *MEMORY[0x24BEDEF40];
      else
        v5 = exp(v4);
      v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 1020, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

int exsltMathXpathCtxtRegister(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  int result;

  if (!ctxt)
    return -1;
  if (!prefix)
    return -1;
  if (xmlXPathRegisterNs(ctxt, prefix, (const xmlChar *)"http://exslt.org/math"))
    return -1;
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"min", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathMinFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"max", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathMaxFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"highest", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathHighestFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"lowest", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathLowestFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"random", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathRandomFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"abs", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAbsFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"sqrt", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathSqrtFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"power", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathPowerFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"log", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathLogFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"sin", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathSinFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"cos", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathCosFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"tan", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathTanFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"asin", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAsinFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"acos", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAcosFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"atan", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAtanFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"atan2", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAtan2Function))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"exp", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathExpFunction))
  {
    return -1;
  }
  result = xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"constant", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathConstantFunction);
  if (result)
    return -1;
  return result;
}

void exsltSaxonRegister(void)
{
  xsltRegisterExtModule((const xmlChar *)"http://icl.com/saxon", (xsltExtInitFunction)exsltSaxonInit, (xsltExtShutdownFunction)exsltSaxonShutdown);
  xsltRegisterExtModuleFunction((const xmlChar *)"expression", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonExpressionFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"eval", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonEvalFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"evaluate", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonEvaluateFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"line-number", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonLineNumberFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"systemId", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonSystemIdFunction);
}

xmlHashTablePtr exsltSaxonInit()
{
  return xmlHashCreate(1);
}

void exsltSaxonShutdown(int a1, int a2, xmlHashTablePtr table)
{
  xmlHashFree(table, (xmlHashDeallocator)exsltSaxonFreeCompExprEntry);
}

void exsltSaxonExpressionFunction(xmlXPathParserContext *a1, int a2)
{
  xsltTransformContextPtr TransformContext;
  xsltTransformContext *v5;
  xmlChar *v6;
  BOOL v7;
  int v8;
  xmlXPathParserContext *v9;
  int v10;
  int v11;
  const xmlChar *v12;
  xmlHashTable *ExtData;
  xmlXPathCompExpr *v14;
  xmlXPathCompExprPtr v15;
  xmlXPathCompExprPtr v16;
  xmlXPathObject *v17;

  TransformContext = xsltXPathGetTransformContext(a1);
  if (a2 == 1)
  {
    v5 = TransformContext;
    v6 = xmlXPathPopString(a1);
    if (a1->error)
      v7 = 1;
    else
      v7 = v6 == 0;
    if (v7)
    {
      v8 = 11;
      v9 = a1;
      v10 = 91;
      v11 = 11;
    }
    else
    {
      v12 = v6;
      ExtData = (xmlHashTable *)xsltGetExtData(v5, a1->context->functionURI);
      v14 = (xmlXPathCompExpr *)xmlHashLookup(ExtData, v12);
      v15 = v14;
      if (v14)
        goto LABEL_15;
      v16 = xmlXPathCtxtCompile(v5->xpathCtxt, v12);
      if (v16)
      {
        v15 = v16;
        xmlHashAddEntry(ExtData, v12, v16);
LABEL_15:
        ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v12);
        v17 = xmlXPathWrapExternal(v15);
        valuePush(a1, v17);
        return;
      }
      ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v12);
      v8 = 7;
      v9 = a1;
      v10 = 104;
      v11 = 7;
    }
    xmlXPatherror(v9, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", v10, v11);
  }
  else
  {
    v8 = 12;
    xmlXPatherror(a1, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", 85, 12);
    if (!a1)
      return;
  }
  a1->error = v8;
}

void exsltSaxonEvalFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathParserContextPtr v2;
  xmlXPathObjectPtr value;
  xmlXPathCompExpr *v4;
  xmlXPathObject *v5;
  int v6;
  int v7;
  int v8;

  v2 = ctxt;
  if (a2 == 1)
  {
    value = ctxt->value;
    if (value && value->type == XPATH_USERS)
    {
      v4 = (xmlXPathCompExpr *)xmlXPathPopExternal(ctxt);
      v5 = xmlXPathCompiledEval(v4, v2->context);
      if (v5)
      {
        valuePush(v2, v5);
        return;
      }
      v6 = 7;
      ctxt = v2;
      v7 = 149;
      v8 = 7;
    }
    else
    {
      v6 = 11;
      v7 = 141;
      v8 = 11;
    }
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", v7, v8);
    goto LABEL_10;
  }
  v6 = 12;
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", 136, 12);
  if (v2)
LABEL_10:
    v2->error = v6;
}

void exsltSaxonEvaluateFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    exsltSaxonExpressionFunction(ctxt, 1);
    exsltSaxonEvalFunction(ctxt, 1);
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", 176, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltSaxonLineNumberFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr v4;
  xmlNodePtr node;
  double LineNo;
  xmlXPathObjectPtr value;
  int *p_nodeNr;
  uint64_t v9;
  xsltTransformContext *TransformContext;
  int v11;
  xsltTransformContext *v12;
  xmlXPathObject *v13;

  if (a2 != 1)
  {
    if (!a2)
    {
      v4 = 0;
      node = ctxt->context->node;
LABEL_4:
      LineNo = -1.0;
      if (node)
      {
        if (node->type != XML_NAMESPACE_DECL
          || (node = (xmlNodePtr)node->_private) != 0 && node->type == XML_ELEMENT_NODE)
        {
          LineNo = (double)xmlGetLineNo(node);
        }
        else
        {
          ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "Internal error in exsltSaxonLineNumberFunction: Cannot retrieve the doc of a namespace node.\n");
        }
      }
      goto LABEL_23;
    }
    TransformContext = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(TransformContext, 0, 0, "saxon:line-number() : invalid number of args %d\n", a2);
    v11 = 12;
LABEL_21:
    ctxt->error = v11;
    return;
  }
  value = ctxt->value;
  if (!value || value->type != XPATH_NODESET)
  {
    v12 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v12, 0, 0, "saxon:line-number() : invalid arg expecting a node-set\n");
    v11 = 11;
    goto LABEL_21;
  }
  v4 = valuePop(ctxt);
  p_nodeNr = &v4->nodesetval->nodeNr;
  LineNo = -1.0;
  if (p_nodeNr && *p_nodeNr >= 1)
  {
    node = (xmlNodePtr)**((_QWORD **)p_nodeNr + 1);
    if (*p_nodeNr != 1)
    {
      v9 = 1;
      do
      {
        if (xmlXPathCmpNodes(node, *(xmlNodePtr *)(*((_QWORD *)p_nodeNr + 1) + 8 * v9)) == -1)
          node = *(xmlNodePtr *)(*((_QWORD *)p_nodeNr + 1) + 8 * v9);
        ++v9;
      }
      while (v9 < *p_nodeNr);
    }
    goto LABEL_4;
  }
LABEL_23:
  v13 = xmlXPathNewFloat(LineNo);
  valuePush(ctxt, v13);
  xmlXPathFreeObject(v4);
}

void exsltSaxonSystemIdFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathContextPtr context;
  xmlDocPtr doc;
  const xmlChar *URL;
  xmlXPathObject *v6;

  if (ctxt)
  {
    if (a2)
    {
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", 199, 12);
      ctxt->error = 12;
    }
    else
    {
      context = ctxt->context;
      if (!context || (doc = context->doc) == 0 || (URL = doc->URL) == 0)
        URL = (const xmlChar *)&unk_21C4A0E0A;
      v6 = xmlXPathNewString(URL);
      valuePush(ctxt, v6);
    }
  }
}

void exsltSetsRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"difference", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsDifferenceFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"intersection", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsIntersectionFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"distinct", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsDistinctFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"has-same-node", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsHasSameNodesFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"leading", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsLeadingFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"trailing", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsTrailingFunction);
}

void exsltSetsDifferenceFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlNodeSetPtr v3;
  xmlNodeSet *v4;
  xmlNodeSet *v5;
  xmlNodeSet *v6;
  xmlNodeSet *v7;
  xmlXPathObject *v8;

  if (a2 == 2)
  {
    v3 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      v5 = xmlXPathPopNodeSet(ctxt);
      if (ctxt->error)
      {
        xmlXPathFreeNodeSet(v4);
      }
      else
      {
        v6 = v5;
        v7 = xmlXPathDifference(v5, v4);
        if (v7 != v6)
          xmlXPathFreeNodeSet(v6);
        xmlXPathFreeNodeSet(v4);
        v8 = xmlXPathWrapNodeSet(v7);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 26, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltSetsIntersectionFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlNodeSetPtr v3;
  xmlNodeSet *v4;
  xmlNodeSet *v5;
  xmlNodeSet *v6;
  xmlNodeSet *v7;
  xmlXPathObject *v8;

  if (a2 == 2)
  {
    v3 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      v5 = xmlXPathPopNodeSet(ctxt);
      if (ctxt->error)
      {
        xmlXPathFreeNodeSet(v4);
      }
      else
      {
        v6 = v5;
        v7 = xmlXPathIntersection(v5, v4);
        xmlXPathFreeNodeSet(v6);
        xmlXPathFreeNodeSet(v4);
        v8 = xmlXPathWrapNodeSet(v7);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 61, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltSetsDistinctFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  int BOOLval;
  void *user;
  xmlNodeSet *v6;
  xmlNodeSet *v7;
  xmlNodeSet *v8;
  xmlXPathObjectPtr v9;

  if (a2 == 1)
  {
    value = ctxt->value;
    if (value)
    {
      BOOLval = value->BOOLval;
      user = value->user;
      value->BOOLval = 0;
      value->user = 0;
    }
    else
    {
      BOOLval = 0;
      user = 0;
    }
    v6 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      v7 = v6;
      v8 = xmlXPathDistinctSorted(v6);
      if (v8 != v7)
        xmlXPathFreeNodeSet(v7);
      v9 = xmlXPathWrapNodeSet(v8);
      v9->user = user;
      v9->BOOLval = BOOLval;
      valuePush(ctxt, v9);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 98, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltSetsHasSameNodesFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlNodeSetPtr v3;
  xmlNodeSet *v4;
  xmlNodeSet *v5;
  xmlNodeSet *v6;
  int HasSameNodes;
  xmlXPathObject *v8;

  if (a2 == 2)
  {
    v3 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      v4 = v3;
      v5 = xmlXPathPopNodeSet(ctxt);
      if (ctxt->error)
      {
        xmlXPathFreeNodeSet(v4);
      }
      else
      {
        v6 = v5;
        HasSameNodes = xmlXPathHasSameNodes(v5, v4);
        xmlXPathFreeNodeSet(v6);
        xmlXPathFreeNodeSet(v4);
        v8 = xmlXPathNewBoolean(HasSameNodes);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 138, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltSetsLeadingFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlNodeSetPtr v3;
  xmlNodeSet *v4;
  xmlNodeSet *v5;
  xmlNodeSet *v6;
  xmlNode **nodeTab;
  xmlNode *v8;
  xmlXPathObject *v9;
  xmlNodeSet *v10;
  xmlXPathObject *v11;

  if (a2 == 2)
  {
    v3 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error)
      return;
    v4 = v3;
    v5 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      v6 = v5;
      if (v4)
      {
        if (v4->nodeNr)
        {
          nodeTab = v4->nodeTab;
          if (nodeTab)
          {
            if (v4->nodeNr < 1)
              v8 = 0;
            else
              v8 = *nodeTab;
            v10 = xmlXPathNodeLeadingSorted(v5, v8);
            xmlXPathFreeNodeSet(v6);
            xmlXPathFreeNodeSet(v4);
            v11 = xmlXPathWrapNodeSet(v10);
            valuePush(ctxt, v11);
            return;
          }
        }
      }
      v9 = xmlXPathWrapNodeSet(v5);
      valuePush(ctxt, v9);
    }
    xmlXPathFreeNodeSet(v4);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 172, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltSetsTrailingFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlNodeSetPtr v3;
  xmlNodeSet *v4;
  xmlNodeSet *v5;
  xmlNodeSet *v6;
  xmlNode **nodeTab;
  xmlNode *v8;
  xmlXPathObject *v9;
  xmlNodeSet *v10;
  xmlXPathObject *v11;

  if (a2 == 2)
  {
    v3 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error)
      return;
    v4 = v3;
    v5 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      v6 = v5;
      if (v4)
      {
        if (v4->nodeNr)
        {
          nodeTab = v4->nodeTab;
          if (nodeTab)
          {
            if (v4->nodeNr < 1)
              v8 = 0;
            else
              v8 = *nodeTab;
            v10 = xmlXPathNodeTrailingSorted(v5, v8);
            xmlXPathFreeNodeSet(v6);
            xmlXPathFreeNodeSet(v4);
            v11 = xmlXPathWrapNodeSet(v10);
            valuePush(ctxt, v11);
            return;
          }
        }
      }
      v9 = xmlXPathWrapNodeSet(v5);
      valuePush(ctxt, v9);
    }
    xmlXPathFreeNodeSet(v4);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 217, 12);
  if (ctxt)
    ctxt->error = 12;
}

int exsltSetsXpathCtxtRegister(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  int result;

  if (!ctxt)
    return -1;
  if (!prefix)
    return -1;
  if (xmlXPathRegisterNs(ctxt, prefix, (const xmlChar *)"http://exslt.org/sets"))
    return -1;
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"difference", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsDifferenceFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"intersection", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsIntersectionFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"distinct", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsDistinctFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"has-same-node", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsHasSameNodesFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"leading", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsLeadingFunction))
  {
    return -1;
  }
  result = xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"trailing", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsTrailingFunction);
  if (result)
    return -1;
  return result;
}

void exsltStrRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"tokenize", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrTokenizeFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"split", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrSplitFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"encode-uri", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrEncodeUriFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"decode-uri", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrDecodeUriFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"padding", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrPaddingFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"align", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrAlignFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"concat", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrConcatFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"replace", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrReplaceFunction);
}

void exsltStrTokenizeFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlChar *v3;
  xmlChar *v4;
  xmlChar *v5;
  xmlChar *v6;
  xsltTransformContext *TransformContext;
  xmlXPathObjectPtr v8;
  xmlDoc *RVT;
  xmlDoc *v10;
  xmlChar *v11;
  xmlChar *v12;
  int v13;
  int v14;
  const xmlChar *v15;
  uint64_t v16;
  xmlChar v17;
  xmlNode *v18;
  xmlNode *v19;
  xmlNode *v20;
  xsltTransformContext *v21;
  void (**v22)(xmlChar *);
  xmlXPathParserContext *v23;
  xmlXPathObject *v24;

  if ((a2 - 3) > 0xFFFFFFFD)
  {
    if (a2 == 2)
    {
      v3 = xmlXPathPopString(ctxt);
      if (ctxt->error)
        return;
    }
    else
    {
      v3 = xmlStrdup((const xmlChar *)"\t\r\n ");
    }
    v4 = v3;
    if (v3)
    {
      v5 = xmlXPathPopString(ctxt);
      if (ctxt->error || (v6 = v5) == 0)
      {
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v4);
      }
      else
      {
        TransformContext = xsltXPathGetTransformContext(ctxt);
        v8 = (xmlXPathObjectPtr)TransformContext;
        if (TransformContext)
        {
          RVT = xsltCreateRVT(TransformContext);
          if (RVT)
          {
            v10 = RVT;
            xsltRegisterLocalRVT((xsltTransformContextPtr)v8, RVT);
            v8 = xmlXPathNewNodeSet(0);
            if (v8 && *v6)
            {
              v11 = v6;
              v12 = v6;
              do
              {
                v13 = xmlUTF8Strsize(v12, 1);
                v14 = v13;
                v15 = v4;
                if (*v4)
                {
                  while (xmlUTF8Charcmp(v12, v15))
                  {
                    v15 += xmlUTF8Strsize(v15, 1);
                    if (!*v15)
                    {
                      v16 = v14;
                      goto LABEL_24;
                    }
                  }
                  if (v12 == v11)
                  {
                    v16 = v14;
                    v11 += v14;
                  }
                  else
                  {
                    *v12 = 0;
                    v19 = xmlNewDocRawNode(v10, 0, (const xmlChar *)"token", v11);
                    xmlAddChild((xmlNodePtr)v10, v19);
                    xmlXPathNodeSetAddUnique(v8->nodesetval, v19);
                    *v12 = *v15;
                    v16 = v14;
                    v11 = &v12[v14];
                  }
                }
                else
                {
                  v16 = v13;
                  v11 = &v12[v13];
                  v17 = *v11;
                  *v11 = 0;
                  v18 = xmlNewDocRawNode(v10, 0, (const xmlChar *)"token", v12);
                  xmlAddChild((xmlNodePtr)v10, v18);
                  xmlXPathNodeSetAddUnique(v8->nodesetval, v18);
                  *v11 = v17;
                }
LABEL_24:
                v12 += v16;
              }
              while (*v12);
              if (v11 != v12)
              {
                v20 = xmlNewDocRawNode(v10, 0, (const xmlChar *)"token", v11);
                xmlAddChild((xmlNodePtr)v10, v20);
                xmlXPathNodeSetAddUnique(v8->nodesetval, v20);
              }
            }
          }
          else
          {
            v8 = 0;
          }
        }
        else
        {
          v21 = xsltXPathGetTransformContext(ctxt);
          xsltTransformError(v21, 0, 0, "exslt:tokenize : internal error tctxt == NULL\n");
        }
        v22 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v6);
        (*v22)(v4);
        if (v8)
        {
          v23 = ctxt;
          v24 = v8;
        }
        else
        {
          v24 = xmlXPathNewNodeSet(0);
          v23 = ctxt;
        }
        valuePush(v23, v24);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 37, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltStrSplitFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlChar *v3;
  const xmlChar *v4;
  int v5;
  xmlChar *v6;
  xmlChar *v7;
  xsltTransformContext *TransformContext;
  xmlXPathObjectPtr v9;
  xmlDoc *RVT;
  xmlDoc *v11;
  xmlChar v12;
  const xmlChar *v13;
  xmlChar *v14;
  xmlNode *v15;
  xmlNode *v16;
  int v17;
  xmlNode *v18;
  xsltTransformContext *v19;
  void (**v20)(const xmlChar *);
  xmlXPathParserContext *v21;
  xmlXPathObject *v22;

  if ((a2 - 3) > 0xFFFFFFFD)
  {
    if (a2 == 2)
    {
      v3 = xmlXPathPopString(ctxt);
      if (ctxt->error)
        return;
    }
    else
    {
      v3 = xmlStrdup((const xmlChar *)" ");
    }
    v4 = v3;
    if (v3)
    {
      v5 = xmlStrlen(v3);
      v6 = xmlXPathPopString(ctxt);
      if (ctxt->error || (v7 = v6) == 0)
      {
        ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v4);
      }
      else
      {
        TransformContext = xsltXPathGetTransformContext(ctxt);
        v9 = (xmlXPathObjectPtr)TransformContext;
        if (TransformContext)
        {
          RVT = xsltCreateRVT(TransformContext);
          if (RVT)
          {
            v11 = RVT;
            xsltRegisterLocalRVT((xsltTransformContextPtr)v9, RVT);
            v9 = xmlXPathNewNodeSet(0);
            if (v9)
            {
              v12 = *v7;
              if (*v7)
              {
                v13 = v7;
                v14 = v7;
                do
                {
                  if (v5)
                  {
                    if (!xmlStrncasecmp(v14, v4, v5))
                    {
                      if (v14 == v13)
                      {
                        v13 += v5;
                      }
                      else
                      {
                        *v14 = 0;
                        v15 = xmlNewDocRawNode(v11, 0, (const xmlChar *)"token", v13);
                        xmlAddChild((xmlNodePtr)v11, v15);
                        xmlXPathNodeSetAddUnique(v9->nodesetval, v15);
                        *v14 = *v4;
                        v13 = &v14[v5];
                      }
                      v14 = (xmlChar *)(v13 - 1);
                    }
                  }
                  else if (v14 == v13)
                  {
                    v14 = (xmlChar *)v13;
                  }
                  else
                  {
                    *v14 = 0;
                    v16 = xmlNewDocRawNode(v11, 0, (const xmlChar *)"token", v13);
                    xmlAddChild((xmlNodePtr)v11, v16);
                    xmlXPathNodeSetAddUnique(v9->nodesetval, v16);
                    *v14 = v12;
                    ++v13;
                  }
                  v17 = *++v14;
                  v12 = v17;
                }
                while (v17);
                if (v13 != v14)
                {
                  v18 = xmlNewDocRawNode(v11, 0, (const xmlChar *)"token", v13);
                  xmlAddChild((xmlNodePtr)v11, v18);
                  xmlXPathNodeSetAddUnique(v9->nodesetval, v18);
                }
              }
            }
          }
          else
          {
            v9 = 0;
          }
        }
        else
        {
          v19 = xsltXPathGetTransformContext(ctxt);
          xsltTransformError(v19, 0, 0, "exslt:tokenize : internal error tctxt == NULL\n");
        }
        v20 = (void (**)(const xmlChar *))MEMORY[0x24BEDE758];
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v7);
        (*v20)(v4);
        if (v9)
        {
          v21 = ctxt;
          v22 = v9;
        }
        else
        {
          v22 = xmlXPathNewNodeSet(0);
          v21 = ctxt;
        }
        valuePush(v21, v22);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 140, 12);
    if (ctxt)
      ctxt->error = 12;
  }
}

void exsltStrEncodeUriFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  xmlChar *v3;
  int v4;
  int v5;
  const char *v6;
  xmlChar *v7;
  xmlXPathObject *v8;
  xmlXPathObject *v9;

  if (a2 - 4 <= 0xFFFFFFFD)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 240, 12);
    if (ctxt)
      ctxt->error = 12;
    return;
  }
  if (a2 >= 3)
  {
    v3 = xmlXPathPopString(ctxt);
    if (xmlUTF8Strlen(v3) != 5 || xmlStrcmp((const xmlChar *)"UTF-8", v3))
    {
LABEL_17:
      v9 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
      valuePush(ctxt, v9);
LABEL_18:
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
      return;
    }
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
  }
  v4 = xmlXPathPopBoolean(ctxt);
  v3 = xmlXPathPopString(ctxt);
  v5 = xmlUTF8Strlen(v3);
  if (v5 <= 0)
  {
    if (v5 < 0)
      ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltStrEncodeUriFunction: invalid UTF-8\n");
    goto LABEL_17;
  }
  if (v4)
    v6 = "-_.!~*'()";
  else
    v6 = "-_.!~*'();/?:@&=+$,[]";
  v7 = xmlURIEscapeStr(v3, (const xmlChar *)v6);
  v8 = xmlXPathWrapString(v7);
  valuePush(ctxt, v8);
  if (v3)
    goto LABEL_18;
}

void exsltStrDecodeUriFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  xmlChar *v3;
  int v4;
  char *v5;
  xmlXPathObject *v6;
  xmlXPathObject *v7;
  void (*v8)(void *);
  void *v9;
  xmlXPathObject *v10;
  void (**v11)(void *);

  if (a2 - 3 > 0xFFFFFFFD)
  {
    if (a2 >= 2)
    {
      v3 = xmlXPathPopString(ctxt);
      if (xmlUTF8Strlen(v3) != 5 || xmlStrcmp((const xmlChar *)"UTF-8", v3))
        goto LABEL_15;
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
    }
    v3 = xmlXPathPopString(ctxt);
    v4 = xmlUTF8Strlen(v3);
    if (v4 > 0)
    {
      v5 = xmlURIUnescapeString((const char *)v3, 0, 0);
      if (!xmlCheckUTF8((const unsigned __int8 *)v5))
      {
        v10 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
        valuePush(ctxt, v10);
        v11 = (void (**)(void *))MEMORY[0x24BEDE758];
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
        v8 = *v11;
        v9 = v5;
        goto LABEL_17;
      }
      v6 = xmlXPathWrapString((xmlChar *)v5);
      valuePush(ctxt, v6);
      if (!v3)
        return;
LABEL_16:
      v8 = (void (*)(void *))*MEMORY[0x24BEDE758];
      v9 = v3;
LABEL_17:
      v8(v9);
      return;
    }
    if (v4 < 0)
      ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltStrDecodeUriFunction: invalid UTF-8\n");
LABEL_15:
    v7 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
    valuePush(ctxt, v7);
    goto LABEL_16;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 290, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltStrPaddingFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlChar *v3;
  int v4;
  int v5;
  double v6;
  int IsNaN;
  int v8;
  xmlBuffer *Size;
  xmlBuffer *v10;
  int v11;
  xmlChar *v12;
  xmlXPathObject *v13;
  xmlXPathObject *v14;

  if ((a2 - 3) <= 0xFFFFFFFD)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 349, 12);
    if (ctxt)
      ctxt->error = 12;
    return;
  }
  if (a2 != 2)
  {
    v6 = xmlXPathPopNumber(ctxt);
LABEL_11:
    v3 = xmlStrdup((const xmlChar *)" ");
    v4 = 1;
    v5 = 1;
    goto LABEL_12;
  }
  v3 = xmlXPathPopString(ctxt);
  v4 = xmlUTF8Strlen(v3);
  v5 = xmlStrlen(v3);
  v6 = xmlXPathPopNumber(ctxt);
  if (v4 <= 0)
  {
    if (v4 < 0)
    {
      ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltStrPaddingFunction: invalid UTF-8\n");
LABEL_28:
      v14 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
      valuePush(ctxt, v14);
      goto LABEL_29;
    }
    if (v3)
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
    goto LABEL_11;
  }
LABEL_12:
  IsNaN = xmlXPathIsNaN(v6);
  if (v6 < 0.0 || IsNaN)
    goto LABEL_28;
  if (v6 >= 100000.0)
  {
    v8 = 100000;
  }
  else
  {
    v8 = (int)v6;
    if ((int)v6 <= 0)
      goto LABEL_28;
  }
  Size = xmlBufferCreateSize(v8);
  if (!Size)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 392, 15);
    if (ctxt)
      ctxt->error = 15;
    goto LABEL_29;
  }
  v10 = Size;
  xmlBufferSetAllocationScheme(Size, XML_BUFFER_ALLOC_DOUBLEIT);
  if (v8 < v4)
    goto LABEL_22;
  do
  {
    xmlBufferAdd(v10, v3, v5);
    v8 -= v4;
  }
  while (v8 >= v4);
  if (v8 >= 1)
  {
LABEL_22:
    v11 = xmlUTF8Strsize(v3, v8);
    xmlBufferAdd(v10, v3, v11);
  }
  v12 = xmlBufferDetach(v10);
  v13 = xmlXPathWrapString(v12);
  valuePush(ctxt, v13);
  xmlBufferFree(v10);
  if (v3)
LABEL_29:
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
}

void exsltStrAlignFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlChar *v3;
  xmlChar *v4;
  xmlChar *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  xmlXPathObject *v9;
  void (**v10)(xmlChar *);
  xmlXPathObject *v11;
  xmlChar *v12;
  xmlChar *v13;
  const xmlChar *v14;
  int v15;
  xmlChar *v16;
  xmlChar *v17;
  int v18;

  if ((a2 - 4) > 0xFFFFFFFD)
  {
    if (a2 == 3)
      v3 = xmlXPathPopString(ctxt);
    else
      v3 = 0;
    v4 = xmlXPathPopString(ctxt);
    v5 = xmlXPathPopString(ctxt);
    v6 = xmlUTF8Strlen(v5);
    v7 = xmlUTF8Strlen(v4);
    if ((v6 & 0x80000000) != 0 || (v7 & 0x80000000) != 0)
    {
      ((void (*)(_QWORD, const char *))*MEMORY[0x24BEDF0E0])(*MEMORY[0x24BEDF0E8], "exsltStrAlignFunction: invalid UTF-8\n");
      v11 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
    }
    else
    {
      v8 = v7 - v6;
      if (v7 == v6)
      {
        v9 = xmlXPathWrapString(v5);
        valuePush(ctxt, v9);
        v10 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
LABEL_26:
        (*v10)(v4);
        (*v10)(v3);
        return;
      }
      if (v7 >= v6)
      {
        if (xmlStrEqual(v3, (const xmlChar *)"right"))
        {
          v13 = xmlUTF8Strndup(v4, v8);
          v14 = v5;
        }
        else if (xmlStrEqual(v3, (const xmlChar *)"center"))
        {
          if (v8 >= 0)
            v15 = v8;
          else
            v15 = v8 + 1;
          v16 = xmlUTF8Strndup(v4, v15 >> 1);
          v17 = xmlStrcat(v16, v5);
          v14 = &v4[xmlUTF8Strsize(v4, v6 + (v15 >> 1))];
          v13 = v17;
        }
        else
        {
          v18 = xmlUTF8Strsize(v4, v6);
          v13 = xmlStrdup(v5);
          v14 = &v4[v18];
        }
        v12 = xmlStrcat(v13, v14);
      }
      else
      {
        v12 = xmlUTF8Strndup(v5, v7);
      }
      v11 = xmlXPathWrapString(v12);
    }
    valuePush(ctxt, v11);
    v10 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v5);
    goto LABEL_26;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 427, 12);
  if (ctxt)
    ctxt->error = 12;
}

void exsltStrConcatFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  xmlXPathObjectPtr v4;
  xmlXPathObject *v5;
  xmlNodeSetPtr nodesetval;
  xmlBuffer *v7;
  xmlBuffer *v8;
  int *p_nodeNr;
  uint64_t v10;
  void (**v11)(xmlChar *);
  xmlChar *v12;
  xmlChar *v13;
  xmlXPathObject *v14;
  int v15;
  xmlXPathObject *v16;

  if (a2 != 1)
  {
    v15 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 506, 12);
    if (!ctxt)
      return;
LABEL_15:
    ctxt->error = v15;
    return;
  }
  value = ctxt->value;
  if (!value || (value->type | 8) != 9)
  {
    v15 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 511, 11);
    goto LABEL_15;
  }
  v4 = valuePop(ctxt);
  v5 = v4;
  nodesetval = v4->nodesetval;
  if (nodesetval && nodesetval->nodeNr && nodesetval->nodeTab)
  {
    v7 = xmlBufferCreate();
    if (v7)
    {
      v8 = v7;
      xmlBufferSetAllocationScheme(v7, XML_BUFFER_ALLOC_DOUBLEIT);
      p_nodeNr = &v5->nodesetval->nodeNr;
      if (*p_nodeNr >= 1)
      {
        v10 = 0;
        v11 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
        do
        {
          v12 = xmlXPathCastNodeToString(*(xmlNodePtr *)(*((_QWORD *)p_nodeNr + 1) + 8 * v10));
          xmlBufferCat(v8, v12);
          (*v11)(v12);
          ++v10;
          p_nodeNr = &v5->nodesetval->nodeNr;
        }
        while (v10 < *p_nodeNr);
      }
      xmlXPathFreeObject(v5);
      v13 = xmlBufferDetach(v8);
      v14 = xmlXPathWrapString(v13);
      valuePush(ctxt, v14);
      xmlBufferFree(v8);
    }
    else
    {
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 525, 15);
      ctxt->error = 15;
      xmlXPathFreeObject(v5);
    }
  }
  else
  {
    xmlXPathFreeObject(v4);
    v16 = xmlXPathNewCString((const char *)&unk_21C4A0E0A);
    valuePush(ctxt, v16);
  }
}

void exsltStrReplaceFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathObjectPtr value;
  xmlNodeSetPtr v4;
  xmlXPathObjectPtr v5;
  xmlNodeSetPtr v6;
  xmlNodeSet *v7;
  unsigned int nodeNr;
  xmlChar *v9;
  const xmlChar *v10;
  uint64_t v11;
  xmlChar **p_str;
  xmlChar **v13;
  int *v14;
  xmlChar **v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  xmlChar *v20;
  int v21;
  BOOL v22;
  xmlChar *v23;
  xmlBuffer *v24;
  const xmlChar *v25;
  uint64_t v26;
  int v27;
  int v28;
  const xmlChar *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  xmlXPathParserContext *v35;
  int v36;
  const xmlChar *v37;
  int v38;
  uint64_t v39;
  void (**v40)(uint64_t);
  uint64_t v41;
  uint64_t v42;
  void (**v43)(void);
  uint64_t v44;
  xmlChar *str1;
  int *v46;
  xmlNodeSet *v47;
  xmlBufferPtr buf;
  xmlNodeSet *v49;
  xmlChar *v50;
  xmlChar *str;
  xmlChar *v52;
  int v53;
  int v54;

  v54 = 0;
  v53 = 0;
  str = 0;
  v52 = 0;
  if (a2 == 3)
  {
    value = ctxt->value;
    if (value && (value->type | 8) == 9)
    {
      v4 = xmlXPathPopNodeSet(ctxt);
    }
    else
    {
      v4 = 0;
      str = xmlXPathPopString(ctxt);
    }
    if (ctxt->error)
      return;
    v5 = ctxt->value;
    if (v5 && (v5->type | 8) == 9)
    {
      v6 = xmlXPathPopNodeSet(ctxt);
      v7 = v6;
      if (v6)
        nodeNr = v6->nodeNr;
      else
        nodeNr = 0;
    }
    else
    {
      v7 = 0;
      v52 = xmlXPathPopString(ctxt);
      nodeNr = 1;
    }
    if (ctxt->error)
    {
LABEL_103:
      if (!v4)
        goto LABEL_106;
      goto LABEL_104;
    }
    v9 = xmlXPathPopString(ctxt);
    if (ctxt->error)
      goto LABEL_101;
    v10 = v9;
    v11 = nodeNr;
    if ((int)nodeNr <= 0)
    {
      v16 = xmlStrlen(v9);
      exsltStrReturnString(ctxt, v10, v16);
      goto LABEL_100;
    }
    if (nodeNr == 1)
    {
      v44 = 0;
      str1 = v9;
      p_str = &str;
      v13 = &v52;
      v14 = &v53;
      v15 = (xmlChar **)&v54;
    }
    else
    {
      v17 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(24 * nodeNr);
      if (!v17)
      {
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 660, 15);
        ctxt->error = 15;
        goto LABEL_100;
      }
      v44 = v17;
      str1 = (xmlChar *)v10;
      p_str = (xmlChar **)(v17 + 8 * nodeNr);
      v15 = &p_str[nodeNr];
      v14 = (int *)v15 + nodeNr;
      v13 = (xmlChar **)v17;
    }
    v18 = 0;
    v19 = -1;
    v49 = v7;
    while (1)
    {
      if (v7)
      {
        v20 = xmlXPathCastNodeToString(v7->nodeTab[v18]);
        v13[v18] = v20;
        if (!v20)
        {
          LODWORD(v11) = v18;
          goto LABEL_88;
        }
      }
      else
      {
        v20 = v13[v18];
      }
      v21 = xmlStrlen(v20);
      *((_DWORD *)v15 + v18) = v21;
      if (v21)
        v22 = 0;
      else
        v22 = (v19 & 0x80000000) != 0;
      if (v22)
        v19 = v18;
      if (v4)
        break;
      if (v18)
        goto LABEL_39;
      v23 = str;
      *p_str = str;
      if (v23)
        goto LABEL_41;
LABEL_42:
      v14[v18++] = (int)v23;
      if (v11 == v18)
      {
        if ((v19 & 0x80000000) == 0 && !v14[v19])
          v19 = -1;
        v24 = xmlBufferCreate();
        if (v24)
        {
          buf = v24;
          xmlBufferSetAllocationScheme(v24, XML_BUFFER_ALLOC_DOUBLEIT);
          if (*str1)
          {
            v25 = str1;
            v50 = str1;
            v46 = v14;
            v47 = v4;
            do
            {
              v26 = 0;
              v27 = 0;
              v28 = 0;
              do
              {
                v29 = v13[v26];
                if (*v25 == *v29)
                {
                  v30 = *((_DWORD *)v15 + v26);
                  if (v30 > v28 && !xmlStrncmp(v25, v29, v30))
                  {
                    v28 = *((_DWORD *)v15 + v26);
                    v27 = v26;
                  }
                }
                ++v26;
              }
              while (v11 != v26);
              v4 = v47;
              if (v28)
              {
                if (v50 < v25
                  && (v25 - v50 >= 0x7FFFFFFF ? (v31 = 0x7FFFFFFF) : (v31 = (_DWORD)v25 - (_DWORD)v50),
                      xmlBufferAdd(buf, v50, v31))
                  || (v32 = v46[v27]) != 0 && xmlBufferAdd(buf, p_str[v27], v32))
                {
                  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 758, 15);
                  v7 = v49;
                  if (!ctxt)
                    goto LABEL_87;
                  goto LABEL_86;
                }
                v25 += *((int *)v15 + v27);
                v50 = (xmlChar *)v25;
                v7 = v49;
              }
              else
              {
                if ((v19 & 0x80000000) != 0)
                {
                  v7 = v49;
                }
                else
                {
                  v7 = v49;
                  if (v50 < v25)
                  {
                    v33 = v25 - v50 >= 0x7FFFFFFF ? 0x7FFFFFFF : (_DWORD)v25 - (_DWORD)v50;
                    if (xmlBufferAdd(buf, v50, v33) || (v50 = (xmlChar *)v25, xmlBufferAdd(buf, p_str[v19], v46[v19])))
                    {
                      v35 = ctxt;
                      v36 = 743;
                      goto LABEL_108;
                    }
                  }
                }
                v25 += xmlUTF8Strsize(v25, 1);
              }
            }
            while (*v25);
            if (v50 >= v25)
              goto LABEL_84;
            v34 = v25 - v50 >= 0x7FFFFFFF ? 0x7FFFFFFF : (_DWORD)v25 - (_DWORD)v50;
            if (!xmlBufferAdd(buf, v50, v34))
              goto LABEL_84;
            v35 = ctxt;
            v36 = 769;
LABEL_108:
            xmlXPatherror(v35, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", v36, 15);
            if (ctxt)
LABEL_86:
              ctxt->error = 15;
          }
          else
          {
LABEL_84:
            v37 = xmlBufferContent(buf);
            v38 = xmlBufferLength(buf);
            exsltStrReturnString(ctxt, v37, v38);
          }
LABEL_87:
          xmlBufferFree(buf);
        }
        else
        {
          xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 717, 15);
          if (ctxt)
            ctxt->error = 15;
        }
LABEL_88:
        v10 = str1;
        if (v7 && (int)v11 >= 1)
        {
          v39 = v11;
          v40 = (void (**)(uint64_t))MEMORY[0x24BEDE758];
          do
          {
            v41 = (uint64_t)*v13++;
            (*v40)(v41);
            --v39;
          }
          while (v39);
        }
        if (v4 && (int)v11 >= 1)
        {
          v42 = v11;
          v43 = (void (**)(void))MEMORY[0x24BEDE758];
          do
          {
            if (*p_str)
              (*v43)();
            ++p_str;
            --v42;
          }
          while (v42);
        }
        v7 = v49;
        if (v44)
          ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v44);
LABEL_100:
        ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v10);
LABEL_101:
        if (v7)
        {
          xmlXPathFreeNodeSet(v7);
          goto LABEL_103;
        }
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v52);
        if (!v4)
        {
LABEL_106:
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(str);
          return;
        }
LABEL_104:
        xmlXPathFreeNodeSet(v4);
        return;
      }
    }
    if (v18 < v4->nodeNr)
    {
      v23 = xmlXPathCastNodeToString(v4->nodeTab[v18]);
      p_str[v18] = v23;
      if (!v23)
      {
        LODWORD(v11) = v18 + 1;
        goto LABEL_88;
      }
LABEL_41:
      LODWORD(v23) = xmlStrlen(v23);
      goto LABEL_42;
    }
LABEL_39:
    LODWORD(v23) = 0;
    p_str[v18] = 0;
    goto LABEL_42;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 608, 12);
  if (ctxt)
    ctxt->error = 12;
}

int exsltStrXpathCtxtRegister(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  int result;

  if (!ctxt)
    return -1;
  if (!prefix)
    return -1;
  if (xmlXPathRegisterNs(ctxt, prefix, (const xmlChar *)"http://exslt.org/strings"))
    return -1;
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"encode-uri", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrEncodeUriFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"decode-uri", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrDecodeUriFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"padding", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrPaddingFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"align", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrAlignFunction))
  {
    return -1;
  }
  result = xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"concat", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrConcatFunction);
  if (result)
    return -1;
  return result;
}

void exsltStrReturnString(xmlXPathParserContext *a1, const xmlChar *a2, int a3)
{
  xsltTransformContext *TransformContext;
  xmlDoc *RVT;
  xmlNode *v8;
  xmlNode *v9;
  xmlNode *v10;
  xmlXPathObject *v11;
  xmlXPathParserContext *v12;
  int v13;

  TransformContext = xsltXPathGetTransformContext(a1);
  RVT = xsltCreateRVT(TransformContext);
  if (RVT)
  {
    v8 = (xmlNode *)RVT;
    xsltRegisterLocalRVT(TransformContext, RVT);
    v9 = xmlNewTextLen(a2, a3);
    if (v9)
    {
      v10 = v9;
      xmlAddChild(v8, v9);
      v11 = xmlXPathNewNodeSet(v10);
      if (v11)
      {
        valuePush(a1, v11);
        return;
      }
      v12 = a1;
      v13 = 579;
    }
    else
    {
      v12 = a1;
      v13 = 572;
    }
  }
  else
  {
    v12 = a1;
    v13 = 565;
  }
  xmlXPatherror(v12, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", v13, 15);
  if (a1)
    a1->error = 15;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAE7B8](a1, a2);
}

uint64_t linkedOnOrAfterFall2023OSVersions()
{
  return MEMORY[0x24BEDF090]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

xmlXPathObjectPtr valuePop(xmlXPathParserContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDE5D8](ctxt);
}

int valuePush(xmlXPathParserContextPtr ctxt, xmlXPathObjectPtr value)
{
  return MEMORY[0x24BEDE5E0](ctxt, value);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x24BEDE5E8](parent, cur);
}

int xmlBufferAdd(xmlBufferPtr buf, const xmlChar *str, int len)
{
  return MEMORY[0x24BEDE618](buf, str, *(_QWORD *)&len);
}

int xmlBufferCat(xmlBufferPtr buf, const xmlChar *str)
{
  return MEMORY[0x24BEDE628](buf, str);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x24BEDE630](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x24BEDE638]();
}

xmlBufferPtr xmlBufferCreateSize(size_t size)
{
  return (xmlBufferPtr)MEMORY[0x24BEDE640](size);
}

xmlChar *__cdecl xmlBufferDetach(xmlBufferPtr buf)
{
  return (xmlChar *)MEMORY[0x24BEDE648](buf);
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x24BEDE650](buf);
}

int xmlBufferLength(const xmlBuffer *buf)
{
  return MEMORY[0x24BEDE658](buf);
}

void xmlBufferSetAllocationScheme(xmlBufferPtr buf, xmlBufferAllocationScheme scheme)
{
  MEMORY[0x24BEDE660](buf, *(_QWORD *)&scheme);
}

int xmlCheckUTF8(const unsigned __int8 *utf)
{
  return MEMORY[0x24BEDE690](utf);
}

void xmlDebugDumpNode(FILE *output, xmlNodePtr node, int depth)
{
  MEMORY[0x24BEDE6E8](output, node, *(_QWORD *)&depth);
}

void xmlFreeNode(xmlNodePtr cur)
{
  MEMORY[0x24BEDE780](cur);
}

void xmlFreeNodeList(xmlNodePtr cur)
{
  MEMORY[0x24BEDE788](cur);
}

uint64_t xmlGetLineNo(const xmlNode *node)
{
  return MEMORY[0x24BEDE800](node);
}

xmlNsPtr *__cdecl xmlGetNsList(const xmlDoc *doc, const xmlNode *node)
{
  return (xmlNsPtr *)MEMORY[0x24BEDE810](doc, node);
}

xmlChar *__cdecl xmlGetNsProp(const xmlNode *node, const xmlChar *name, const xmlChar *nameSpace)
{
  return (xmlChar *)MEMORY[0x24BEDE818](node, name, nameSpace);
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x24BEDE828](node, name);
}

int xmlHashAddEntry(xmlHashTablePtr table, const xmlChar *name, void *userdata)
{
  return MEMORY[0x24BEDE840](table, name, userdata);
}

int xmlHashAddEntry2(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2, void *userdata)
{
  return MEMORY[0x24BEDE848](table, name, name2, userdata);
}

xmlHashTablePtr xmlHashCreate(int size)
{
  return (xmlHashTablePtr)MEMORY[0x24BEDE858](*(_QWORD *)&size);
}

void xmlHashFree(xmlHashTablePtr table, xmlHashDeallocator f)
{
  MEMORY[0x24BEDE860](table, f);
}

void *__cdecl xmlHashLookup(xmlHashTablePtr table, const xmlChar *name)
{
  return (void *)MEMORY[0x24BEDE868](table, name);
}

void *__cdecl xmlHashLookup2(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2)
{
  return (void *)MEMORY[0x24BEDE870](table, name, name2);
}

void xmlHashScanFull(xmlHashTablePtr table, xmlHashScannerFull f, void *data)
{
  MEMORY[0x24BEDE898](table, f, data);
}

xmlNodePtr xmlNewDocNode(xmlDocPtr doc, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE960](doc, ns, name, content);
}

xmlNodePtr xmlNewDocRawNode(xmlDocPtr doc, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE980](doc, ns, name, content);
}

xmlNodePtr xmlNewDocText(const xmlDoc *doc, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE988](doc, content);
}

xmlNsPtr xmlNewNs(xmlNodePtr node, const xmlChar *href, const xmlChar *prefix)
{
  return (xmlNsPtr)MEMORY[0x24BEDE9B0](node, href, prefix);
}

xmlNodePtr xmlNewTextChild(xmlNodePtr parent, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE9E0](parent, ns, name, content);
}

xmlNodePtr xmlNewTextLen(const xmlChar *content, int len)
{
  return (xmlNodePtr)MEMORY[0x24BEDE9E8](content, *(_QWORD *)&len);
}

xmlNsPtr xmlSearchNs(xmlDocPtr doc, xmlNodePtr node, const xmlChar *nameSpace)
{
  return (xmlNsPtr)MEMORY[0x24BEDEBD8](doc, node, nameSpace);
}

xmlChar *__cdecl xmlSplitQName2(const xmlChar *name, xmlChar **prefix)
{
  return (xmlChar *)MEMORY[0x24BEDEC18](name, prefix);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x24BEDEC28](str1, str2);
}

xmlChar *__cdecl xmlStrcat(xmlChar *cur, const xmlChar *add)
{
  return (xmlChar *)MEMORY[0x24BEDEC40](cur, add);
}

int xmlStrcmp(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x24BEDEC50](str1, str2);
}

xmlChar *__cdecl xmlStrdup(const xmlChar *cur)
{
  return (xmlChar *)MEMORY[0x24BEDEC58](cur);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x24BEDEC78](str);
}

int xmlStrncasecmp(const xmlChar *str1, const xmlChar *str2, int len)
{
  return MEMORY[0x24BEDEC80](str1, str2, *(_QWORD *)&len);
}

int xmlStrncmp(const xmlChar *str1, const xmlChar *str2, int len)
{
  return MEMORY[0x24BEDEC90](str1, str2, *(_QWORD *)&len);
}

xmlChar *__cdecl xmlStrsub(const xmlChar *str, int start, int len)
{
  return (xmlChar *)MEMORY[0x24BEDECA8](str, *(_QWORD *)&start, *(_QWORD *)&len);
}

xmlChar *__cdecl xmlURIEscapeStr(const xmlChar *str, const xmlChar *list)
{
  return (xmlChar *)MEMORY[0x24BEDEDE0](str, list);
}

char *__cdecl xmlURIUnescapeString(const char *str, int len, char *target)
{
  return (char *)MEMORY[0x24BEDEDE8](str, *(_QWORD *)&len, target);
}

int xmlUTF8Charcmp(const xmlChar *utf1, const xmlChar *utf2)
{
  return MEMORY[0x24BEDEDF0](utf1, utf2);
}

int xmlUTF8Strlen(const xmlChar *utf)
{
  return MEMORY[0x24BEDEDF8](utf);
}

xmlChar *__cdecl xmlUTF8Strndup(const xmlChar *utf, int len)
{
  return (xmlChar *)MEMORY[0x24BEDEE08](utf, *(_QWORD *)&len);
}

int xmlUTF8Strsize(const xmlChar *utf, int len)
{
  return MEMORY[0x24BEDEE18](utf, *(_QWORD *)&len);
}

double xmlXPathCastNodeToNumber(xmlNodePtr node)
{
  double result;

  MEMORY[0x24BEDEE48](node);
  return result;
}

xmlChar *__cdecl xmlXPathCastNodeToString(xmlNodePtr node)
{
  return (xmlChar *)MEMORY[0x24BEDEE50](node);
}

xmlChar *__cdecl xmlXPathCastNumberToString(double val)
{
  return (xmlChar *)MEMORY[0x24BEDEE58](val);
}

double xmlXPathCastStringToNumber(const xmlChar *val)
{
  double result;

  MEMORY[0x24BEDEE60](val);
  return result;
}

int xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr node2)
{
  return MEMORY[0x24BEDEE70](node1, node2);
}

xmlXPathObjectPtr xmlXPathCompiledEval(xmlXPathCompExprPtr comp, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEE78](comp, ctx);
}

xmlXPathCompExprPtr xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, const xmlChar *str)
{
  return (xmlXPathCompExprPtr)MEMORY[0x24BEDEEA0](ctxt, str);
}

xmlNodeSetPtr xmlXPathDifference(xmlNodeSetPtr nodes1, xmlNodeSetPtr nodes2)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDEEB0](nodes1, nodes2);
}

xmlNodeSetPtr xmlXPathDistinctSorted(xmlNodeSetPtr nodes)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDEEB8](nodes);
}

xmlXPathObjectPtr xmlXPathEval(const xmlChar *str, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEEC8](str, ctx);
}

void xmlXPathFreeCompExpr(xmlXPathCompExprPtr comp)
{
  MEMORY[0x24BEDEEE0](comp);
}

void xmlXPathFreeNodeSet(xmlNodeSetPtr obj)
{
  MEMORY[0x24BEDEEF0](obj);
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
  MEMORY[0x24BEDEEF8](obj);
}

int xmlXPathHasSameNodes(xmlNodeSetPtr nodes1, xmlNodeSetPtr nodes2)
{
  return MEMORY[0x24BEDEF10](nodes1, nodes2);
}

xmlNodeSetPtr xmlXPathIntersection(xmlNodeSetPtr nodes1, xmlNodeSetPtr nodes2)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDEF20](nodes1, nodes2);
}

int xmlXPathIsNaN(double val)
{
  return MEMORY[0x24BEDEF30](val);
}

xmlXPathObjectPtr xmlXPathNewBoolean(int val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF48](*(_QWORD *)&val);
}

xmlXPathObjectPtr xmlXPathNewCString(const char *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF50](val);
}

xmlXPathObjectPtr xmlXPathNewFloat(double val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF60](val);
}

xmlXPathObjectPtr xmlXPathNewNodeSet(xmlNodePtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF68](val);
}

xmlXPathObjectPtr xmlXPathNewString(const xmlChar *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF78](val);
}

xmlXPathObjectPtr xmlXPathNewValueTree(xmlNodePtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF80](val);
}

xmlNodeSetPtr xmlXPathNodeLeadingSorted(xmlNodeSetPtr nodes, xmlNodePtr node)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDEFA0](nodes, node);
}

int xmlXPathNodeSetAdd(xmlNodeSetPtr cur, xmlNodePtr val)
{
  return MEMORY[0x24BEDEFA8](cur, val);
}

int xmlXPathNodeSetAddUnique(xmlNodeSetPtr cur, xmlNodePtr val)
{
  return MEMORY[0x24BEDEFB0](cur, val);
}

xmlNodeSetPtr xmlXPathNodeSetCreate(xmlNodePtr val)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDEFB8](val);
}

void xmlXPathNodeSetSort(xmlNodeSetPtr set)
{
  MEMORY[0x24BEDEFC8](set);
}

xmlNodeSetPtr xmlXPathNodeTrailingSorted(xmlNodeSetPtr nodes, xmlNodePtr node)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDEFD0](nodes, node);
}

int xmlXPathPopBoolean(xmlXPathParserContextPtr ctxt)
{
  return MEMORY[0x24BEDEFF8](ctxt);
}

void *__cdecl xmlXPathPopExternal(xmlXPathParserContextPtr ctxt)
{
  return (void *)MEMORY[0x24BEDF000](ctxt);
}

xmlNodeSetPtr xmlXPathPopNodeSet(xmlXPathParserContextPtr ctxt)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDF008](ctxt);
}

double xmlXPathPopNumber(xmlXPathParserContextPtr ctxt)
{
  double result;

  MEMORY[0x24BEDF010](ctxt);
  return result;
}

xmlChar *__cdecl xmlXPathPopString(xmlXPathParserContextPtr ctxt)
{
  return (xmlChar *)MEMORY[0x24BEDF018](ctxt);
}

int xmlXPathRegisterFuncNS(xmlXPathContextPtr ctxt, const xmlChar *name, const xmlChar *ns_uri, xmlXPathFunction f)
{
  return MEMORY[0x24BEDF030](ctxt, name, ns_uri, f);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x24BEDF038](ctxt, prefix, ns_uri);
}

xmlXPathObjectPtr xmlXPathWrapExternal(void *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDF060](val);
}

xmlXPathObjectPtr xmlXPathWrapNodeSet(xmlNodeSetPtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDF068](val);
}

xmlXPathObjectPtr xmlXPathWrapString(xmlChar *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDF070](val);
}

void xmlXPatherror(xmlXPathParserContextPtr ctxt, const char *file, int line, int no)
{
  MEMORY[0x24BEDF078](ctxt, file, *(_QWORD *)&line, *(_QWORD *)&no);
}

void xsltApplyOneTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr list, xsltTemplatePtr templ, xsltStackElemPtr params)
{
  MEMORY[0x24BEDF098](ctxt, node, list, templ, params);
}

xmlDocPtr xsltCreateRVT(xsltTransformContextPtr ctxt)
{
  return (xmlDocPtr)MEMORY[0x24BEDF0A0](ctxt);
}

int xsltFlagRVTs(xsltTransformContextPtr ctxt, xmlXPathObjectPtr obj, intptr_t val)
{
  return MEMORY[0x24BEDF0B8](ctxt, obj, val);
}

void xsltFreeStackElemList(xsltStackElemPtr elem)
{
  MEMORY[0x24BEDF0C0](elem);
}

void xsltFunctionNodeSet(xmlXPathParserContextPtr ctxt, int nargs)
{
  MEMORY[0x24BEDF0C8](ctxt, *(_QWORD *)&nargs);
}

void *__cdecl xsltGetExtData(xsltTransformContextPtr ctxt, const xmlChar *URI)
{
  return (void *)MEMORY[0x24BEDF0F0](ctxt, URI);
}

xmlHashTablePtr xsltGetExtInfo(xsltStylesheetPtr style, const xmlChar *URI)
{
  return (xmlHashTablePtr)MEMORY[0x24BEDF0F8](style, URI);
}

void xsltInitElemPreComp(xsltElemPreCompPtr comp, xsltStylesheetPtr style, xmlNodePtr inst, xsltTransformFunction function, xsltElemPreCompDeallocator freeFunc)
{
  MEMORY[0x24BEDF100](comp, style, inst, function, freeFunc);
}

void xsltInitGlobals(void)
{
  MEMORY[0x24BEDF108]();
}

void xsltLocalVariablePop(xsltTransformContextPtr ctxt, int limitNr, int level)
{
  MEMORY[0x24BEDF110](ctxt, *(_QWORD *)&limitNr, *(_QWORD *)&level);
}

int xsltLocalVariablePush(xsltTransformContextPtr ctxt, xsltStackElemPtr variable, int level)
{
  return MEMORY[0x24BEDF118](ctxt, variable, *(_QWORD *)&level);
}

xsltStylesheetPtr xsltNextImport(xsltStylesheetPtr style)
{
  return (xsltStylesheetPtr)MEMORY[0x24BEDF120](style);
}

xsltStackElemPtr xsltParseStylesheetCallerParam(xsltTransformContextPtr ctxt, xmlNodePtr cur)
{
  return (xsltStackElemPtr)MEMORY[0x24BEDF128](ctxt, cur);
}

void xsltParseTemplateContent(xsltStylesheetPtr style, xmlNodePtr templ)
{
  MEMORY[0x24BEDF130](style, templ);
}

void xsltPrintErrorContext(xsltTransformContextPtr ctxt, xsltStylesheetPtr style, xmlNodePtr node)
{
  MEMORY[0x24BEDF138](ctxt, style, node);
}

int xsltRegisterExtFunction(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *URI, xmlXPathFunction function)
{
  return MEMORY[0x24BEDF140](ctxt, name, URI, function);
}

int xsltRegisterExtModule(const xmlChar *URI, xsltExtInitFunction initFunc, xsltExtShutdownFunction shutdownFunc)
{
  return MEMORY[0x24BEDF148](URI, initFunc, shutdownFunc);
}

int xsltRegisterExtModuleElement(const xmlChar *name, const xmlChar *URI, xsltPreComputeFunction precomp, xsltTransformFunction transform)
{
  return MEMORY[0x24BEDF150](name, URI, precomp, transform);
}

int xsltRegisterExtModuleFull(const xmlChar *URI, xsltExtInitFunction initFunc, xsltExtShutdownFunction shutdownFunc, xsltStyleExtInitFunction styleInitFunc, xsltStyleExtShutdownFunction styleShutdownFunc)
{
  return MEMORY[0x24BEDF158](URI, initFunc, shutdownFunc, styleInitFunc, styleShutdownFunc);
}

int xsltRegisterExtModuleFunction(const xmlChar *name, const xmlChar *URI, xmlXPathFunction function)
{
  return MEMORY[0x24BEDF160](name, URI, function);
}

int xsltRegisterExtModuleTopLevel(const xmlChar *name, const xmlChar *URI, xsltTopLevelFunction function)
{
  return MEMORY[0x24BEDF168](name, URI, function);
}

int xsltRegisterLocalRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
{
  return MEMORY[0x24BEDF170](ctxt, RVT);
}

void *__cdecl xsltStyleGetExtData(xsltStylesheetPtr style, const xmlChar *URI)
{
  return (void *)MEMORY[0x24BEDF178](style, URI);
}

void xsltTransformError(xsltTransformContextPtr ctxt, xsltStylesheetPtr style, xmlNodePtr node, const char *msg, ...)
{
  MEMORY[0x24BEDF180](ctxt, style, node, msg);
}

xmlXPathCompExprPtr xsltXPathCompileFlags(xsltStylesheetPtr style, const xmlChar *str, int flags)
{
  return (xmlXPathCompExprPtr)MEMORY[0x24BEDF188](style, str, *(_QWORD *)&flags);
}

