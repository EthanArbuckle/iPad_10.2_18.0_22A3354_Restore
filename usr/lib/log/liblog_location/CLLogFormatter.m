@implementation CLLogFormatter

- (CLLogFormatter)init
{
  CLLogFormatter *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLLogFormatter;
  v2 = -[CLLogFormatter init](&v5, sel_init);
  if (v2)
  {
    v2->_selectorForType = (NSMutableDictionary *)objc_opt_new();
    v2->_formatterSignature = (NSMethodSignature *)(id)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", sel_JSONObjectWith_Generic_info_);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_NEVER);
    v2->_q = (OS_dispatch_queue *)dispatch_queue_create("CLLogFormatter", v3);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_selectorForType = 0;
  self->_formatterSignature = 0;

  self->_q = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLLogFormatter;
  -[CLLogFormatter dealloc](&v3, sel_dealloc);
}

- (SEL)selectorForType:(id)a3
{
  NSObject *q;
  uint64_t v6;
  const char *v7;
  NSObject *v9;
  _QWORD v10[7];
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  q = self->_q;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CLLogFormatter_selectorForType___block_invoke;
  block[3] = &unk_24E598548;
  block[5] = a3;
  block[6] = &v12;
  block[4] = self;
  dispatch_sync(q, block);
  v7 = (const char *)v13[3];
  if (!v7)
  {
    v9 = self->_q;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __34__CLLogFormatter_selectorForType___block_invoke_2;
    v10[3] = &unk_24E598548;
    v10[5] = a3;
    v10[6] = &v12;
    v10[4] = self;
    dispatch_barrier_sync(v9, v10);
    v7 = (const char *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __34__CLLogFormatter_selectorForType___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]), "pointerValue");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __34__CLLogFormatter_selectorForType___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)), "pointerValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("_"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("JSONObjectWith_%@:info:"), v3));
    if ((objc_opt_respondsToSelector() & 1) == 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sel_JSONObjectWith_Generic_info_;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (id)JSONObjectWithType:(const char *)a3 value:(id)a4 info:(os_log_type_info_s *)a5
{
  void *v7;
  void *v9;
  os_log_type_info_s *v10;
  id v11;

  v10 = a5;
  v11 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", self->_formatterSignature);
  objc_msgSend(v7, "setSelector:", -[CLLogFormatter selectorForType:](self, "selectorForType:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3)));
  objc_msgSend(v7, "setTarget:", self);
  objc_msgSend(v7, "setArgument:atIndex:", &v11, 2);
  objc_msgSend(v7, "setArgument:atIndex:", &v10, 3);
  objc_msgSend(v7, "invoke");
  v9 = 0;
  objc_msgSend(v7, "getReturnValue:", &v9);
  return v9;
}

- (id)JSONObjectWith_Generic:(id)a3 info:(os_log_type_info_s *)a4
{
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("type");
  v5[1] = CFSTR("expected type");
  v6[0] = CFSTR("decode failure");
  v6[1] = CFSTR("Generic");
  v5[2] = CFSTR("raw value");
  v6[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
}

- (id)JSONObjectWith_escape_only:(id)a3 info:(os_log_type_info_s *)a4
{
  size_t v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = strlen((const char *)objc_msgSend(a3, "UTF8String"));
    if (v5 != objc_msgSend(a3, "length"))
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(a3, "UTF8String"));
  }
  else
  {
    v7[0] = CFSTR("type");
    v7[1] = CFSTR("expected type");
    v8[0] = CFSTR("decode failure");
    v8[1] = CFSTR("NSString");
    v7[2] = CFSTR("raw value");
    v8[2] = a3;
    return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  }
  return a3;
}

- (id)JSONObjectWith_CLClientLocationReferenceFrame:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E598568 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientLocationReferenceFrame");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLClientLocationSuitability:(id)a3 info:(os_log_type_info_s *)a4
{
  int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    switch(v5)
    {
      case 1:
        return CFSTR("RouteGuidance");
      case 0xFFFF:
        return CFSTR("Any");
      case 2:
        return CFSTR("Other");
    }
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientLocationSuitability");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLLocationDictionaryUtilitiesEntityClass:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0xA)
      return (id)*((_QWORD *)&off_24E598580 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientAuthorizationStatus");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLLocationDictionaryUtilitiesArrowState:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 4)
      return (id)*((_QWORD *)&off_24E5985D0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientAuthorizationStatus");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLClientAuthorizationStatus:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 5)
      return (id)*((_QWORD *)&off_24E5985F0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientAuthorizationStatus");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLClientCorrectiveCompensation:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E598618 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientCorrectiveCompensation");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLRegionState:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E598630 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLRegionState");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLDaemonLocation:(id)a3 info:(os_log_type_info_s *)a4
{
  const void *v12;
  size_t v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unsigned int __dst;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unsigned int v30;
  double v31;
  _BYTE v32[20];
  double v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  char v38;
  _QWORD v39[23];
  _QWORD v40[23];
  _QWORD v41[3];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __dst = 0xFFFF;
    v24 = 0.0;
    v25 = 0.0;
    __asm { FMOV            V0.2D, #-1.0 }
    v26 = xmmword_21FD5B970;
    v27 = _Q0;
    v28 = _Q0;
    v29 = _Q0;
    v30 = 0;
    v31 = -1.0;
    memset(v32, 0, sizeof(v32));
    v33 = -1.0;
    v34 = 0x7FFFFFFF;
    v37 = 0.0;
    v35 = 0;
    v36 = 0;
    v38 = 0;
    v12 = (const void *)objc_msgSend(a3, "bytes");
    if ((unint64_t)objc_msgSend(a3, "length") <= 0x9C)
      v13 = objc_msgSend(a3, "length");
    else
      v13 = 156;
    memcpy(&__dst, v12, v13);
    v18 = -[CLLogFormatter JSONObjectWith_CLClientLocationSuitability:info:](self, "JSONObjectWith_CLClientLocationSuitability:info:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", __dst), a4);
    v19 = -[CLLogFormatter JSONObjectWith_CLClientLocationReferenceFrame:info:](self, "JSONObjectWith_CLClientLocationReferenceFrame:info:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v35)), a4);
    v20 = -[CLLogFormatter JSONObjectWith_CLClientLocationReferenceFrame:info:](self, "JSONObjectWith_CLClientLocationReferenceFrame:info:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v36), a4);
    v21 = -[CLLogFormatter JSONObjectWith_CLLocationType:info:](self, "JSONObjectWith_CLLocationType:info:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)v32), a4);
    v40[0] = v18;
    v39[0] = CFSTR("suitability");
    v39[1] = CFSTR("lat");
    v40[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
    v39[2] = CFSTR("lon");
    v40[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25);
    v39[3] = CFSTR("horizontalAccuracy");
    v40[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v26);
    v39[4] = CFSTR("altitude");
    v40[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)&v26 + 1));
    v39[5] = CFSTR("ellipsoidalAltitude");
    v40[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v37);
    v39[6] = CFSTR("verticalAccuracy");
    v40[6] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v27);
    v39[7] = CFSTR("speed");
    v40[7] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)&v27 + 1));
    v39[8] = CFSTR("speedAccuracy");
    v40[8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v28);
    v39[9] = CFSTR("course");
    v40[9] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)&v28 + 1));
    v39[10] = CFSTR("courseAccuracy");
    v40[10] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v29);
    v39[11] = CFSTR("timestamp");
    v40[11] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)&v29 + 1));
    v39[12] = CFSTR("confidence");
    v40[12] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30);
    v39[13] = CFSTR("lifespan");
    v40[13] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31);
    v40[14] = v21;
    v39[14] = CFSTR("type");
    v39[15] = CFSTR("rawLat");
    v40[15] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v32[4]);
    v39[16] = CFSTR("rawLon");
    v40[16] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v32[12]);
    v39[17] = CFSTR("rawCourse");
    v40[17] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33);
    v39[18] = CFSTR("floor");
    v40[18] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v34);
    v39[19] = CFSTR("integrity");
    v40[19] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v35);
    v40[20] = v19;
    v39[20] = CFSTR("referenceFrame");
    v39[21] = CFSTR("rawReferenceFrame");
    v40[21] = v20;
    v39[22] = CFSTR("fromSimulationController");
    v40[22] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v38 != 0);
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = v40;
    v16 = v39;
    v17 = 23;
  }
  else
  {
    v41[0] = CFSTR("type");
    v41[1] = CFSTR("expected type");
    v41[2] = CFSTR("raw value");
    v42[0] = CFSTR("decode failure");
    v42[1] = CFSTR("CLDaemonLocation");
    v42[2] = a3;
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = v42;
    v16 = v41;
    v17 = 3;
  }
  return (id)objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
}

- (id)JSONObjectWith_CLClientManager_Type__AuthorizationRequestType:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0x11)
      return (id)*((_QWORD *)&off_24E598648 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientManager_Type::AuthorizationRequestType");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLClientInUseLevel:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 6)
      return (id)*((_QWORD *)&off_24E5986D0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("ClientInUseLevel");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_SqliteResult:(id)a3 info:(os_log_type_info_s *)a4
{
  int v5;
  id result;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "length") != 4)
  {
    v12[0] = CFSTR("type");
    v12[1] = CFSTR("expected type");
    v13[0] = CFSTR("decode failure");
    v13[1] = CFSTR("SqliteResult");
    v12[2] = CFSTR("raw value");
    v13[2] = a3;
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = v13;
    v9 = v12;
    return (id)objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 3);
  }
  v5 = *(_DWORD *)objc_msgSend(a3, "bytes");
  if (v5 <= 515)
  {
    if (v5 > 99)
    {
      switch(v5)
      {
        case 261:
          return CFSTR("SQLITE_BUSY_RECOVERY");
        case 262:
          return CFSTR("SQLITE_LOCKED_SHAREDCACHE");
        case 263:
        case 265:
        case 268:
        case 269:
        case 271:
        case 272:
        case 273:
        case 274:
        case 276:
        case 277:
        case 278:
        case 280:
        case 281:
        case 282:
          goto LABEL_150;
        case 264:
          return CFSTR("SQLITE_READONLY_RECOVERY");
        case 266:
          return CFSTR("SQLITE_IOERR_READ");
        case 267:
          return CFSTR("SQLITE_CORRUPT_VTAB");
        case 270:
          return CFSTR("SQLITE_CANTOPEN_NOTEMPDIR");
        case 275:
          return CFSTR("SQLITE_CONSTRAINT_CHECK");
        case 279:
          return CFSTR("SQLITE_AUTH_USER");
        case 283:
          return CFSTR("SQLITE_NOTICE_RECOVER_WAL");
        case 284:
          return CFSTR("SQLITE_WARNING_AUTOINDEX");
        default:
          if (v5 == 100)
          {
            result = CFSTR("SQLITE_ROW");
          }
          else
          {
            if (v5 != 101)
              goto LABEL_150;
            result = CFSTR("SQLITE_DONE");
          }
          break;
      }
    }
    else
    {
      result = CFSTR("SQLITE_OK");
      switch(v5)
      {
        case 0:
          return result;
        case 1:
          result = CFSTR("SQLITE_ERROR");
          break;
        case 2:
          result = CFSTR("SQLITE_INTERNAL");
          break;
        case 3:
          result = CFSTR("SQLITE_PERM");
          break;
        case 4:
          result = CFSTR("SQLITE_ABORT");
          break;
        case 5:
          result = CFSTR("SQLITE_BUSY");
          break;
        case 6:
          result = CFSTR("SQLITE_LOCKED");
          break;
        case 7:
          result = CFSTR("SQLITE_NOMEM");
          break;
        case 8:
          result = CFSTR("SQLITE_READONLY");
          break;
        case 9:
          result = CFSTR("SQLITE_INTERRUPT");
          break;
        case 10:
          result = CFSTR("SQLITE_IOERR");
          break;
        case 11:
          result = CFSTR("SQLITE_CORRUPT");
          break;
        case 12:
          result = CFSTR("SQLITE_NOTFOUND");
          break;
        case 13:
          result = CFSTR("SQLITE_FULL");
          break;
        case 14:
          result = CFSTR("SQLITE_CANTOPEN");
          break;
        case 15:
          result = CFSTR("SQLITE_PROTOCOL");
          break;
        case 16:
          result = CFSTR("SQLITE_EMPTY");
          break;
        case 17:
          result = CFSTR("SQLITE_SCHEMA");
          break;
        case 18:
          result = CFSTR("SQLITE_TOOBIG");
          break;
        case 19:
          result = CFSTR("SQLITE_CONSTRAINT");
          break;
        case 20:
          result = CFSTR("SQLITE_MISMATCH");
          break;
        case 21:
          result = CFSTR("SQLITE_MISUSE");
          break;
        case 22:
          result = CFSTR("SQLITE_NOLFS");
          break;
        case 23:
          result = CFSTR("SQLITE_AUTH");
          break;
        case 24:
          result = CFSTR("SQLITE_FORMAT");
          break;
        case 25:
          result = CFSTR("SQLITE_RANGE");
          break;
        case 26:
          result = CFSTR("SQLITE_NOTADB");
          break;
        case 27:
          result = CFSTR("SQLITE_NOTICE");
          break;
        case 28:
          result = CFSTR("SQLITE_WARNING");
          break;
        default:
          goto LABEL_150;
      }
    }
  }
  else
  {
    if (v5 > 2066)
    {
      if (v5 <= 4361)
      {
        if (v5 <= 2825)
        {
          if (v5 <= 2322)
          {
            if (v5 == 2067)
              return CFSTR("SQLITE_CONSTRAINT_UNIQUE");
            if (v5 == 2314)
              return CFSTR("SQLITE_IOERR_RDLOCK");
          }
          else
          {
            switch(v5)
            {
              case 2323:
                return CFSTR("SQLITE_CONSTRAINT_VTAB");
              case 2570:
                return CFSTR("SQLITE_IOERR_DELETE");
              case 2579:
                return CFSTR("SQLITE_CONSTRAINT_ROWID");
            }
          }
        }
        else if (v5 > 3593)
        {
          switch(v5)
          {
            case 3594:
              return CFSTR("SQLITE_IOERR_CHECKRESERVEDLOCK");
            case 3850:
              return CFSTR("SQLITE_IOERR_LOCK");
            case 4106:
              return CFSTR("SQLITE_IOERR_CLOSE");
          }
        }
        else
        {
          switch(v5)
          {
            case 2826:
              return CFSTR("SQLITE_IOERR_BLOCKED");
            case 3082:
              return CFSTR("SQLITE_IOERR_NOMEM");
            case 3338:
              return CFSTR("SQLITE_IOERR_ACCESS");
          }
        }
      }
      else if (v5 > 5897)
      {
        if (v5 > 6665)
        {
          switch(v5)
          {
            case 6666:
              return CFSTR("SQLITE_IOERR_CONVPATH");
            case 6922:
              return CFSTR("SQLITE_IOERR_VNODE");
            case 7178:
              return CFSTR("SQLITE_IOERR_AUTH");
          }
        }
        else
        {
          switch(v5)
          {
            case 5898:
              return CFSTR("SQLITE_IOERR_DELETE_NOENT");
            case 6154:
              return CFSTR("SQLITE_IOERR_MMAP");
            case 6410:
              return CFSTR("SQLITE_IOERR_GETTEMPPATH");
          }
        }
      }
      else if (v5 > 5129)
      {
        switch(v5)
        {
          case 5130:
            return CFSTR("SQLITE_IOERR_SHMLOCK");
          case 5386:
            return CFSTR("SQLITE_IOERR_SHMMAP");
          case 5642:
            return CFSTR("SQLITE_IOERR_SEEK");
        }
      }
      else
      {
        switch(v5)
        {
          case 4362:
            return CFSTR("SQLITE_IOERR_DIR_CLOSE");
          case 4618:
            return CFSTR("SQLITE_IOERR_SHMOPEN");
          case 4874:
            return CFSTR("SQLITE_IOERR_SHMSIZE");
        }
      }
      goto LABEL_150;
    }
    if (v5 > 1031)
    {
      if (v5 <= 1298)
      {
        if (v5 <= 1037)
        {
          if (v5 == 1032)
            return CFSTR("SQLITE_READONLY_DBMOVED");
          if (v5 == 1034)
            return CFSTR("SQLITE_IOERR_FSYNC");
        }
        else
        {
          switch(v5)
          {
            case 1038:
              return CFSTR("SQLITE_CANTOPEN_CONVPATH");
            case 1043:
              return CFSTR("SQLITE_CONSTRAINT_FUNCTION");
            case 1290:
              return CFSTR("SQLITE_IOERR_DIR_FSYNC");
          }
        }
      }
      else if (v5 > 1801)
      {
        switch(v5)
        {
          case 1802:
            return CFSTR("SQLITE_IOERR_FSTAT");
          case 1811:
            return CFSTR("SQLITE_CONSTRAINT_TRIGGER");
          case 2058:
            return CFSTR("SQLITE_IOERR_UNLOCK");
        }
      }
      else
      {
        switch(v5)
        {
          case 1299:
            return CFSTR("SQLITE_CONSTRAINT_NOTNULL");
          case 1546:
            return CFSTR("SQLITE_IOERR_TRUNCATE");
          case 1555:
            return CFSTR("SQLITE_CONSTRAINT_PRIMARYKEY");
        }
      }
      goto LABEL_150;
    }
    if (v5 > 530)
    {
      if (v5 > 777)
      {
        switch(v5)
        {
          case 778:
            return CFSTR("SQLITE_IOERR_WRITE");
          case 782:
            return CFSTR("SQLITE_CANTOPEN_FULLPATH");
          case 787:
            return CFSTR("SQLITE_CONSTRAINT_FOREIGNKEY");
        }
      }
      else
      {
        switch(v5)
        {
          case 531:
            return CFSTR("SQLITE_CONSTRAINT_COMMITHOOK");
          case 539:
            return CFSTR("SQLITE_NOTICE_RECOVER_ROLLBACK");
          case 776:
            return CFSTR("SQLITE_READONLY_ROLLBACK");
        }
      }
LABEL_150:
      v10[0] = CFSTR("type");
      v10[1] = CFSTR("expected type");
      v11[0] = CFSTR("decode failure");
      v11[1] = CFSTR("SqliteResult");
      v10[2] = CFSTR("raw value");
      v11[2] = a3;
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = v11;
      v9 = v10;
      return (id)objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 3);
    }
    switch(v5)
    {
      case 516:
        result = CFSTR("SQLITE_ABORT_ROLLBACK");
        break;
      case 517:
        result = CFSTR("SQLITE_BUSY_SNAPSHOT");
        break;
      case 520:
        result = CFSTR("SQLITE_READONLY_CANTLOCK");
        break;
      case 522:
        result = CFSTR("SQLITE_IOERR_SHORT_READ");
        break;
      case 526:
        result = CFSTR("SQLITE_CANTOPEN_ISDIR");
        break;
      default:
        goto LABEL_150;
    }
  }
  return result;
}

- (id)JSONObjectWith_CLLocationProvider_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0x31)
      return (id)*((_QWORD *)&off_24E598700 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLLocationProvider_Type::Notification");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLLocationStreamingGranularity:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 4)
      return (id)*((_QWORD *)&off_24E598888 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLLocationStreamingGranularity");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLStreamingAwareLocationProviderNoLocalGPSStateMachine__LocationSourceState:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 5)
      return (id)*((_QWORD *)&off_24E5988A8 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLStreamingAwareLocationProviderNoLocalGPSStateMachine::LocationSourceState");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLStreamingAwareLocationProviderLocalGPSStateMachine__LocationSourceState:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 6)
      return (id)*((_QWORD *)&off_24E5988D0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLStreamingAwareLocationProviderLocalGPSStateMachine::LocationSourceState");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLStreamingAwareLocationProviderLocalGPSStateMachine__WorkoutState:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E598900 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLStreamingAwareLocationProviderLocalGPSStateMachine::LocationSourceState");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLStreamingAwareLocationProviderStateMachine__LocationSource:(id)a3 info:(os_log_type_info_s *)a4
{
  int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (!v5)
      return CFSTR("CLStreamingAwareLocationProviderStateMachine::kLocationSourceLocal");
    if (v5 == 1)
      return CFSTR("CLStreamingAwareLocationProviderStateMachine::kLocationSourceRemote");
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLStreamingAwareLocationProviderStateMachine::LocationSource");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLLocationProvider_Type__MotionDetected:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E598918 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLLocationProvider_Type::MotionDetected");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLLocationType:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0xF)
      return (id)*((_QWORD *)&off_24E598930 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLLocationType");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLDaemonLocationPrivate__OriginDevice:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E5989A8 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientLocationOriginDevice");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_IOMessage:(id)a3 info:(os_log_type_info_s *)a4
{
  uint64_t v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "unsignedLongValue");
    if (v5 > 3758096943)
    {
      if (v5 > 3758097151)
      {
        if (v5 > 3758097199)
        {
          switch(v5)
          {
            case 3758097200:
              return CFSTR("CopyClientID");
            case 3758097216:
              return CFSTR("SystemCapabilityChange");
            case 3758097232:
              return CFSTR("DeviceSignaledWakeup");
          }
        }
        else
        {
          switch(v5)
          {
            case 3758097152:
              return CFSTR("SystemHasPoweredOn");
            case 3758097168:
              return CFSTR("SystemWillRestart");
            case 3758097184:
              return CFSTR("SystemWillPowerOn");
          }
        }
      }
      else if (v5 > 3758097007)
      {
        switch(v5)
        {
          case 3758097008:
            return CFSTR("CanSystemSleep");
          case 3758097024:
            return CFSTR("SystemWillSleep");
          case 3758097040:
            return CFSTR("SystemWillNotSleep");
        }
      }
      else
      {
        switch(v5)
        {
          case 3758096944:
            return CFSTR("DeviceHasPoweredOn");
          case 3758096976:
            return CFSTR("SystemWillPowerOff");
          case 3758096981:
            return CFSTR("SystemPagingOff");
        }
      }
    }
    else if (v5 > 3758096671)
    {
      if (v5 > 3758096895)
      {
        switch(v5)
        {
          case 3758096896:
            return CFSTR("CanDevicePowerOff");
          case 3758096912:
            return CFSTR("DeviceWillPowerOff");
          case 3758096928:
            return CFSTR("DeviceWillNotPowerOff");
        }
      }
      else
      {
        switch(v5)
        {
          case 3758096672:
            return CFSTR("ServiceBusyStateChange");
          case 3758096680:
            return CFSTR("ConsoleSecurityChange");
          case 3758096688:
            return CFSTR("ServicePropertyChange");
        }
      }
    }
    else if (v5 > 3758096639)
    {
      switch(v5)
      {
        case 3758096640:
          return CFSTR("ServiceIsRequestingClose");
        case 3758096641:
          return CFSTR("ServiceIsAttemptingOpen");
        case 3758096656:
          return CFSTR("ServiceWasClosed");
      }
    }
    else
    {
      switch(v5)
      {
        case 3758096400:
          return CFSTR("ServiceIsTerminated");
        case 3758096416:
          return CFSTR("ServiceIsSuspended");
        case 3758096432:
          return CFSTR("ServiceIsResumed");
      }
    }
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("IOMessage");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLDaemonStatus_Type__Reachability:(id)a3 info:(os_log_type_info_s *)a4
{
  int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 > 1)
    {
      if (v5 == 2)
        return CFSTR("kReachabilityLarge");
      if (v5 == 1000)
        return CFSTR("kReachabilityUnachievable");
    }
    else
    {
      if (!v5)
        return CFSTR("kReachabilityUnavailable");
      if (v5 == 1)
        return CFSTR("kReachabilitySmall");
    }
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLDaemonStatus_Type::Reachability");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLBatteryChargerType:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 5)
      return (id)*((_QWORD *)&off_24E5989C0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLBatteryChargerType");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLDaemonStatus_Type__Battery:(id)a3 info:(os_log_type_info_s *)a4
{
  uint64_t v7;
  double v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18[0] = CFSTR("type");
    v18[1] = CFSTR("expected type");
    v19[0] = CFSTR("decode failure");
    v19[1] = CFSTR("CLDaemonStatus_Type::Battery");
    v18[2] = CFSTR("raw value");
    v19[2] = a3;
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = v19;
    v15 = v18;
LABEL_6:
    v16 = 3;
    return (id)objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
  }
  if (objc_msgSend(a3, "length") != 24)
  {
    v22[0] = CFSTR("type");
    v22[1] = CFSTR("expected type");
    v23[0] = CFSTR("decode failure");
    v23[1] = CFSTR("CLDaemonStatus_Type::Battery");
    v22[2] = CFSTR("raw value");
    v23[2] = a3;
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = v23;
    v15 = v22;
    goto LABEL_6;
  }
  v7 = objc_msgSend(a3, "bytes");
  v8 = *(double *)v7;
  v9 = *(_BYTE *)(v7 + 8);
  v10 = *(_BYTE *)(v7 + 9);
  v11 = *(_BYTE *)(v7 + 16);
  v12 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v7 + 12));
  v20[0] = CFSTR("level");
  v21[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v20[1] = CFSTR("charged");
  v21[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9 & 1);
  v20[2] = CFSTR("connected");
  v21[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10 & 1);
  v20[3] = CFSTR("chargerType");
  v21[3] = -[CLLogFormatter JSONObjectWith_CLBatteryChargerType:info:](self, "JSONObjectWith_CLBatteryChargerType:info:", v12, a4);
  v20[4] = CFSTR("wasConnected");
  v21[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11 & 1);
  v13 = (void *)MEMORY[0x24BDBCE70];
  v14 = v21;
  v15 = v20;
  v16 = 5;
  return (id)objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
}

- (id)JSONObjectWith_CLClientServiceTypeMask:(id)a3 info:(os_log_type_info_s *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12[0] = CFSTR("type");
    v12[1] = CFSTR("expected type");
    v13[0] = CFSTR("decode failure");
    v13[1] = CFSTR("CLClientServiceTypeMask");
    v12[2] = CFSTR("raw value");
    v13[2] = a3;
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = v13;
    v10 = v12;
    return (id)objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 3);
  }
  v5 = objc_msgSend(a3, "integerValue");
  v6 = (id)objc_opt_new();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "addObject:", CFSTR("RegionBeacon"));
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v7, "addObject:", CFSTR("RegionCircular"));
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v7, "addObject:", CFSTR("Ranging"));
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v7, "addObject:", CFSTR("PersistentSLC"));
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v7, "addObject:", CFSTR("Location"));
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v7, "addObject:", CFSTR("BackgroundLocation"));
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v7, "addObject:", CFSTR("SLV"));
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v7, "addObject:", CFSTR("RemoteLocation_Deprecated"));
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
LABEL_29:
    objc_msgSend(v7, "addObject:", CFSTR("RemoteRegionCircular_Deprecated"));
    if ((v5 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_28:
  objc_msgSend(v7, "addObject:", CFSTR("MicroLocation_Deprecated"));
  if ((v5 & 0x200) != 0)
    goto LABEL_29;
LABEL_12:
  if ((v5 & 0x800) != 0)
LABEL_13:
    objc_msgSend(v7, "addObject:", CFSTR("NonPersistentSLC"));
LABEL_14:
  if (!objc_msgSend(v7, "count") && v5)
  {
    v14[0] = CFSTR("type");
    v14[1] = CFSTR("expected type");
    v15[0] = CFSTR("decode failure");
    v15[1] = CFSTR("CLClientServiceTypeMask");
    v14[2] = CFSTR("raw value");
    v15[2] = a3;
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = v15;
    v10 = v14;
    return (id)objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 3);
  }
  return v7;
}

- (id)JSONObjectWith_CLTelephonyService_Type__Cell:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[8];
  _QWORD v22[8];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19[0] = CFSTR("type");
    v19[1] = CFSTR("expected type");
    v20[0] = CFSTR("decode failure");
    v20[1] = CFSTR("CLTelephonyService_Type::Cell");
    v19[2] = CFSTR("raw value");
    v20[2] = a3;
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = v20;
    v16 = v19;
LABEL_6:
    v17 = 3;
    return (id)objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
  }
  if (objc_msgSend(a3, "length") != 32)
  {
    v23[0] = CFSTR("type");
    v23[1] = CFSTR("expected type");
    v24[0] = CFSTR("decode failure");
    v24[1] = CFSTR("CLTelephonyService_Type::Cell");
    v23[2] = CFSTR("raw value");
    v24[2] = a3;
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = v24;
    v16 = v23;
    goto LABEL_6;
  }
  v5 = (unsigned int *)objc_msgSend(a3, "bytes");
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  v11 = v5[4];
  v10 = v5[5];
  v13 = v5[6];
  v12 = v5[7];
  v21[0] = CFSTR("mcc");
  v22[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v21[1] = CFSTR("mnc");
  v22[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v21[2] = CFSTR("lac");
  v22[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v21[3] = CFSTR("ci");
  v22[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
  v21[4] = CFSTR("uarfcn");
  v22[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
  v21[5] = CFSTR("psc");
  v22[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
  v21[6] = CFSTR("rscp");
  v22[6] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
  v21[7] = CFSTR("ecn0");
  v22[7] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
  v14 = (void *)MEMORY[0x24BDBCE70];
  v15 = v22;
  v16 = v21;
  v17 = 8;
  return (id)objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
}

- (id)JSONObjectWith_PSYSyncRestriction:(id)a3 info:(os_log_type_info_s *)a4
{
  uint64_t v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "longLongValue");
    if (!v5)
      return CFSTR("PSYSyncRestrictionNone");
    if (v5 == 1)
      return CFSTR("PSYSyncRestrictionLimitPush");
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("PSYSyncRestriction");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_PSYSyncSessionType:(id)a3 info:(os_log_type_info_s *)a4
{
  uint64_t v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "longLongValue");
    if (!v5)
      return CFSTR("PSYSyncSessionTypeFullSync");
    if (v5 == 1)
      return CFSTR("PSYSyncSessionTypeReunionSync");
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("PSYSyncSessionType");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_SYSessionState:(id)a3 info:(os_log_type_info_s *)a4
{
  unint64_t v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "longLongValue");
    if (v5 < 0xA)
      return (id)*((_QWORD *)&off_24E5989E8 + v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("SYSessionState");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLMonitoringState:(id)a3 info:(os_log_type_info_s *)a4
{
  unint64_t v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "longLongValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E598A38 + v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLMonitoringState");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLFenceManager_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0xC)
      return (id)*((_QWORD *)&off_24E598A50 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLFenceManager_Type::Notification");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLBTLEFenceManager_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 4)
      return (id)*((_QWORD *)&off_24E598AB0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLBTLEFenceManager_Type::Notification");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLMotionActivity__Type:(id)a3 info:(os_log_type_info_s *)a4
{
  int v5;
  int v6;
  id result;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_105:
    v8[0] = CFSTR("type");
    v8[1] = CFSTR("expected type");
    v9[0] = CFSTR("decode failure");
    v9[1] = CFSTR("CLMotionActivity::Type");
    v8[2] = CFSTR("raw value");
    v9[2] = a3;
    return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  }
  v5 = objc_msgSend(a3, "intValue");
  v6 = v5;
  if (v5 > 11804)
  {
    if (v5 > 15651)
    {
      if (v5 > 18199)
      {
        if (v5 <= 19149)
        {
          if (v5 > 19029)
          {
            if (v5 == 19030)
              return CFSTR("CLMotionActivity::kTypeIndoorSkatingSports");
            if (v5 == 19090)
              return CFSTR("CLMotionActivity::kTypeCrossCountrySkiing");
          }
          else
          {
            if (v5 == 18200)
              return CFSTR("CLMotionActivity::kTypeScubaDiving");
            if (v5 == 18240)
              return CFSTR("CLMotionActivity::kTypeSwimming");
          }
        }
        else if (v5 <= 515620)
        {
          if (v5 == 19150)
            return CFSTR("CLMotionActivity::kTypeDownhillSkiing");
          if (v5 == 90603)
            return CFSTR("CLMotionActivity::kTypeOutdoorWheelchair");
        }
        else
        {
          switch(v5)
          {
            case 515621:
              return CFSTR("CLMotionActivity::kTypeBaseball");
            case 515652:
              return CFSTR("CLMotionActivity::kTypeRacquetball");
            case 519150:
              return CFSTR("CLMotionActivity::kTypeSnowboarding");
          }
        }
      }
      else if (v5 <= 15710)
      {
        if (v5 > 15669)
        {
          if (v5 == 15670)
            return CFSTR("CLMotionActivity::kTypeTaiChi");
          if (v5 == 15675)
            return CFSTR("CLMotionActivity::kTypeTennis");
        }
        else
        {
          if (v5 == 15652)
            return CFSTR("CLMotionActivity::kTypeSquash");
          if (v5 == 15660)
            return CFSTR("CLMotionActivity::kTypeTableTennis");
        }
      }
      else if (v5 <= 17149)
      {
        if (v5 == 15711)
          return CFSTR("CLMotionActivity::kTypeVolleyball");
        if (v5 == 15733)
          return CFSTR("CLMotionActivity::kTypeTrackAndField");
      }
      else
      {
        switch(v5)
        {
          case 17150:
            return CFSTR("CLMotionActivity::kTypeIndoorWalking");
          case 18050:
            return CFSTR("CLMotionActivity::kTypeOutdoorRowing");
          case 18100:
            return CFSTR("CLMotionActivity::kTypePaddleSports");
        }
      }
    }
    else if (v5 > 15254)
    {
      if (v5 <= 15459)
      {
        if (v5 > 15349)
        {
          if (v5 == 15350)
            return CFSTR("CLMotionActivity::kTypeOutdoorHockey");
          if (v5 == 15360)
            return CFSTR("CLMotionActivity::kTypeIndoorHockey");
        }
        else
        {
          if (v5 == 15255)
            return CFSTR("CLMotionActivity::kTypeGolfing");
          if (v5 == 15330)
            return CFSTR("CLMotionActivity::kTypeHandball");
        }
      }
      else if (v5 <= 15591)
      {
        if (v5 == 15460)
          return CFSTR("CLMotionActivity::kTypeLacrosse");
        if (v5 == 15560)
          return CFSTR("CLMotionActivity::kTypeRugby");
      }
      else
      {
        switch(v5)
        {
          case 15592:
            return CFSTR("CLMotionActivity::kTypeOutdoorSkatingSports");
          case 15610:
            return CFSTR("CLMotionActivity::kTypeOutdoorSoccer");
          case 15620:
            return CFSTR("CLMotionActivity::kTypeSoftball");
        }
      }
    }
    else if (v5 <= 15099)
    {
      if (v5 > 15029)
      {
        if (v5 == 15030)
          return CFSTR("CLMotionActivity::kTypeBadminton");
        if (v5 == 15055)
          return CFSTR("CLMotionActivity::kTypeBasketball");
      }
      else
      {
        if (v5 == 11805)
          return CFSTR("CLMotionActivity::kTypePushingWheelchair");
        if (v5 == 12150)
          return CFSTR("CLMotionActivity::kTypeIndoorRunning");
      }
    }
    else if (v5 <= 15149)
    {
      if (v5 == 15100)
        return CFSTR("CLMotionActivity::kTypeBoxing");
      if (v5 == 15110)
        return CFSTR("CLMotionActivity::kTypeKickboxing");
    }
    else
    {
      switch(v5)
      {
        case 15150:
          return CFSTR("CLMotionActivity::kTypeCricket");
        case 15230:
          return CFSTR("CLMotionActivity::kTypeAmericanFootball");
        case 15250:
          return CFSTR("CLMotionActivity::kTypeDiscSports");
      }
    }
    goto LABEL_105;
  }
  if (v5 > 99)
  {
    if (v5 <= 2064)
    {
      if (v5 <= 2021)
      {
        switch(v5)
        {
          case 100:
            return CFSTR("CLMotionActivity::kTypeCyclingLeg");
          case 2010:
            return CFSTR("CLMotionActivity::kTypeStationaryCycling");
          case 2020:
            return CFSTR("CLMotionActivity::kTypeCalisthenics");
        }
      }
      else if (v5 > 2047)
      {
        if (v5 == 2048)
          return CFSTR("CLMotionActivity::kTypeElliptical");
        if (v5 == 2061)
          return CFSTR("CLMotionActivity::kTypeCrossTraining");
      }
      else
      {
        if (v5 == 2022)
          return CFSTR("CLMotionActivity::kTypeFunctionalStrength");
        if (v5 == 2024)
          return CFSTR("CLMotionActivity::kTypeCoreTraining");
      }
    }
    else if (v5 > 2104)
    {
      if (v5 > 3014)
      {
        if (v5 == 3015)
          return CFSTR("CLMotionActivity::kTypeDancing");
        if (v5 == 3016)
          return CFSTR("CLMotionActivity::kTypeStepTraining");
      }
      else
      {
        if (v5 == 2105)
          return CFSTR("CLMotionActivity::kTypePilates");
        if (v5 == 2150)
          return CFSTR("CLMotionActivity::kTypeYoga");
      }
    }
    else if (v5 > 2070)
    {
      if (v5 == 2071)
        return CFSTR("CLMotionActivity::kTypeRowing");
      if (v5 == 2101)
        return CFSTR("CLMotionActivity::kTypeCoolDown");
    }
    else
    {
      if (v5 == 2065)
        return CFSTR("CLMotionActivity::kTypeStairClimbing");
      if (v5 == 2068)
        return CFSTR("CLMotionActivity::kTypeJumpRope");
    }
    goto LABEL_105;
  }
  result = CFSTR("CLMotionActivity::kTypeUnknown");
  switch(v6)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("CLMotionActivity::kTypeFrozen");
      break;
    case 2:
      result = CFSTR("CLMotionActivity::kTypeStatic");
      break;
    case 3:
      result = CFSTR("CLMotionActivity::kTypeMoving");
      break;
    case 4:
      result = CFSTR("CLMotionActivity::kTypeWalking");
      break;
    case 5:
      result = CFSTR("CLMotionActivity::kTypeDriving");
      break;
    case 6:
      result = CFSTR("CLMotionActivity::kTypeCycling");
      break;
    case 7:
      result = CFSTR("CLMotionActivity::kTypeSemiStationary");
      break;
    case 8:
      result = CFSTR("CLMotionActivity::kTypeRunning");
      break;
    case 9:
      result = CFSTR("CLMotionActivity::kTypeMovingCoarse");
      break;
    case 10:
      result = CFSTR("CLMotionActivity::kTypeInVehicleFrozen");
      break;
    case 11:
      result = CFSTR("CLMotionActivity::kTypeInVehicleStatic");
      break;
    default:
      switch(v6)
      {
        case '4':
          result = CFSTR("CLMotionActivity::kTypeVehicularInHand");
          break;
        case '5':
        case '6':
        case '7':
        case '9':
        case ':':
        case ';':
        case '<':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
          goto LABEL_105;
        case '8':
          result = CFSTR("CLMotionActivity::kTypeDrivingOther");
          break;
        case '=':
          result = CFSTR("CLMotionActivity::kTypeMachineWorkout");
          break;
        case '>':
          result = CFSTR("CLMotionActivity::kTypeWorkout");
          break;
        case '?':
          result = CFSTR("CLMotionActivity::kTypeMultiSportTransition");
          break;
        case '@':
          result = CFSTR("CLMotionActivity::kTypeIndoorSoccer");
          break;
        case 'A':
          result = CFSTR("CLMotionActivity::kTypeAustralianFootball");
          break;
        case 'B':
          result = CFSTR("CLMotionActivity::kTypePickleball");
          break;
        case 'G':
          result = CFSTR("CLMotionActivity::kTypeCount");
          break;
        default:
          if (v6 != 41)
            goto LABEL_105;
          result = CFSTR("CLMotionActivity::kTypeWalkingSlow");
          break;
      }
      break;
  }
  return result;
}

- (id)JSONObjectWith_CLMotionActivity__Confidence:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E598AD0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLMotionActivity::Confidence");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLMotionActivity:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19[0] = CFSTR("type");
    v19[1] = CFSTR("expected type");
    v20[0] = CFSTR("decode failure");
    v20[1] = CFSTR("CLMotionActiviy");
    v19[2] = CFSTR("raw value");
    v20[2] = a3;
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = v20;
    v12 = v19;
LABEL_6:
    v13 = 3;
    return (id)objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v13);
  }
  if (objc_msgSend(a3, "length") != 136)
  {
    v17[0] = CFSTR("type");
    v17[1] = CFSTR("expected type");
    v18[0] = CFSTR("decode failure");
    v18[1] = CFSTR("CLMotionActiviy");
    v17[2] = CFSTR("raw value");
    v18[2] = a3;
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = v18;
    v12 = v17;
    goto LABEL_6;
  }
  v7 = (unsigned int *)objc_msgSend(a3, "bytes");
  v8 = v7[1];
  v9 = -[CLLogFormatter JSONObjectWith_CLMotionActivity__Type:info:](self, "JSONObjectWith_CLMotionActivity__Type:info:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *v7), a4);
  v15[0] = CFSTR("type");
  v15[1] = CFSTR("confidence");
  v16[0] = v9;
  v16[1] = -[CLLogFormatter JSONObjectWith_CLMotionActivity__Confidence:info:](self, "JSONObjectWith_CLMotionActivity__Confidence:info:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8), a4);
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = v16;
  v12 = v15;
  v13 = 2;
  return (id)objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v13);
}

- (id)JSONObjectWith_CMWakeGestureWristOrientation:(id)a3 info:(os_log_type_info_s *)a4
{
  int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (!v5)
      return CFSTR("Left");
    if (v5 == 1)
      return CFSTR("Right");
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CMWakeGestureWristOrientation");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CMWakeGestureCrownOrientation:(id)a3 info:(os_log_type_info_s *)a4
{
  int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (!v5)
      return CFSTR("Left");
    if (v5 == 1)
      return CFSTR("Right");
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CMWakeGestureCrownOrientation");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CMWakeGestureState:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 6)
      return (id)*((_QWORD *)&off_24E598AE8 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CMWakeGestureState");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_RTLState:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned __int8 v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 9u)
      return (id)*((_QWORD *)&off_24E598B18 + (char)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("GestureState");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_RTLGestureType:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned __int8 v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0xAu)
      return (id)*((_QWORD *)&off_24E598B60 + (char)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("GestureType");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CMMotionCoprocessorReply_Log:(id)a3 info:(os_log_type_info_s *)a4
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  unsigned __int8 v15;
  unsigned __int16 v16;
  unsigned int v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a3, "length") == 72)
    {
      v5 = (_QWORD *)objc_msgSend(a3, "bytes");
      v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array", *v5, v5[1], v5[2], v5[3], v5[4], v5[5], v5[6], v5[7], v5[8]);
      if (v16 >= 0x10u)
        v7 = 16;
      else
        v7 = v16;
      if ((_DWORD)v7)
      {
        v8 = (unsigned int *)&v18;
        do
        {
          v9 = *v8++;
          objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9));
          --v7;
        }
        while (v7);
      }
      v21[0] = CFSTR("flags");
      v22[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v15);
      v21[1] = CFSTR("seq");
      v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v17);
      v21[2] = CFSTR("data");
      v22[1] = v10;
      v22[2] = v6;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = v22;
      v13 = v21;
    }
    else
    {
      v23[0] = CFSTR("type");
      v23[1] = CFSTR("expected type");
      v24[0] = CFSTR("decode failure");
      v24[1] = CFSTR("CMMotionCoprocessorReply::Log");
      v23[2] = CFSTR("raw value");
      v24[2] = a3;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = v24;
      v13 = v23;
    }
  }
  else
  {
    v19[0] = CFSTR("type");
    v19[1] = CFSTR("expected type");
    v20[0] = CFSTR("decode failure");
    v20[1] = CFSTR("CMMotionCoprocessorReply::Log");
    v19[2] = CFSTR("raw value");
    v20[2] = a3;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = v20;
    v13 = v19;
  }
  return (id)objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 3);
}

- (id)JSONObjectWith_CLSubHarvesterIdentifier:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0xF)
      return (id)*((_QWORD *)&off_24E598BB0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLSubHarvesterIdentifier");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLWifiService_Type__ScanType:(id)a3 info:(os_log_type_info_s *)a4
{
  uint64_t v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (char)objc_msgSend(a3, "intValue") + 1;
    if (v5 < 0xF)
      return (id)*((_QWORD *)&off_24E598C28 + v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLWifiService_Type::ScanType");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_RTRoutineMode:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return (id)*((_QWORD *)&off_24E598CA0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("RTRoutineMode");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_RTLocationOfInterestType:(id)a3 info:(os_log_type_info_s *)a4
{
  unint64_t v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (int)objc_msgSend(a3, "intValue") + 1;
    if (v5 < 5)
      return (id)*((_QWORD *)&off_24E598CB8 + v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("RTLocationOfInterestType");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLAppMonitor_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0xC)
      return (id)*((_QWORD *)&off_24E598CE0 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLAppMonitor_Type::Notification");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith__CLLocationManagerStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4
{
  const void *v5;
  size_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  double v12[2];
  char v13;
  char v14;
  char v15;
  double v16;
  char v17;
  char v18;
  char v19;
  char v20;
  unsigned int v21;
  char v22;
  uint64_t v23;
  unsigned int v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  _QWORD v38[27];
  _QWORD v39[27];
  _QWORD v40[3];
  _QWORD v41[4];

  v41[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (const void *)objc_msgSend(a3, "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    if ((unint64_t)objc_msgSend(a3, "length") <= 0x50)
      v6 = objc_msgSend(a3, "length");
    else
      v6 = 80;
    memcpy(v12, v5, v6);
    v38[0] = CFSTR("distanceFilter");
    v39[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12[0]);
    v38[1] = CFSTR("desiredAccuracy");
    v39[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12[1]);
    v38[2] = CFSTR("updatingLocation");
    v39[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13 & 1);
    v38[3] = CFSTR("requestingLocation");
    v39[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14 & 1);
    v38[4] = CFSTR("updatingHeading");
    v39[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15 & 1);
    v38[5] = CFSTR("headingFilter");
    v39[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
    v38[6] = CFSTR("allowsLocationPrompts");
    v39[6] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17 & 1);
    v38[7] = CFSTR("allowsAlteredAccessoryLocations");
    v39[7] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18 & 1);
    v38[8] = CFSTR("dynamicAccuracyReductionEnabled");
    v39[8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v19 & 1);
    v38[9] = CFSTR("previousAuthorizationStatusValid");
    v39[9] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v20 & 1);
    v38[10] = CFSTR("previousAuthorizationStatus");
    v39[10] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v21);
    v38[11] = CFSTR("limitsPrecision");
    v39[11] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v22 & 1);
    v38[12] = CFSTR("activityType");
    v39[12] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23);
    v38[13] = CFSTR("pausesLocationUpdatesAutomatically");
    v39[13] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v24);
    v38[14] = CFSTR("paused");
    v39[14] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v25 & 1);
    v38[15] = CFSTR("allowsBackgroundLocationUpdates");
    v39[15] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v26 & 1);
    v38[16] = CFSTR("showsBackgroundLocationIndicator");
    v39[16] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27 & 1);
    v38[17] = CFSTR("allowsMapCorrection");
    v39[17] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28 & 1);
    v38[18] = CFSTR("batchingLocation");
    v39[18] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v29 & 1);
    v38[19] = CFSTR("updatingVehicleSpeed");
    v39[19] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v30 & 1);
    v38[20] = CFSTR("updatingVehicleHeading");
    v39[20] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31 & 1);
    v38[21] = CFSTR("matchInfoEnabled");
    v39[21] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32 & 1);
    v38[22] = CFSTR("groundAltitudeEnabled");
    v39[22] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v33 & 1);
    v38[23] = CFSTR("fusionInfoEnabled");
    v39[23] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v34 & 1);
    v38[24] = CFSTR("courtesyPromptNeeded");
    v39[24] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v35 & 1);
    v38[25] = CFSTR("isAuthorizedForWidgetUpdates");
    v39[25] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v36 & 1);
    v38[26] = CFSTR("trackRunInfoEnabled");
    v39[26] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v37 & 1);
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = v39;
    v9 = v38;
    v10 = 27;
  }
  else
  {
    v40[0] = CFSTR("type");
    v40[1] = CFSTR("expected type");
    v41[0] = CFSTR("decode failure");
    v41[1] = CFSTR("_CLLocationManagerStateTrackerState");
    v40[2] = CFSTR("raw value");
    v41[2] = a3;
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = v41;
    v9 = v40;
    v10 = 3;
  }
  return (id)objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
}

- (id)JSONObjectWith__CLDaemonStatusStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4
{
  const void *v7;
  size_t v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v14;
  unsigned int v15;
  unsigned int v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (const void *)objc_msgSend(a3, "bytes", 0, 0, 0, 0, 0);
    if ((unint64_t)objc_msgSend(a3, "length") <= 0x28)
      v8 = objc_msgSend(a3, "length");
    else
      v8 = 40;
    memcpy(&v14, v7, v8);
    v20[0] = CFSTR("batteryData");
    v21[0] = -[CLLogFormatter JSONObjectWith_CLDaemonStatus_Type__Battery:info:](self, "JSONObjectWith_CLDaemonStatus_Type__Battery:info:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &v14, 24, 0), a4);
    v20[1] = CFSTR("reachability");
    v21[1] = -[CLLogFormatter JSONObjectWith_CLDaemonStatus_Type__Reachability:info:](self, "JSONObjectWith_CLDaemonStatus_Type__Reachability:info:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15), a4);
    v20[2] = CFSTR("thermalLevel");
    v21[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
    v20[3] = CFSTR("airplaneMode");
    v21[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
    v20[4] = CFSTR("batterySaverModeEnabled");
    v21[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
    v20[5] = CFSTR("restrictedMode");
    v21[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v19);
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = v21;
    v11 = v20;
    v12 = 6;
  }
  else
  {
    v22[0] = CFSTR("type");
    v22[1] = CFSTR("expected type");
    v23[0] = CFSTR("decode failure");
    v23[1] = CFSTR("_CLDaemonStatusStateTrackerState");
    v22[2] = CFSTR("raw value");
    v23[2] = a3;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = v23;
    v11 = v22;
    v12 = 3;
  }
  return (id)objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
}

- (id)JSONObjectWith__CLClientManagerStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4
{
  const void *v5;
  size_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v13;
  char v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (const void *)objc_msgSend(a3, "bytes", 0);
    if ((unint64_t)objc_msgSend(a3, "length") <= 8)
      v6 = objc_msgSend(a3, "length");
    else
      v6 = 8;
    memcpy(&v13, v5, v6);
    v15[0] = CFSTR("locationServicesEnabledStatus");
    v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
    v15[1] = CFSTR("locationRestricted");
    v16[0] = v11;
    v16[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14 & 1);
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = v16;
    v9 = v15;
    v10 = 2;
  }
  else
  {
    v17[0] = CFSTR("type");
    v17[1] = CFSTR("expected type");
    v18[0] = CFSTR("decode failure");
    v18[1] = CFSTR("_CLClientManagerStateTrackerState");
    v17[2] = CFSTR("raw value");
    v18[2] = a3;
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = v18;
    v9 = v17;
    v10 = 3;
  }
  return (id)objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
}

- (id)JSONObjectWith_CLClientRegistrationResult:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 9)
      return (id)*((_QWORD *)&off_24E598D40 + (int)v5);
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLClientRegistrationResult");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLSensorRecorder_Types__DataType:(id)a3 info:(os_log_type_info_s *)a4
{
  void *v5;
  unsigned int v6;
  char *v7;
  void *v8;
  void **v9;
  void *__p[2];
  char v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = objc_msgSend(a3, "intValue");
    if (v6 > 2)
      v7 = (char *)&unk_21FD5F95E;
    else
      v7 = off_24E598D88[v6];
    std::string::basic_string[abi:ne180100]<0>(__p, v7);
    if (v12 >= 0)
      v9 = __p;
    else
      v9 = (void **)__p[0];
    v8 = (void *)objc_msgSend(v5, "stringWithUTF8String:", v9);
    if (v12 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v13[0] = CFSTR("type");
    v13[1] = CFSTR("expected type");
    v14[0] = CFSTR("decode failure");
    v14[1] = CFSTR("CLSensorRecorder_Types::DataType");
    v13[2] = CFSTR("raw value");
    v14[2] = a3;
    return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  }
  return v8;
}

- (id)JSONObjectWith_CLSimulationLocationDeliveryBehavior:(id)a3 info:(os_log_type_info_s *)a4
{
  int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (!v5)
      return CFSTR("PassThrough");
    if (v5 == 1)
      return CFSTR("ConsiderType");
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLSimulationLocationDeliveryBehavior");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLSimulationLocationRepeatBehavior:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 3)
      return off_24E598DA0[v5];
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLSimulationLocationRepeatBehavior");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (id)JSONObjectWith_CLBarometerCalibration_Types__Context:(id)a3 info:(os_log_type_info_s *)a4
{
  unsigned int v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "intValue");
    if (v5 < 0xB && ((0x40Fu >> v5) & 1) != 0)
      return off_24E598DB8[v5];
  }
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("expected type");
  v8[0] = CFSTR("decode failure");
  v8[1] = CFSTR("CLBarometerCalibration_Types::Context::");
  v7[2] = CFSTR("raw value");
  v8[2] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

@end
