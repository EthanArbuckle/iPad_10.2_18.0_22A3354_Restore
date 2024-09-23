@implementation CLIndoorLocation

+ (id)fromPoseEstimate:(const void *)a3 andGpsEstimate:(id)a4
{
  id v5;
  CLIndoorLocation *v6;
  CLIndoorLocation *v7;
  char v8;
  char v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  int8x16_t v20;
  int8x16_t v26;
  int v27;
  double v28;
  int v29;
  __int128 v30;
  int v31;
  int v32;
  int v33;
  const void *v34;
  unint64_t v35;
  __int128 v36;
  int v37;
  unsigned int v38;
  int v39;
  CLIndoorLocation *v40;
  _OWORD v42[8];
  uint64_t v43;
  _OWORD v44[6];
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _BYTE __dst[560];
  _OWORD v49[8];
  _OWORD v50[2];
  _OWORD __src[45];

  v5 = a4;
  if (v5)
    v6 = (CLIndoorLocation *)objc_claimAutoreleasedReturnValue(+[CLIndoorLocation fromGpsEstimate:](CLIndoorLocation, "fromGpsEstimate:", v5));
  else
    v6 = objc_alloc_init(CLIndoorLocation);
  v7 = v6;
  if (v6)
  {
    sub_10008930C(__src, (uint64_t)a3 + 104);
    v8 = sub_1000790EC((const void ***)__src, (unsigned __int8 ***)&qword_10041AD40);
    v9 = v8;
    v10 = (std::__shared_weak_count *)*((_QWORD *)&__src[0] + 1);
    if (!*((_QWORD *)&__src[0] + 1))
      goto LABEL_9;
    v11 = (unint64_t *)(*((_QWORD *)&__src[0] + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
      if ((v9 & 1) != 0)
      {
LABEL_10:
        v13 = 0;
        if ((*((_BYTE *)a3 + 752) & 2) == 0)
        {
LABEL_11:
          v14 = NAN;
          v15 = 0x7FF8000000000000;
          goto LABEL_19;
        }
LABEL_14:
        v15 = 0x7FF8000000000000;
        if ((*((_BYTE *)a3 + 64) & 1) != 0)
          v14 = *((double *)a3 + 6);
        else
          v14 = NAN;
        if ((*((_BYTE *)a3 + 64) & 2) != 0)
          v15 = *((_QWORD *)a3 + 7);
LABEL_19:
        memset(&__src[35], 0, 156);
        -[CLIndoorLocation location](v7, "location");
        LODWORD(__src[35]) = 0xFFFF;
        *(double *)((char *)&__src[41] + 4) = v14;
        *(_QWORD *)((char *)&__src[41] + 12) = v15;
        *(double *)((char *)&__src[35] + 4) = v14;
        *(_QWORD *)((char *)&__src[35] + 12) = v15;
        v16 = *((_QWORD *)a3 + 94);
        v17 = *((double *)a3 + 35);
        v18 = -1.0;
        if ((v16 & 0x4000000) == 0)
          v17 = -1.0;
        *(double *)((char *)&__src[36] + 4) = v17;
        if (!v5)
        {
          v19 = *((double *)a3 + 87);
          if ((v16 & 0x80000000000000) == 0)
            v19 = -1.0;
          *(double *)((char *)&__src[36] + 12) = v19;
          if ((v16 & 0x8000000) != 0)
            v18 = *((double *)a3 + 36);
          *(double *)((char *)&__src[37] + 4) = v18;
          v20 = (int8x16_t)vdupq_n_s64(v16);
          __asm { FMOV            V2.2D, #-1.0 }
          v26 = *(int8x16_t *)((char *)a3 + 632);
          *(int8x16_t *)((char *)&__src[37] + 12) = vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v20, (int8x16_t)xmmword_10039B080)), _Q2, *(int8x16_t *)((char *)a3 + 616));
          *(int8x16_t *)((char *)&__src[38] + 12) = vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v20, (int8x16_t)xmmword_10039B090)), _Q2, v26);
        }
        *(_QWORD *)((char *)&__src[39] + 12) = *((_QWORD *)a3 + 86);
        DWORD1(__src[40]) = 96;
        LODWORD(__src[43]) = 75;
        v27 = sub_100024E14(*((_DWORD *)a3 + 131));
        v28 = *((double *)a3 + 64);
        if (v27 == 11)
          v28 = 5.0;
        if ((*((_QWORD *)a3 + 94) & 0x80) != 0)
          v29 = *((_DWORD *)a3 + 32);
        else
          v29 = 0x7FFFFFFF;
        *((double *)&__src[40] + 1) = v28;
        LODWORD(__src[41]) = v27;
        HIDWORD(__src[42]) = v29;
        *(_QWORD *)((char *)&__src[43] + 4) = 1;
        memset(__src, 0, 512);
        -[CLIndoorLocation locationPrivate](v7, "locationPrivate");
        *(_QWORD *)&__src[2] = *((_QWORD *)a3 + 84);
        *((_QWORD *)&__src[21] + 1) = *((_QWORD *)a3 + 85);
        DWORD2(__src[3]) = 1;
        v49[6] = __src[41];
        v49[7] = __src[42];
        v50[0] = __src[43];
        *(_OWORD *)((char *)v50 + 12) = *(_OWORD *)((char *)&__src[43] + 12);
        v49[2] = __src[37];
        v49[3] = __src[38];
        v49[4] = __src[39];
        v49[5] = __src[40];
        v49[0] = __src[35];
        v49[1] = __src[36];
        -[CLIndoorLocation setLocation:](v7, "setLocation:", v49);
        memcpy(__dst, __src, sizeof(__dst));
        -[CLIndoorLocation setLocationPrivate:](v7, "setLocationPrivate:", __dst);
        -[CLIndoorLocation setLocationDescription:](v7, "setLocationDescription:", 0);
        -[CLIndoorLocation setLocationId:](v7, "setLocationId:", v13);
        -[CLIndoorLocation setRequestsGpsAssistance:](v7, "setRequestsGpsAssistance:", *((unsigned __int8 *)a3 + 464));
        v30 = *(_OWORD *)((char *)a3 + 328);
        *(_OWORD *)((char *)v44 + 8) = *(_OWORD *)((char *)a3 + 312);
        v31 = *((_DWORD *)a3 + 152);
        if (v31 == 1)
          v32 = 2;
        else
          v32 = 1;
        if (v31 == 2)
          v33 = 3;
        else
          v33 = v32;
        LODWORD(v44[0]) = v33;
        *(_OWORD *)((char *)&v44[1] + 8) = v30;
        *(_OWORD *)((char *)&v44[2] + 8) = *(_OWORD *)((char *)a3 + 344);
        memset_pattern16((char *)&v44[3] + 8, &unk_10039B0B0, 0x28uLL);
        v34 = (const void *)*((_QWORD *)a3 + 45);
        v35 = (uint64_t)(*((_QWORD *)a3 + 46) - (_QWORD)v34) >> 3;
        if (v35 >= 5)
          v35 = 5;
        if (v35)
          memcpy((char *)&v44[3] + 8, v34, 8 * v35);
        v36 = *((_OWORD *)a3 + 25);
        v45 = *((_OWORD *)a3 + 24);
        v46 = v36;
        v37 = *((_DWORD *)a3 + 104) - 1;
        if (v37 > 3)
        {
          LODWORD(v47) = 1;
          v38 = *((_DWORD *)a3 + 105) - 1;
          if (v38 > 3)
            goto LABEL_44;
        }
        else
        {
          LODWORD(v47) = dword_10039B698[v37];
          v38 = *((_DWORD *)a3 + 105) - 1;
          if (v38 > 3)
          {
LABEL_44:
            v39 = 1;
LABEL_47:
            HIDWORD(v47) = v39;
            v42[6] = v45;
            v42[7] = v46;
            v42[2] = v44[2];
            v42[3] = v44[3];
            v42[4] = v44[4];
            v42[5] = v44[5];
            v42[0] = v44[0];
            v42[1] = v44[1];
            v43 = v47;
            -[CLIndoorLocation setDiagnosticReport:](v7, "setDiagnosticReport:", v42);
            v40 = v7;

            goto LABEL_48;
          }
        }
        v39 = dword_10039B698[v38];
        goto LABEL_47;
      }
    }
    else
    {
LABEL_9:
      if ((v8 & 1) != 0)
        goto LABEL_10;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString ps_stringWithSTL:](NSString, "ps_stringWithSTL:", (char *)a3 + 104));
    if ((*((_BYTE *)a3 + 752) & 2) == 0)
      goto LABEL_11;
    goto LABEL_14;
  }
LABEL_48:

  return v7;
}

- (void)setRequestsGpsAssistance:(BOOL)a3
{
  self->_requestsGpsAssistance = a3;
}

- (void)setLocationPrivate:(id *)a3
{
  memcpy(&self->_location.ellipsoidalAltitude, a3, 0x230uLL);
}

- (void)setLocationId:(id)a3
{
  objc_storeStrong((id *)&self->_locationId, a3);
}

- (void)setLocationDescription:(id)a3
{
  objc_storeStrong((id *)&self->_locationDescription, a3);
}

- (void)setLocation:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  $AB5116BA7E623E054F959CECB034F4E7 var13;
  __int128 v9;

  v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_location.coordinate.longitude = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_location.suitability = v3;
  v4 = *(_OWORD *)&a3->var3;
  v5 = *(_OWORD *)&a3->var5;
  v6 = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_location.timestamp = *(_OWORD *)&a3->var9;
  *(_OWORD *)&self->_location.course = v6;
  *(_OWORD *)&self->_location.speed = v5;
  *(_OWORD *)&self->_location.altitude = v4;
  v7 = *(_OWORD *)&a3->var11;
  var13 = ($AB5116BA7E623E054F959CECB034F4E7)a3->var13;
  v9 = *(_OWORD *)&a3->var14;
  *(_OWORD *)&self->_location.integrity = *(_OWORD *)&a3->var16;
  self->_location.rawCoordinate = var13;
  *(_OWORD *)&self->_location.rawCourse = v9;
  *(_OWORD *)&self->_location.lifespan = v7;
}

- (void)setDiagnosticReport:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)&self->_diagnosticReport.yieldType = *(_OWORD *)&a3->var0;
  v3 = *(_OWORD *)&a3->var2;
  v4 = *(_OWORD *)&a3->var4;
  v5 = *(_OWORD *)&a3->var7[1];
  *(_OWORD *)&self->_diagnosticReport.prbOnFloors = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_diagnosticReport.prbOnFloor[1] = v5;
  *(_OWORD *)&self->_diagnosticReport.prbCoarseIndoorSaysIndoor = v3;
  *(_OWORD *)&self->_diagnosticReport.prbGpsSaysIndoor = v4;
  v6 = *(_OWORD *)&a3->var7[3];
  v7 = *(_OWORD *)&a3->var8;
  v8 = *(_OWORD *)&a3->var10;
  *(_QWORD *)&self->_diagnosticReport.pfYieldStatusBeforeCalculatePose = *(_QWORD *)&a3->var12;
  *(_OWORD *)&self->_diagnosticReport.prbInlier = v7;
  *(_OWORD *)&self->_diagnosticReport.prbInjectionOccupancyRetryLimitOk = v8;
  *(_OWORD *)&self->_diagnosticReport.prbOnFloor[3] = v6;
}

- ($F74020F89A9F44914ED835A726641817)location
{
  __int128 v3;
  __int128 v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6;

  v3 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var5 = v3;
  v4 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr->var9 = v4;
  var1 = self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var21;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var1.var1 = var1;
  v6 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&self[1].var12;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self[1].var10;
  retstr->var13 = v6;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)&self[1].var13.var1;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)((char *)&self[1].var14 + 4);
  return self;
}

- ($B16919DCCD4DB8B6BF8FD96F109B3512)locationPrivate
{
  return ($B16919DCCD4DB8B6BF8FD96F109B3512 *)memcpy(retstr, &self->_location.ellipsoidalAltitude, sizeof($B16919DCCD4DB8B6BF8FD96F109B3512));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDescription, 0);
  objc_storeStrong((id *)&self->_locationId, 0);
}

+ (id)fromPoseEstimate:(const void *)a3
{
  return +[CLIndoorLocation fromPoseEstimate:andGpsEstimate:](CLIndoorLocation, "fromPoseEstimate:andGpsEstimate:", a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLIndoorLocation)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  _OWORD v24[35];
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CLIndoorLocation;
  v5 = -[CLIndoorLocation init](&v25, "init");
  if (v5)
  {
    sub_10002DA14(v4, (char *)v24);
    v6 = v24[3];
    *(_OWORD *)(v5 + 200) = v24[2];
    *(_OWORD *)(v5 + 216) = v6;
    v7 = v24[5];
    *(_OWORD *)(v5 + 232) = v24[4];
    *(_OWORD *)(v5 + 248) = v7;
    v8 = v24[1];
    *(_OWORD *)(v5 + 168) = v24[0];
    *(_OWORD *)(v5 + 184) = v8;
    v9 = v24[7];
    *(_OWORD *)(v5 + 264) = v24[6];
    *(_OWORD *)(v5 + 280) = v9;
    *(_OWORD *)(v5 + 296) = v24[8];
    *(_OWORD *)(v5 + 308) = *(_OWORD *)((char *)&v24[8] + 12);
    sub_10002D940(v4, (char *)v24);
    memcpy(v5 + 328, v24, 0x230uLL);
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("locationId"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v11;

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("locationDescription"));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v14;

    v5[8] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("gpsAssistance"));
    sub_1001D284C(v4, (char *)v24);
    v16 = *(_QWORD *)&v24[8];
    v17 = v24[7];
    *((_OWORD *)v5 + 8) = v24[6];
    *((_OWORD *)v5 + 9) = v17;
    *((_QWORD *)v5 + 20) = v16;
    v19 = v24[4];
    v18 = v24[5];
    v20 = v24[3];
    *((_OWORD *)v5 + 4) = v24[2];
    *((_OWORD *)v5 + 5) = v20;
    *((_OWORD *)v5 + 6) = v19;
    *((_OWORD *)v5 + 7) = v18;
    v21 = v24[1];
    *((_OWORD *)v5 + 2) = v24[0];
    *((_OWORD *)v5 + 3) = v21;
    v22 = v5;
  }

  return (CLIndoorLocation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  sub_1001D2824(v4, (uint64_t)&self->_location);
  sub_1001D2838(v4, (uint64_t)&self->_location.ellipsoidalAltitude);
  objc_msgSend(v4, "encodeObject:forKey:", self->_locationId, CFSTR("locationId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_locationDescription, CFSTR("locationDescription"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requestsGpsAssistance, CFSTR("gpsAssistance"));
  sub_1001D28DC(v4, (uint64_t)&self->_diagnosticReport);

}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  const char *v6;
  void *v7;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  -[CLIndoorLocation location](self, "location");
  -[CLIndoorLocation location](self, "location");
  -[CLIndoorLocation location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorLocation locationId](self, "locationId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorLocation locationDescription](self, "locationDescription"));
  -[CLIndoorLocation location](self, "location");
  v5 = -[CLIndoorLocation requestsGpsAssistance](self, "requestsGpsAssistance");
  -[CLIndoorLocation location](self, "location");
  v6 = "no";
  if (v5)
    v6 = "yes";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("lat/lon=[%lf, %lf] on floor %d (%@: %@) +/- %lf meters (gps assistance = %s) with location type %d"), v12, v11, v13, v3, v4, v10, v6, v9));

  return v7;
}

- (NSString)locationId
{
  return self->_locationId;
}

- (NSString)locationDescription
{
  return self->_locationDescription;
}

- (BOOL)requestsGpsAssistance
{
  return self->_requestsGpsAssistance;
}

- ($146E4FC062DDF4A2C58C04BCAEC0B25D)diagnosticReport
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self->var12;
  *(_OWORD *)&retstr->var10 = v3;
  *(double *)&retstr->var12 = self[1].var3;
  v4 = *(_OWORD *)&self->var7[3];
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var7[1];
  *(_OWORD *)&retstr->var6 = v4;
  v5 = *(_OWORD *)&self->var10;
  *(_OWORD *)&retstr->var7[1] = *(_OWORD *)&self->var8;
  *(_OWORD *)&retstr->var7[3] = v5;
  v6 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v6;
  return self;
}

+ (id)fromGpsEstimate:(id)a3
{
  id v3;
  CLIndoorLocation *v4;
  _BYTE v6[560];
  _OWORD v7[8];
  _OWORD v8[2];
  _OWORD __src[35];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CLIndoorLocation);
    v16 = 0u;
    memset(v17, 0, 28);
    v15 = 0u;
    v13 = 0u;
    memset(v14, 0, sizeof(v14));
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    objc_msgSend(v3, "gpsLocation");
    memset(__src, 0, 512);
    objc_msgSend(v3, "gpsLocationPrivate");
    *(_QWORD *)((char *)v14 + 12) = 0;
    *((_QWORD *)&__src[21] + 1) = 0;
    *(_QWORD *)&__src[2] = 0;
    *((_QWORD *)&__src[1] + 1) = 0;
    v7[6] = v15;
    v7[7] = v16;
    v8[0] = v17[0];
    *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)((char *)v17 + 12);
    v7[2] = v12;
    v7[3] = v13;
    v7[0] = v10;
    v7[1] = v11;
    v7[4] = v14[0];
    v7[5] = v14[1];
    -[CLIndoorLocation setLocation:](v4, "setLocation:", v7);
    memcpy(v6, __src, sizeof(v6));
    -[CLIndoorLocation setLocationPrivate:](v4, "setLocationPrivate:", v6);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
