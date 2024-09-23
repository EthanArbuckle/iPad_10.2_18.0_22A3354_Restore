@implementation CLGpsPosition

- (CLGpsPosition)initWithLocation:(id *)a3 andPrivateLocation:(id *)a4
{
  char *v6;
  std::chrono::steady_clock::time_point v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v14;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v15;
  char *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLGpsPosition;
  v6 = -[CLGpsPosition init](&v18, "init");
  if (v6)
  {
    v7.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    v8 = *(_OWORD *)&a3->var1.var1;
    *((_OWORD *)v6 + 1) = *(_OWORD *)&a3->var0;
    *((_OWORD *)v6 + 2) = v8;
    v9 = *(_OWORD *)&a3->var3;
    v10 = *(_OWORD *)&a3->var5;
    v11 = *(_OWORD *)&a3->var9;
    *((_OWORD *)v6 + 5) = *(_OWORD *)&a3->var7;
    *((_OWORD *)v6 + 6) = v11;
    *((_OWORD *)v6 + 3) = v9;
    *((_OWORD *)v6 + 4) = v10;
    v12 = *(_OWORD *)&a3->var11;
    var13 = a3->var13;
    v14 = *(_OWORD *)&a3->var14;
    *(_OWORD *)(v6 + 156) = *(_OWORD *)&a3->var16;
    *(($F24F406B2B787EFB06265DBA3D28CBD5 *)v6 + 8) = var13;
    *((_OWORD *)v6 + 9) = v14;
    *((_OWORD *)v6 + 7) = v12;
    *(_QWORD *)&v12 = *(_QWORD *)&a3->var10;
    v15 = v7.__d_.__rep_ + (uint64_t)(*(double *)&v12 * 1000000000.0);
    if (*(double *)&v12 < 0.0)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    *((_QWORD *)v6 + 1) = v15;
    memcpy(v6 + 176, a4, 0x230uLL);
    v16 = v6;
  }

  return (CLGpsPosition *)v6;
}

- ($F74020F89A9F44914ED835A726641817)gpsLocation
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&self->var14;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var11 = self->var13;
  retstr->var13 = v3;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)&self->var17;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)(&self->var19 + 1);
  v4 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->var5 = v4;
  v5 = *(_OWORD *)&self->var11;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self->var9;
  *(_OWORD *)&retstr->var9 = v5;
  v6 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var1.var1 = v6;
  return self;
}

- (CLGpsPosition)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char *v13;
  _OWORD v15[35];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLGpsPosition;
  v5 = -[CLGpsPosition init](&v16, "init");
  if (v5)
  {
    sub_10002DA14(v4, (char *)v15);
    v6 = *(_OWORD *)((char *)&v15[8] + 12);
    v8 = v15[7];
    v7 = v15[8];
    *((_OWORD *)v5 + 7) = v15[6];
    *((_OWORD *)v5 + 8) = v8;
    *((_OWORD *)v5 + 9) = v7;
    *(_OWORD *)(v5 + 156) = v6;
    v10 = v15[4];
    v9 = v15[5];
    v11 = v15[3];
    *((_OWORD *)v5 + 3) = v15[2];
    *((_OWORD *)v5 + 4) = v11;
    *((_OWORD *)v5 + 5) = v10;
    *((_OWORD *)v5 + 6) = v9;
    v12 = v15[1];
    *((_OWORD *)v5 + 1) = v15[0];
    *((_OWORD *)v5 + 2) = v12;
    sub_10002D940(v4, (char *)v15);
    memcpy(v5 + 176, v15, 0x230uLL);
    *((_QWORD *)v5 + 1) = sub_10002D9D0(v4);
    v13 = v5;
  }

  return (CLGpsPosition *)v5;
}

- ($B16919DCCD4DB8B6BF8FD96F109B3512)gpsLocationPrivate
{
  return ($B16919DCCD4DB8B6BF8FD96F109B3512 *)memcpy(retstr, &self->_gpsLocation.ellipsoidalAltitude, sizeof($B16919DCCD4DB8B6BF8FD96F109B3512));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (BOOL)isStaleFix:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  return self->_expiry.__d_.__rep_ <= a3.__d_.__rep_;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLGpsPosition)init
{
  -[CLGpsPosition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  sub_1001D2824(v4, (uint64_t)&self->_gpsLocation);
  sub_1001D2838(v4, (uint64_t)&self->_gpsLocation.ellipsoidalAltitude);
  sub_1001D28F0(v4, (const char *)&self->_expiry);

}

- (id)description
{
  uint64_t v4;
  uint64_t v5;

  -[CLGpsPosition gpsLocation](self, "gpsLocation");
  -[CLGpsPosition gpsLocation](self, "gpsLocation");
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("lat/lon=[%lf, %lf]"), v5, v4));
}

- (time_point<std::chrono::steady_clock,)expiry
{
  return self->_expiry;
}

@end
