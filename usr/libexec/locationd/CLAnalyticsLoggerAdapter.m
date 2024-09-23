@implementation CLAnalyticsLoggerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102306AF8 != -1)
    dispatch_once(&qword_102306AF8, &stru_102169648);
  return (id)qword_102306AF0;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLAnalyticsLoggerAdapter)init
{
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  objc_super v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021696B0);
  v3 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ca,init", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021696B0);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#ca,init", v8, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter init]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)CLAnalyticsLoggerAdapter;
  return -[CLAnalyticsLoggerAdapter initWithInboundProtocol:outboundProtocol:](&v7, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLAnalyticsLoggerServiceProtocol, &OBJC_PROTOCOL___CLAnalyticsLoggerClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021696B0);
  v3 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ca,beginService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021696B0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#ca,beginService", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter beginService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLAnalyticsLoggerAdapter universe](self, "universe");
  sub_100ADC0D8();
}

- (void)endService
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  _WORD v5[8];
  uint8_t buf[1640];

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021696B0);
  v2 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#ca,endService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021696B0);
    v5[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#ca,endService", v5, 2);
    v4 = (uint8_t *)v3;
    sub_100512490("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter endService]", "%s\n", v3);
    if (v4 != buf)
      free(v4);
  }
}

- (void)setMeasurements:(id)a3
{
  NSObject *v5;
  int *v6;
  int *i;
  uint64_t value;
  NSObject *v9;
  int v10;
  int v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  _BYTE v17[32];
  int *v18;
  int *v19;
  uint64_t v20;
  _DWORD v21[4];
  uint8_t buf[8];

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021696B0);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ca,setMeasurements", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021696B0);
    LOWORD(v18) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#ca,setMeasurements", &v18, 2);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter setMeasurements:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  if (a3)
  {
    (*((void (**)(int **__return_ptr, id))a3 + 2))(&v18, a3);
    v6 = v18;
    for (i = v19; v6 != i; v6 += 10)
    {
      value = (uint64_t)self->fInstance.__ptr_.__value_;
      sub_1001F869C((uint64_t)v17, (uint64_t)(v6 + 2));
      LOBYTE(value) = sub_1001F80F0(value, v6, (uint64_t)v17);
      sub_1001F8644((uint64_t)v17);
      if ((value & 1) == 0)
      {
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_1021696B0);
        v9 = qword_1022A02A8;
        if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
        {
          v10 = *v6;
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#ca,ERROR,setMeasurements,measurement,%{public}d,failed", buf, 8u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A02A0 != -1)
            dispatch_once(&qword_1022A02A0, &stru_1021696B0);
          v11 = *v6;
          v21[0] = 67240192;
          v21[1] = v11;
          LODWORD(v16) = 8;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "#ca,ERROR,setMeasurements,measurement,%{public}d,failed", v21, v16);
          v13 = (uint8_t *)v12;
          sub_100512490("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter setMeasurements:]", "%s\n", v12);
          if (v13 != buf)
            free(v13);
        }
      }
    }
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  *(_QWORD *)buf = &v18;
  sub_1006AB5A0((void ***)buf);
}

- (void)submitEvent:(id)a3
{
  NSObject *v4;
  __int128 *p_s1;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __int128 *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 *v16;
  __int128 *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  __int128 *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 *v24;
  __int128 *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  __int128 *v29;
  CLAnalyticsLogger *value;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  __int128 *v36;
  CLAnalyticsLogger *v37;
  NSMutableDictionary *v38;
  uint64_t v39;
  uint64_t i;
  _BYTE *v41;
  NSString *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  int v47;
  const __CFString *v48;
  _UNKNOWN **v49;
  void *v50;
  id v51;
  char *v52;
  NSObject *v53;
  _UNKNOWN **v54;
  NSMutableDictionary *v55;
  const __CFString *v56;
  int v57;
  __int128 *v58;
  id v59;
  __int128 *v60;
  uint64_t v61;
  int v62;
  __int128 *v63;
  id v64;
  __int128 *v65;
  const char *v66;
  char *v67;
  id v68;
  NSObject *v69;
  int v70;
  __int128 *v71;
  id v72;
  __int128 *v73;
  __int128 *v74;
  _QWORD *v75;
  __int128 *v76;
  const char *v77;
  char *v78;
  uint64_t v79;
  int v80;
  __int128 *v81;
  id v82;
  __int128 *v83;
  const char *v84;
  char *v85;
  const char *v86;
  const char *v87;
  uint64_t *p_fInstance;
  id v89;
  uint64_t v90;
  void *v91[2];
  uint64_t v92;
  _QWORD v93[5];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  void *__dst[2];
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *__p[2];
  uint64_t v103;
  __int128 __s1;
  uint64_t v105;
  _BYTE v106[18];
  __int16 v107;
  id v108;
  uint8_t v109[128];
  _BYTE buf[18];
  __int16 v111;
  id v112;

  if (a3)
  {
    (*((void (**)(__int128 *__return_ptr, id, SEL))a3 + 2))(&__s1, a3, a2);
  }
  else
  {
    __s1 = 0uLL;
    v105 = 0;
  }
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021696B0);
  v4 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    p_s1 = &__s1;
    if (v105 < 0)
      p_s1 = (__int128 *)__s1;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = p_s1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ca,submit,event,%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021696B0);
    v76 = &__s1;
    if (v105 < 0)
      v76 = (__int128 *)__s1;
    *(_DWORD *)v106 = 136315138;
    *(_QWORD *)&v106[4] = v76;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#ca,submit,event,%s", v106);
    v78 = (char *)v77;
    sub_100512490("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter submitEvent:]", "%s\n", v77);
    if (v78 != buf)
      free(v78);
  }
  v6 = HIBYTE(v105);
  v7 = HIBYTE(v105);
  v8 = *((_QWORD *)&__s1 + 1);
  if (v105 >= 0)
    v9 = HIBYTE(v105);
  else
    v9 = *((_QWORD *)&__s1 + 1);
  v10 = *((_QWORD *)&xmmword_1023111E0 + 1);
  if (byte_1023111F7 >= 0)
    v10 = byte_1023111F7;
  if (v9 == v10)
  {
    if (byte_1023111F7 >= 0)
      v11 = &xmmword_1023111E0;
    else
      v11 = (__int128 *)xmmword_1023111E0;
    if (v105 < 0)
    {
      v14 = (void *)__s1;
      if (!memcmp((const void *)__s1, v11, *((size_t *)&__s1 + 1)))
        goto LABEL_82;
    }
    else
    {
      if (!HIBYTE(v105))
        goto LABEL_79;
      v12 = &__s1;
      v13 = HIBYTE(v105);
      while (*(unsigned __int8 *)v12 == *(unsigned __int8 *)v11)
      {
        v12 = (__int128 *)((char *)v12 + 1);
        v11 = (__int128 *)((char *)v11 + 1);
        if (!--v13)
        {
LABEL_77:
          value = self->fInstance.__ptr_.__value_;
          if ((v7 & 0x80) == 0)
            goto LABEL_80;
          v14 = (void *)__s1;
          goto LABEL_83;
        }
      }
    }
  }
  v15 = *((_QWORD *)&xmmword_1023111F8 + 1);
  if (byte_10231120F >= 0)
    v15 = byte_10231120F;
  if (v9 == v15)
  {
    if (byte_10231120F >= 0)
      v16 = &xmmword_1023111F8;
    else
      v16 = (__int128 *)xmmword_1023111F8;
    if ((v7 & 0x80) != 0)
    {
      v14 = (void *)__s1;
      if (!memcmp((const void *)__s1, v16, v8))
        goto LABEL_82;
    }
    else
    {
      if (!v7)
        goto LABEL_79;
      v17 = &__s1;
      v18 = v6;
      while (*(unsigned __int8 *)v17 == *(unsigned __int8 *)v16)
      {
        v17 = (__int128 *)((char *)v17 + 1);
        v16 = (__int128 *)((char *)v16 + 1);
        if (!--v18)
          goto LABEL_77;
      }
    }
  }
  v19 = *((_QWORD *)&xmmword_102311210 + 1);
  if (byte_102311227 >= 0)
    v19 = byte_102311227;
  if (v9 == v19)
  {
    if (byte_102311227 >= 0)
      v20 = &xmmword_102311210;
    else
      v20 = (__int128 *)xmmword_102311210;
    if ((v7 & 0x80) != 0)
    {
      v14 = (void *)__s1;
      if (!memcmp((const void *)__s1, v20, v8))
        goto LABEL_82;
    }
    else
    {
      if (!v7)
        goto LABEL_79;
      v21 = &__s1;
      v22 = v6;
      while (*(unsigned __int8 *)v21 == *(unsigned __int8 *)v20)
      {
        v21 = (__int128 *)((char *)v21 + 1);
        v20 = (__int128 *)((char *)v20 + 1);
        if (!--v22)
          goto LABEL_77;
      }
    }
  }
  v23 = *((_QWORD *)&xmmword_102311228 + 1);
  if (byte_10231123F >= 0)
    v23 = byte_10231123F;
  if (v9 != v23)
    goto LABEL_66;
  if (byte_10231123F >= 0)
    v24 = &xmmword_102311228;
  else
    v24 = (__int128 *)xmmword_102311228;
  if ((v7 & 0x80) != 0)
  {
    v14 = (void *)__s1;
    if (memcmp((const void *)__s1, v24, v8))
      goto LABEL_66;
LABEL_82:
    value = self->fInstance.__ptr_.__value_;
LABEL_83:
    sub_100115CE4(__p, v14, v8);
    goto LABEL_84;
  }
  if (!v7)
    goto LABEL_79;
  v25 = &__s1;
  v26 = v6;
  while (*(unsigned __int8 *)v25 == *(unsigned __int8 *)v24)
  {
    v25 = (__int128 *)((char *)v25 + 1);
    v24 = (__int128 *)((char *)v24 + 1);
    if (!--v26)
      goto LABEL_77;
  }
LABEL_66:
  v27 = *((_QWORD *)&xmmword_102311240 + 1);
  if (byte_102311257 >= 0)
    v27 = byte_102311257;
  if (v9 != v27)
    goto LABEL_86;
  if (byte_102311257 >= 0)
    v28 = &xmmword_102311240;
  else
    v28 = (__int128 *)xmmword_102311240;
  if ((v7 & 0x80) != 0)
  {
    v14 = (void *)__s1;
    if (memcmp((const void *)__s1, v28, v8))
      goto LABEL_86;
    goto LABEL_82;
  }
  if (!v7)
  {
LABEL_79:
    value = self->fInstance.__ptr_.__value_;
LABEL_80:
    *(_OWORD *)__p = __s1;
    v103 = v105;
LABEL_84:
    sub_100ADD7FC((uint64_t)value, (unsigned __int8 *)__p);
    if (SHIBYTE(v103) < 0)
      operator delete(__p[0]);
    goto LABEL_86;
  }
  v29 = &__s1;
  while (*(unsigned __int8 *)v29 == *(unsigned __int8 *)v28)
  {
    v29 = (__int128 *)((char *)v29 + 1);
    v28 = (__int128 *)((char *)v28 + 1);
    if (!--v6)
      goto LABEL_77;
  }
LABEL_86:
  v31 = HIBYTE(v105);
  v32 = HIBYTE(v105);
  if (v105 >= 0)
    v33 = HIBYTE(v105);
  else
    v33 = *((_QWORD *)&__s1 + 1);
  v34 = qword_102311260;
  if (byte_10231126F >= 0)
    v34 = byte_10231126F;
  if (v33 != v34)
    goto LABEL_104;
  if (byte_10231126F >= 0)
    v35 = &qword_102311258;
  else
    v35 = (uint64_t *)qword_102311258;
  if (SHIBYTE(v105) < 0)
  {
    if (memcmp((const void *)__s1, v35, *((size_t *)&__s1 + 1)))
    {
      p_fInstance = (uint64_t *)&self->fInstance;
      v37 = self->fInstance.__ptr_.__value_;
      goto LABEL_106;
    }
    goto LABEL_103;
  }
  if (!HIBYTE(v105))
  {
LABEL_103:
    sub_100ADF754((uint64_t)self->fInstance.__ptr_.__value_);
    v32 = HIBYTE(v105);
    goto LABEL_104;
  }
  v36 = &__s1;
  while (*(unsigned __int8 *)v36 == *(unsigned __int8 *)v35)
  {
    v36 = (__int128 *)((char *)v36 + 1);
    v35 = (uint64_t *)((char *)v35 + 1);
    if (!--v31)
      goto LABEL_103;
  }
LABEL_104:
  p_fInstance = (uint64_t *)&self->fInstance;
  v37 = self->fInstance.__ptr_.__value_;
  if ((v32 & 0x80) == 0)
  {
    *(_OWORD *)__dst = __s1;
    v99 = v105;
    goto LABEL_107;
  }
LABEL_106:
  sub_100115CE4(__dst, (void *)__s1, *((unint64_t *)&__s1 + 1));
LABEL_107:
  sub_100ADFA64((uint64_t)v37, (unsigned __int8 *)__dst, &v100);
  if (SHIBYTE(v99) < 0)
    operator delete(__dst[0]);
  v38 = objc_opt_new(NSMutableDictionary);
  v39 = v100;
  for (i = v101; v39 != i; v39 = v44 + 32)
  {
    sub_100ADFED8(*p_fInstance, *(_DWORD *)v39, (uint64_t)buf);
    if (SBYTE3(v112) >= 0)
      v41 = buf;
    else
      v41 = *(_BYTE **)buf;
    v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v41);
    if (SBYTE3(v112) < 0)
      operator delete(*(void **)buf);
    v43 = *(unsigned int *)(v39 + 32);
    if ((_DWORD)v43 == -1)
      sub_100392428();
    *(_QWORD *)v106 = buf;
    v44 = v39 + 8;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", ((uint64_t (*)(_BYTE *, uint64_t))off_102169710[v43])(v106, v44), v42);
  }
  v45 = objc_alloc_init((Class)NSMutableString);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v46 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
  v47 = 1;
  if (v46)
  {
    v48 = CFSTR(",\"%@\":\"%@\");
    v49 = CLPContext_ptr;
    v90 = *(_QWORD *)v95;
    do
    {
      v50 = 0;
      v89 = v46;
      do
      {
        if (*(_QWORD *)v95 != v90)
          objc_enumerationMutation(v38);
        v51 = objc_msgSend(v49[256], "stringWithFormat:", v48, *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v50), -[NSMutableDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v50)));
        v52 = (char *)objc_msgSend(v45, "length");
        if (&v52[(_QWORD)objc_msgSend(v51, "length")] > (char *)0x383)
        {
          if (qword_1022A02A0 != -1)
            dispatch_once(&qword_1022A02A0, &stru_1021696B0);
          v53 = qword_1022A02A8;
          if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
          {
            v54 = v49;
            v55 = v38;
            v56 = v48;
            v57 = SHIBYTE(v105);
            v58 = (__int128 *)__s1;
            v59 = objc_msgSend(v45, "UTF8String");
            *(_DWORD *)buf = 67109634;
            v60 = &__s1;
            if (v57 < 0)
              v60 = v58;
            *(_DWORD *)&buf[4] = v47;
            *(_WORD *)&buf[8] = 2080;
            *(_QWORD *)&buf[10] = v60;
            v111 = 2080;
            v112 = v59;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#careport Part,%d,event,%s,measurements%s", buf, 0x1Cu);
            v48 = v56;
            v38 = v55;
            v49 = v54;
            v46 = v89;
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A02A0 != -1)
              dispatch_once(&qword_1022A02A0, &stru_1021696B0);
            v61 = qword_1022A02A8;
            v62 = SHIBYTE(v105);
            v63 = (__int128 *)__s1;
            v64 = objc_msgSend(v45, "UTF8String");
            *(_DWORD *)v106 = 67109634;
            v65 = &__s1;
            if (v62 < 0)
              v65 = v63;
            *(_DWORD *)&v106[4] = v47;
            *(_WORD *)&v106[8] = 2080;
            *(_QWORD *)&v106[10] = v65;
            v107 = 2080;
            v108 = v64;
            LODWORD(v86) = 28;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v61, 0, "#careport Part,%d,event,%s,measurements%s", v106, v86, v87);
            v67 = (char *)v66;
            sub_100512490("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter submitEvent:]", "%s\n", v66);
            v48 = CFSTR(",\"%@\":\"%@\");
            if (v67 != buf)
              free(v67);
          }
          v45 = objc_msgSend(v51, "mutableCopy");
          ++v47;
        }
        else
        {
          objc_msgSend(v45, "appendString:", v51);
        }
        v50 = (char *)v50 + 1;
      }
      while (v46 != v50);
      v68 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
      v46 = v68;
    }
    while (v68);
  }
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021696B0);
  v69 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    v70 = SHIBYTE(v105);
    v71 = (__int128 *)__s1;
    v72 = objc_msgSend(v45, "UTF8String");
    v73 = &__s1;
    if (v70 < 0)
      v73 = v71;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v47;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = v73;
    v111 = 2080;
    v112 = v72;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "#careport Part,%d,event,%s,measurements%s", buf, 0x1Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021696B0);
    v79 = qword_1022A02A8;
    v80 = SHIBYTE(v105);
    v81 = (__int128 *)__s1;
    v82 = objc_msgSend(v45, "UTF8String");
    v83 = &__s1;
    if (v80 < 0)
      v83 = v81;
    *(_DWORD *)v106 = 67109634;
    *(_DWORD *)&v106[4] = v47;
    *(_WORD *)&v106[8] = 2080;
    *(_QWORD *)&v106[10] = v83;
    v107 = 2080;
    v108 = v82;
    LODWORD(v86) = 28;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v79, 0, "#careport Part,%d,event,%s,measurements%s", v106, v86, v87);
    v85 = (char *)v84;
    sub_100512490("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter submitEvent:]", "%s\n", v84);
    if (v85 != buf)
      free(v85);
  }
  if (v105 >= 0)
    v74 = &__s1;
  else
    v74 = (__int128 *)__s1;
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_100AE00BC;
  v93[3] = &unk_10215F370;
  v93[4] = v38;
  AnalyticsSendEventLazy(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v74), v93);
  v75 = (_QWORD *)*p_fInstance;
  if (SHIBYTE(v105) < 0)
  {
    sub_100115CE4(v91, (void *)__s1, *((unint64_t *)&__s1 + 1));
  }
  else
  {
    *(_OWORD *)v91 = __s1;
    v92 = v105;
  }
  sub_100AE00C4(v75, (unsigned __int8 *)v91);
  if (SHIBYTE(v92) < 0)
    operator delete(v91[0]);
  *(_QWORD *)buf = &v100;
  sub_1006AB5A0((void ***)buf);
  if (SHIBYTE(v105) < 0)
    operator delete((void *)__s1);
}

- (void)submitEvent:(id)a3 withMeasurements:(id)a4
{
  -[CLAnalyticsLoggerAdapter setMeasurements:](self, "setMeasurements:", a4);
  -[CLAnalyticsLoggerAdapter submitEvent:](self, "submitEvent:", a3);
}

- (void).cxx_destruct
{
  CLAnalyticsLogger *value;

  value = self->fInstance.__ptr_.__value_;
  self->fInstance.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CLAnalyticsLogger *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
