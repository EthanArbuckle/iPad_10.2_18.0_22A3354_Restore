@implementation PSISearchEntityTranslator

+ (id)psiGroupFromSearchEntity:(id)a3
{
  id v4;
  __int16 v5;
  void *v6;
  PSIGroup *v7;
  void *v8;
  double v9;
  double v10;
  PSIGroup *v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "_indexCategoryForSearchEntityType:", objc_msgSend(v4, "type"));
  objc_msgSend(a1, "_lookupIdentifierForSearchEntity:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [PSIGroup alloc];
  objc_msgSend(v4, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingScore");
  v10 = v9;

  v11 = -[PSIGroup initWithContentString:lookupIdentifier:category:score:](v7, "initWithContentString:lookupIdentifier:category:score:", v8, v6, v5, v10);
  return v11;
}

+ (id)_lookupIdentifierForSearchEntity:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = 0;
  if (v4 > 1519)
  {
    if (v4 > 1599)
    {
      if (v4 == 1600)
      {
        objc_msgSend(v3, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v6, "integerValue");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%lu"), CFSTR("meaning"), v21);
        goto LABEL_26;
      }
      if (v4 != 2500)
      {
        if (v4 != 2600)
          goto LABEL_30;
        objc_msgSend(v3, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%u"), CFSTR("humanAction"), v13);
LABEL_29:
        v5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      objc_msgSend(v3, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v19, "integerValue");

      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("audio");
    }
    else
    {
      switch(v4)
      {
        case 1520:
          objc_msgSend(v3, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v16, "integerValue");

          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("privateEncryptedComputeKGID");
          break;
        case 1530:
          objc_msgSend(v3, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v17, "integerValue");

          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("privateEncryptedComputeMUID");
          break;
        case 1540:
          objc_msgSend(v3, "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "integerValue");

          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("privateEncryptedComputeAMP");
          break;
        default:
          goto LABEL_30;
      }
    }
LABEL_28:
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/%llu"), v10, v8);
    goto LABEL_29;
  }
  if (v4 > 1329)
  {
    switch(v4)
    {
      case 1330:
        goto LABEL_20;
      case 1500:
        objc_msgSend(v3, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v18, "integerValue");

        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = CFSTR("scene");
        break;
      case 1510:
        objc_msgSend(v3, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v11, "integerValue");

        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = CFSTR("parseRichLabel");
        break;
      default:
        goto LABEL_30;
    }
    goto LABEL_28;
  }
  switch(v4)
  {
    case 1103:
      objc_msgSend(v3, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%lu"), CFSTR("season"), v15);
      goto LABEL_29;
    case 1300:
LABEL_20:
      objc_msgSend(v3, "identifier");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 1320:
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("contributor"), v6);
LABEL_26:
      v5 = (id)objc_claimAutoreleasedReturnValue();

      break;
  }
LABEL_30:

  return v5;
}

+ (id)zeroScorePSIGroupFromLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5
{
  id v8;
  id v9;
  PSIGroup *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[PSIGroup initWithContentString:lookupIdentifier:category:score:]([PSIGroup alloc], "initWithContentString:lookupIdentifier:category:score:", v9, v8, (__int16)objc_msgSend(a1, "_indexCategoryForSearchEntityType:", a4), 0.0);

  return v10;
}

+ (unint64_t)_indexCategoryForSearchEntityType:(unint64_t)a3
{
  unint64_t result;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 0;
  if ((uint64_t)a3 > 1519)
  {
    if ((uint64_t)a3 <= 1899)
    {
      if (a3 == 1802)
        v4 = 1802;
      else
        v4 = 0;
      if (a3 == 1801)
        v4 = 1801;
      if (a3 == 1800)
        v4 = 1800;
      if (a3 == 1701)
        v5 = 1701;
      else
        v5 = 0;
      if (a3 == 1700)
        v5 = 1700;
      if ((uint64_t)a3 <= 1799)
        v4 = v5;
      if (a3 == 1610)
        v6 = 1610;
      else
        v6 = 0;
      if (a3 == 1600)
        v6 = 1600;
      if (a3 == 1540)
        v6 = 1540;
      if (a3 == 1530)
        v7 = 1530;
      else
        v7 = 0;
      if (a3 == 1520)
        v7 = 1520;
      if ((uint64_t)a3 <= 1539)
        v6 = v7;
      v8 = (uint64_t)a3 <= 1699;
    }
    else
    {
      if ((uint64_t)a3 <= 1999)
      {
        switch(a3)
        {
          case 0x76CuLL:
          case 0x76DuLL:
          case 0x76EuLL:
          case 0x76FuLL:
          case 0x770uLL:
          case 0x771uLL:
          case 0x772uLL:
          case 0x773uLL:
          case 0x774uLL:
          case 0x775uLL:
          case 0x776uLL:
          case 0x777uLL:
          case 0x778uLL:
          case 0x779uLL:
          case 0x77AuLL:
          case 0x77BuLL:
            goto LABEL_96;
          case 0x77CuLL:
            result = 1917;
            break;
          case 0x77DuLL:
            result = 1918;
            break;
          case 0x77EuLL:
            result = 1919;
            break;
          default:
            return result;
        }
        return result;
      }
      if (a3 == 2600)
        v4 = 2600;
      else
        v4 = 0;
      if (a3 == 2500)
        v4 = 2500;
      if (a3 == 2401)
        v9 = 2401;
      else
        v9 = 0;
      if (a3 == 2400)
        v9 = 2400;
      if ((uint64_t)a3 <= 2499)
        v4 = v9;
      if (a3 == 2300)
        v6 = 2300;
      else
        v6 = 0;
      if (a3 == 2200)
        v6 = 2200;
      if (a3 == 2100)
        v10 = 2100;
      else
        v10 = 0;
      if (a3 == 2000)
        v10 = 2000;
      if ((uint64_t)a3 <= 2199)
        v6 = v10;
      v8 = (uint64_t)a3 <= 2399;
    }
LABEL_90:
    if (v8)
      return v6;
    else
      return v4;
  }
  if ((uint64_t)a3 > 1099)
  {
    if ((uint64_t)a3 > 1299)
    {
      if (a3 == 1510)
        v4 = 1510;
      else
        v4 = 0;
      if (a3 == 1500)
        v4 = 1500;
      if (a3 == 1401)
        v11 = 1401;
      else
        v11 = 0;
      if (a3 == 1400)
        v11 = 1400;
      if ((uint64_t)a3 <= 1499)
        v4 = v11;
      if (a3 == 1330)
        v6 = 1330;
      else
        v6 = 0;
      if (a3 == 1320)
        v6 = 1320;
      if (a3 == 1310)
        v12 = 1310;
      else
        v12 = 0;
      if (a3 == 1300)
        v12 = 1300;
      if ((uint64_t)a3 <= 1319)
        v6 = v12;
      v8 = (uint64_t)a3 <= 1399;
      goto LABEL_90;
    }
    switch(a3)
    {
      case 0x4B0uLL:
      case 0x4B1uLL:
      case 0x4B2uLL:
      case 0x4B3uLL:
LABEL_96:
        result = a3;
        break;
      case 0x4B4uLL:
        result = 1205;
        break;
      default:
        switch(a3)
        {
          case 0x44CuLL:
          case 0x44DuLL:
            goto LABEL_96;
          case 0x44EuLL:
            result = 1103;
            break;
          case 0x44FuLL:
            result = 1104;
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
        goto LABEL_96;
      default:
        switch(a3)
        {
          case 0x3E8uLL:
          case 0x3E9uLL:
          case 0x3EAuLL:
          case 0x3EBuLL:
            goto LABEL_96;
          case 0x3ECuLL:
            result = 1005;
            break;
          default:
            return result;
        }
        break;
    }
  }
  return result;
}

@end
