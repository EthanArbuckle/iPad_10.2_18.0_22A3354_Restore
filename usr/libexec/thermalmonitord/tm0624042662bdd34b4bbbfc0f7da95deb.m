@implementation tm0624042662bdd34b4bbbfc0f7da95deb

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  id v7;
  double v8;
  float v9;
  id v10;
  float v11;
  double v12;
  id v13;
  double v14;
  float v15;
  id v16;
  double v17;

  v4 = dword_1000A29D4;
  v5 = dword_1000A29D8;
  v6 = HIDWORD(qword_1000A2A68);
  v7 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v8 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  *(float *)&v8 = v8;
  objc_msgSend(v7, "calculateControlEffort:", v8);
  sub_10002E350(51, (int)((double)v4 * 0.68 + 50.49 + (double)v5 * 0.3));
  v9 = (float)SHIDWORD(qword_1000A2A74);
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v11 = v9 / 100.0;
  *(float *)&v12 = v11;
  objc_msgSend(v10, "calculateControlEffort:", v12);
  v13 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v14 = v11;
  objc_msgSend(v13, "calculateControlEffort:", v14);
  sub_10002E350(54, (int)((double)v5 * 0.11 + 155.28 + (double)v6 * 0.84));
  v15 = (float)dword_1000A2A84;
  v16 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v17 = v15 / 100.0;
  objc_msgSend(v16, "calculateControlEffort:", v17);
  sub_10002E350(52, self->super.baseVT[12]);
}

- (int)compute2DGridTemps
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  int *baseVT;
  int32x2_t v13;
  int32x2_t v14;
  double v15;
  __int32 v16;
  uint64_t v17;
  __int32 v18;
  int v19;
  NSObject *v20;
  int v21;
  int *v22;
  unint64_t v23;
  NSObject *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;

  v3 = HIDWORD(qword_1000A29AC);
  v5 = HIDWORD(qword_1000A29B4);
  v4 = qword_1000A29BC;
  v6 = dword_1000A29D4;
  v7 = dword_1000A2A4C;
  v8 = unk_1000A2A50;
  v9 = dword_1000A2A5C;
  v10 = (double)dword_1000A29C4;
  v11 = (double)dword_1000A29D8;
  baseVT = self->super.baseVT;
  v13 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060BE0, (float64x2_t)xmmword_100060BD0, (double)dword_1000A29C4), (float64x2_t)xmmword_100060BF0, (double)dword_1000A29D8)));
  v14 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060C10, (float64x2_t)xmmword_100060C00, (double)dword_1000A29C4), (float64x2_t)xmmword_100060C20, (double)dword_1000A29D8)));
  *(int32x2_t *)self->super.baseVT = v13;
  *(int32x2_t *)&self->super.baseVT[2] = v14;
  *(int32x2_t *)&self->super.baseVT[4] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060C40, (float64x2_t)xmmword_100060C30, v10), (float64x2_t)xmmword_100060C50, v11)));
  *(int32x2_t *)&self->super.baseVT[6] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060C70, (float64x2_t)xmmword_100060C60, v10), (float64x2_t)xmmword_100060C80, v11)));
  *(int32x2_t *)&self->super.baseVT[8] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060CA0, (float64x2_t)xmmword_100060C90, v10), (float64x2_t)xmmword_100060CB0, v11)));
  *(int32x2_t *)&self->super.baseVT[10] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060CD0, (float64x2_t)xmmword_100060CC0, (double)v3), (float64x2_t)xmmword_100060CE0, (double)v5), (float64x2_t)xmmword_100060CF0, v11)));
  *(int32x2_t *)&self->super.baseVT[13] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060D10, (float64x2_t)xmmword_100060D00, (double)v3), (float64x2_t)xmmword_100060D20, (double)v5), (float64x2_t)xmmword_100060D30, v11)));
  *(int32x2_t *)&self->super.baseVT[15] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060D50, (float64x2_t)xmmword_100060D40, (double)v8), (float64x2_t)xmmword_100060D60, (double)v4), (float64x2_t)xmmword_100060D70, v11)));
  self->super.baseVT[12] = (int)((double)v5 * 0.171 + 8.1 + (double)v6 * 0.271 + v11 * 0.546);
  self->super.baseVT[17] = (int)((double)v9 * 0.062 + 61.0 + (double)v4 * 0.464 + v11 * 0.451);
  *(int32x2_t *)&self->super.baseVT[18] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060D90, (float64x2_t)xmmword_100060D80, (double)v7), (float64x2_t)xmmword_100060DA0, (double)v4), (float64x2_t)xmmword_100060DB0, v11)));
  *(int32x2_t *)&self->super.baseVT[20] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060DD0, (float64x2_t)xmmword_100060DC0, (double)v8), (float64x2_t)xmmword_100060DE0, (double)v4), (float64x2_t)xmmword_100060DF0, v11)));
  self->super.baseVT[22] = (int)((double)v9 * 0.271 + 103.0 + (double)v4 * 0.42 + v11 * 0.264);
  self->super.baseVT[23] = (int)((double)v7 * 0.366 + 137.0 + (double)v4 * 0.287 + v11 * 0.287);
  self->super.baseVT[24] = (int)((double)v7 * 0.391 + 204.4 + v11 * 0.536);
  *(int32x2_t *)&self->super.baseVT[25] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060E10, (float64x2_t)xmmword_100060E00, (double)v8), (float64x2_t)xmmword_100060E20, (double)v4), (float64x2_t)xmmword_100060E30, v11)));
  self->super.baseVT[27] = (int)((double)v9 * 0.628 + 160.8 + (double)v4 * 0.202 + v11 * 0.115);
  self->super.baseVT[28] = (int)((double)v7 * 0.87 + 224.9 + v11 * 0.078);
  v15 = (double)v7 * 0.612 + 181.8 + (double)v4 * 0.091 + v11 * 0.237;
  v16 = v13.i32[0];
  v17 = 1;
  v18 = v13.i32[0];
  self->super.baseVT[29] = (int)v15;
  do
  {
    v19 = baseVT[v17];
    if (v16 >= v19)
      v16 = baseVT[v17];
    if (v18 <= v19)
      v18 = baseVT[v17];
    ++v17;
  }
  while (v17 != 30);
  sub_10002E350(53, (v18 - v16));
  if (byte_1000A2480)
  {
    v20 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> 5x6 Grid", buf, 2u);
      v21 = byte_1000A2480;
    }
    else
    {
      v21 = 1;
    }
  }
  else
  {
    v21 = 0;
  }
  v22 = &self->super.baseVT[2];
  v23 = -5;
  do
  {
    if (v21)
    {
      v24 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(v22 - 2);
        v26 = *(v22 - 1);
        v27 = *v22;
        v28 = v22[1];
        v29 = v22[2];
        *(_DWORD *)buf = 67110144;
        v32 = v25;
        v33 = 1024;
        v34 = v26;
        v35 = 1024;
        v36 = v27;
        v37 = 1024;
        v38 = v28;
        v39 = 1024;
        v40 = v29;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "<Notice> %4d %4d %4d %4d %4d", buf, 0x20u);
        v21 = byte_1000A2480;
      }
    }
    v23 += 5;
    v22 += 5;
  }
  while (v23 < 0x19);
  return baseVT;
}

- (id)getGridX
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000191FC;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_10009A3C0 != -1)
    dispatch_once(&qword_10009A3C0, block);
  return self->gridX;
}

- (id)getGridY
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000192B8;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_10009A3C8 != -1)
    dispatch_once(&qword_10009A3C8, block);
  return self->gridY;
}

- (void)updateCoreAnalyticsInfo
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  _QWORD v18[4];
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  unsigned __int8 v32;

  v16 = qword_1000A2A7C;
  v17 = HIDWORD(qword_1000A2A74);
  v15 = qword_1000A29AC;
  v3 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v4 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v5 = -[CommonProduct getChargerState](self, "getChargerState");
  v6 = sub_100008F14();
  v7 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v8 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 2), "releaseMaxLI");
  v9 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 3), "releaseMaxLI");
  v10 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 7), "releaseMaxLI");
  v11 = -[CommonProduct isBackLightOn](self, "isBackLightOn");
  v12 = qword_1000A2A68;
  v13 = HIDWORD(qword_1000A2A7C);
  v14 = dword_1000A2A84;
  if (!v11)
  {
    v14 = -12700;
    v13 = -12700;
    v12 = -12700;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001946C;
  v18[3] = &unk_10007D080;
  v19 = v12;
  v20 = v15;
  v21 = v16;
  v22 = v14;
  v23 = v13;
  v24 = v17;
  v25 = v3;
  v26 = v4;
  v27 = 100 - v8;
  v28 = 100 - v9;
  v29 = 100 - v10;
  v30 = v6;
  v31 = v5;
  v32 = v7;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v18);
}

@end
