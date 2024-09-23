@implementation VLLocalizationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VLLocalizationResult)init
{
  VLLocalizationResult *result;

  result = (VLLocalizationResult *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (VLLocalizationResult)initWithTimestamp:(double)a3 pose:(id *)a4 debugInfo:(id)a5
{
  id v9;
  VLLocalizationResult *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  VLLocalizationResult *v23;
  objc_super v25;

  v9 = a5;
  if (a4
    && (v25.receiver = self,
        v25.super_class = (Class)VLLocalizationResult,
        v10 = -[VLLocalizationResult init](&v25, sel_init),
        (self = v10) != 0))
  {
    v10->_timestamp = a3;
    *(double *)&v14 = a4->var0[0][0];
    *(double *)&v15 = a4->var0[0][1];
    *(double *)&v16 = a4->var0[0][2];
    v17 = *(_OWORD *)a4->var1;
    *((_QWORD *)&v14 + 1) = *(_QWORD *)&a4->var0[1][0];
    *((_QWORD *)&v15 + 1) = *(_QWORD *)&a4->var0[1][1];
    *((_QWORD *)&v16 + 1) = *(_QWORD *)&a4->var0[1][2];
    *(double *)&v11 = a4->var0[2][0];
    *(double *)&v12 = a4->var0[2][1];
    *(double *)&v13 = a4->var0[2][2];
    __asm { FMOV            V7.2D, #1.0 }
    *(double *)&_Q7 = a4->var1[2];
    *(_OWORD *)v10->_anon_50 = v14;
    *(_OWORD *)&v10->_anon_50[16] = v11;
    *(_OWORD *)&v10->_anon_50[32] = v15;
    *(_OWORD *)&v10->_anon_50[48] = v12;
    *(_OWORD *)&v10->_anon_50[64] = v16;
    *(_OWORD *)&v10->_anon_50[80] = v13;
    *(_OWORD *)&v10->_anon_50[96] = v17;
    *(_OWORD *)&v10->_anon_50[112] = _Q7;
    *(double *)&v15 = a4->var1[2];
    *(_OWORD *)v10->_anon_20 = *(_OWORD *)a4->var1;
    *(_OWORD *)&v10->_anon_20[16] = v15;
    *(_QWORD *)&v10->_anon_20[32] = 0xBFF0000000000000;
    v10->_confidence = a4->var2;
    v10->_covariance.v[0][0] = a4->var3[0];
    v10->_covariance.v[0][1] = a4->var3[1];
    v10->_covariance.v[0][2] = a4->var3[2];
    v10->_covariance.v[0][3] = a4->var3[3];
    v10->_covariance.v[0][4] = a4->var3[4];
    v10->_covariance.v[0][5] = a4->var3[5];
    v10->_covariance.v[1][0] = a4->var3[6];
    v10->_covariance.v[1][1] = a4->var3[7];
    v10->_covariance.v[1][2] = a4->var3[8];
    v10->_covariance.v[1][3] = a4->var3[9];
    v10->_covariance.v[1][4] = a4->var3[10];
    v10->_covariance.v[1][5] = a4->var3[11];
    v10->_covariance.v[2][0] = a4->var3[12];
    v10->_covariance.v[2][1] = a4->var3[13];
    v10->_covariance.v[2][2] = a4->var3[14];
    v10->_covariance.v[2][3] = a4->var3[15];
    v10->_covariance.v[2][4] = a4->var3[16];
    v10->_covariance.v[2][5] = a4->var3[17];
    v10->_covariance.v[3][0] = a4->var3[18];
    v10->_covariance.v[3][1] = a4->var3[19];
    v10->_covariance.v[3][2] = a4->var3[20];
    v10->_covariance.v[3][3] = a4->var3[21];
    v10->_covariance.v[3][4] = a4->var3[22];
    v10->_covariance.v[3][5] = a4->var3[23];
    v10->_covariance.v[4][0] = a4->var3[24];
    v10->_covariance.v[4][1] = a4->var3[25];
    v10->_covariance.v[4][2] = a4->var3[26];
    v10->_covariance.v[4][3] = a4->var3[27];
    v10->_covariance.v[4][4] = a4->var3[28];
    v10->_covariance.v[4][5] = a4->var3[29];
    v10->_covariance.v[5][0] = a4->var3[30];
    v10->_covariance.v[5][1] = a4->var3[31];
    v10->_covariance.v[5][2] = a4->var3[32];
    v10->_covariance.v[5][3] = a4->var3[33];
    v10->_covariance.v[5][4] = a4->var3[34];
    v10->_covariance.v[5][5] = a4->var3[35];
    objc_storeStrong((id *)&v10->_debugInfo, a5);
    self = self;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (VLLocalizationResult)initWithCoder:(id)a3
{
  id v4;
  VLLocalizationResult *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  float v12;
  uint64_t v13;
  VLLocalizationDebugInfo *debugInfo;
  VLLocalizationResult *v15;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VLLocalizationResult;
  v5 = -[VLLocalizationResult init](&v19, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v5->_timestamp = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("location_x"));
  v18 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("location_y"));
  v17 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("location_z"));
  *(_QWORD *)&v9 = v18;
  *((_QWORD *)&v9 + 1) = v17;
  *(_OWORD *)v5->_anon_20 = v9;
  *(_OWORD *)&v5->_anon_20[16] = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("location_accuracy"));
  *(_QWORD *)&v5->_anon_20[32] = v11;
  if (!objc_msgSend(v4, "_vl_decodeSimdDouble4x4:forKey:", v5->_anon_50, CFSTR("transform")))
    goto LABEL_5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("confidence"));
  v5->_confidence = v12;
  if (objc_msgSend(v4, "_vl_decodeFloat6x6:forKey:", &v5->_covariance, CFSTR("covariance")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debug_info"));
    v13 = objc_claimAutoreleasedReturnValue();
    debugInfo = v5->_debugInfo;
    v5->_debugInfo = (VLLocalizationDebugInfo *)v13;

    v15 = v5;
  }
  else
  {
LABEL_5:
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("location_x"), *(double *)self->_anon_20);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("location_y"), *(double *)&self->_anon_20[8]);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("location_z"), *(double *)&self->_anon_20[16]);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("location_accuracy"), *(double *)&self->_anon_20[32]);
  v6 = *(_OWORD *)&self->_anon_50[80];
  v19 = *(_OWORD *)&self->_anon_50[64];
  v20 = v6;
  v7 = *(_OWORD *)&self->_anon_50[112];
  v21 = *(_OWORD *)&self->_anon_50[96];
  v22 = v7;
  v8 = *(_OWORD *)&self->_anon_50[16];
  v15 = *(_OWORD *)self->_anon_50;
  v16 = v8;
  v9 = *(_OWORD *)&self->_anon_50[48];
  v17 = *(_OWORD *)&self->_anon_50[32];
  v18 = v9;
  objc_msgSend(v5, "_vl_encodeSimdDouble4x4:forKey:", &v15, CFSTR("transform"));
  *(float *)&v10 = self->_confidence;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("confidence"), v10);
  v11 = *(_OWORD *)&self->_covariance.v[4][4];
  v21 = *(_OWORD *)&self->_covariance.v[4][0];
  v22 = v11;
  v23 = *(_OWORD *)&self->_covariance.v[5][2];
  v12 = *(_OWORD *)&self->_covariance.v[2][0];
  v17 = *(_OWORD *)&self->_covariance.v[1][2];
  v18 = v12;
  v13 = *(_OWORD *)&self->_covariance.v[3][2];
  v19 = *(_OWORD *)&self->_covariance.v[2][4];
  v20 = v13;
  v14 = *(_OWORD *)&self->_covariance.v[0][4];
  v15 = *(_OWORD *)&self->_covariance.v[0][0];
  v16 = v14;
  objc_msgSend(v5, "_vl_encodeFloat6x6:forKey:", &v15, CFSTR("covariance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_debugInfo, CFSTR("debug_info"));

}

- (unint64_t)hash
{
  return (unint64_t)self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  VLLocalizationResult *v4;
  VLLocalizationResult *v5;
  float64x2_t *v6;
  float64x2_t *v7;
  int64x2_t v8;
  int64x2_t v9;
  BOOL v10;

  v4 = (VLLocalizationResult *)a3;
  v5 = v4;
  if (v4 == self)
  {

    return 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = v6;
      v10 = self->_timestamp == v6[1].f64[0]
         && (v8 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[32], v6[7]), (int8x16_t)vceqq_f64(*(float64x2_t *)self->_anon_50, v6[5])), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[64], v6[9]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[96], v6[11]))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[48], v6[8]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[16], v6[6])), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[80], v6[10]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_50[112], v6[12])))), (vandq_s8((int8x16_t)v8, (int8x16_t)vdupq_laneq_s64(v8, 1)).u64[0] & 0x8000000000000000) != 0)&& (v9 = vceqq_f64(*(float64x2_t *)self->_anon_20, v6[2]), (vandq_s8((int8x16_t)vdupq_laneq_s64(v9, 1), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_anon_20[16], v6[3]), (int8x16_t)v9)).u64[0] & 0x8000000000000000) != 0)
         && *(double *)&self->_anon_20[32] == v6[4].f64[0]
         && self->_confidence == *(float *)&v6->f64[1]
         && memcmp(&self->_covariance, &v6[13], 0x90uLL) == 0;

      return v10;
    }
    else
    {

      return 0;
    }
  }
}

- (unint64_t)timestamp
{
  if (qword_253E9A1F8 != -1)
    dispatch_once(&qword_253E9A1F8, &__block_literal_global_0);
  return (unint64_t)(self->_timestamp * *(double *)&_MergedGlobals);
}

double __33__VLLocalizationResult_timestamp__block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v1) = info.numer;
    LODWORD(result) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 * 1000000000.0;
    _MergedGlobals = *(_QWORD *)&result;
  }
  return result;
}

- (double)inputTimestamp
{
  return self->_timestamp;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)location
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->_anon_20[16];
  *v2 = *(_OWORD *)self->_anon_20;
  v2[1] = v3;
  v4 = *(_OWORD *)&self->_anon_20[32];
  v2[2] = v4;
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v4;
}

- (__n128)transform
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 112);
  v6 = *(_OWORD *)(a1 + 128);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- ($4ED12C4C7630B45462BF021B0F75306B)covariance
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[2].var0[1][2];
  *(_OWORD *)&retstr->var0[4][0] = *(_OWORD *)&self[2].var0[0][4];
  *(_OWORD *)&retstr->var0[4][4] = v3;
  *(_OWORD *)&retstr->var0[5][2] = *(_OWORD *)&self[2].var0[2][0];
  v4 = *(_OWORD *)&self[1].var0[4][4];
  *(_OWORD *)&retstr->var0[1][2] = *(_OWORD *)&self[1].var0[4][0];
  *(_OWORD *)&retstr->var0[2][0] = v4;
  v5 = *(_OWORD *)&self[2].var0[0][0];
  *(_OWORD *)&retstr->var0[2][4] = *(_OWORD *)&self[1].var0[5][2];
  *(_OWORD *)&retstr->var0[3][2] = v5;
  v6 = *(_OWORD *)&self[1].var0[3][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[1].var0[2][4];
  *(_OWORD *)&retstr->var0[0][4] = v6;
  return self;
}

- (VLLocalizationDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

@end
