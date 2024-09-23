@implementation CLLocationGroup

- (void).cxx_destruct
{
  void **begin;
  void **end;
  void *v5;
  void **value;
  char *v7;
  char *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;

  sub_10004AAA0((uint64_t)&self->_wifiOnlyDownloadLocIdxs, (_QWORD *)self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_.__value_.__left_);
  begin = (void **)self->_locationIds.__begin_;
  if (begin)
  {
    end = (void **)self->_locationIds.__end_;
    v5 = self->_locationIds.__begin_;
    if (end != begin)
    {
      do
      {
        if (*((char *)end - 1) < 0)
          operator delete(*(end - 3));
        end -= 3;
      }
      while (end != begin);
      v5 = self->_locationIds.__begin_;
    }
    self->_locationIds.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_centerLatLon, 0);
  objc_storeStrong((id *)&self->_centerECEF, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  value = (void **)self->vertices.__ptr_.__value_;
  self->vertices.__ptr_.__value_ = 0;
  if (value)
  {
    v7 = (char *)value[3];
    if (v7)
    {
      v8 = (char *)value[4];
      v9 = value[3];
      if (v8 != v7)
      {
        v10 = (char *)value[4];
        do
        {
          v12 = (void *)*((_QWORD *)v10 - 3);
          v10 -= 24;
          v11 = v12;
          if (v12)
          {
            *((_QWORD *)v8 - 2) = v11;
            operator delete(v11);
          }
          v8 = v10;
        }
        while (v10 != v7);
        v9 = value[3];
      }
      value[4] = v7;
      operator delete(v9);
    }
    v13 = *value;
    if (*value)
    {
      value[1] = v13;
      operator delete(v13);
    }
    operator delete();
  }
}

- (basic_string<char,)getGroupId
{
  uint64_t v1;
  const char *v3;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v8;

  v3 = (const char *)objc_msgSend(*(id *)(v1 + 16), "UTF8String");
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)strlen(v3);
  if ((unint64_t)result >= 0x7FFFFFFFFFFFFFF8)
    sub_1000CDE30();
  v5 = (unint64_t)result;
  if ((unint64_t)result >= 0x17)
  {
    v6 = ((unint64_t)result & 0xFFFFFFFFFFFFFFF8) + 8;
    if (((unint64_t)result | 7) != 0x17)
      v6 = (unint64_t)result | 7;
    v7 = v6 + 1;
    v8 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v6 + 1);
    retstr->__r_.__value_.var0.var1.__size_ = v5;
    *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = v7 | 0x8000000000000000;
    retstr->__r_.__value_.var0.var1.__data_ = (char *)v8;
    retstr = v8;
  }
  else
  {
    *((_BYTE *)&retstr->__r_.__value_.var0.var1 + 23) = (_BYTE)result;
    if (!result)
    {
      retstr->__r_.__value_.var0.var0.__data_[0] = 0;
      return result;
    }
  }
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)memmove(retstr, v3, v5);
  retstr->__r_.__value_.var0.var0.__data_[v5] = 0;
  return result;
}

- (int64_t)locationContext
{
  return self->_locationContext;
}

- (BOOL)allowCellularDownload:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *v6;
  unint64_t v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **v9;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_;
  v4 = left;
  if (!left)
    goto LABEL_12;
  v6 = p_pair1;
  do
  {
    v7 = (unint64_t)v4[4].__value_.__left_;
    v8 = v7 >= a3;
    if (v7 >= a3)
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)v4;
    else
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&v4[1];
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || v6[4].__value_.__left_ > (void *)a3)
LABEL_12:
    v6 = p_pair1;
  return v6 == p_pair1;
}

- (const)getLocationIds
{
  return &self->_locationIds;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (NSString)groupId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)distance:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  _QWORD *value;
  double v10;
  _QWORD *v12;
  _QWORD *v13;
  double v14[2];
  int8x16_t v15;
  uint64_t v16;
  void (**v17)(std::exception *__hidden);

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ENUCoordinate fromLatLonOrigin:andEcefOrigin:andEcefPoint:](ENUCoordinate, "fromLatLonOrigin:andEcefOrigin:andEcefPoint:", self->_centerLatLon, self->_centerECEF, v4));
  objc_msgSend(v5, "east");
  v7 = v6;
  objc_msgSend(v5, "north");
  v14[0] = v7;
  v14[1] = v8;
  value = self->vertices.__ptr_.__value_;
  if (*value == value[1])
  {
    v12 = (_QWORD *)value[3];
    v13 = (_QWORD *)value[4];
    if (v12 == v13)
    {
LABEL_6:
      v17 = &off_1003FBE28;
      v15.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/ae269ea5-5122-11ef-a621-12147c76fa9d/Applications/Xcode.ap"
                            "p/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/us"
                            "r/local/include/boost/geometry/algorithms/detail/throw_on_empty_input.hpp";
      v15.i64[1] = (uint64_t)"void boost::geometry::detail::throw_on_empty_input(const Geometry &) [Geometry = boost::geom"
                            "etry::model::polygon<boost::geometry::model::d2::point_xy<double>>]";
      v16 = 54;
      sub_1001D0450((uint64_t)&v17, &v15);
    }
    while (*v12 == v12[1])
    {
      v12 += 3;
      if (v12 == v13)
        goto LABEL_6;
    }
  }
  v10 = sub_10005B834(v14, (uint64_t)value);

  return v10;
}

+ (void)storeAverage:(id)a3 ofVertices:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      v11 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "x", (_QWORD)v21);
          v17 = v16;
          objc_msgSend(v15, "y");
          v19 = v18;
          objc_msgSend(v15, "z");
          v11 = v11 + v17;
          v12 = v12 + v19;
          v13 = v13 + v20;
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
    }

    objc_msgSend(v5, "setFromX:y:z:", v11 / (double)(unint64_t)v7, v12 / (double)(unint64_t)v7, v13 / (double)(unint64_t)v7);
  }

}

- (GeographicCoordinate)centerLatLon
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 32, 1);
}

- (ECEFCoordinate)centerECEF
{
  return (ECEFCoordinate *)objc_getProperty(self, a2, 24, 1);
}

- (CLLocationGroup)initWithGroupId:(id)a3 locationIds:(id)a4 center:(id)a5 wifiOnlyDownloadLocIdxs:(const void *)a6 locationContext:(int64_t)a7 andTolerance:(double)a8
{
  id v15;
  id v16;
  id v17;
  CLLocationGroup *v18;
  CLLocationGroup *v19;
  CLLocationGroup *v20;
  void **p_begin;
  void **begin;
  void **end;
  void *v24;
  ECEFCoordinate *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  ECEFCoordinate *v31;
  ECEFCoordinate *centerECEF;
  GeographicCoordinate *v33;
  GeographicCoordinate *centerLatLon;
  __int128 v36;
  void *v37;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v38.receiver = self;
  v38.super_class = (Class)CLLocationGroup;
  v18 = -[CLLocationGroup init](&v38, "init");
  v19 = v18;
  v20 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_groupId, a3);
    +[CLLocationGroup stringVectorFromNSArray:](CLLocationGroup, "stringVectorFromNSArray:", v16);
    p_begin = &v20->_locationIds.__begin_;
    begin = (void **)v20->_locationIds.__begin_;
    if (begin)
    {
      end = (void **)v20->_locationIds.__end_;
      v24 = v20->_locationIds.__begin_;
      if (end != begin)
      {
        do
        {
          if (*((char *)end - 1) < 0)
            operator delete(*(end - 3));
          end -= 3;
        }
        while (end != begin);
        v24 = *p_begin;
      }
      v20->_locationIds.__end_ = begin;
      operator delete(v24);
      *p_begin = 0;
      v20->_locationIds.__end_ = 0;
      v20->_locationIds.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v20->_locationIds.__begin_ = v36;
    v20->_locationIds.__end_cap_.__value_ = v37;
    v25 = [ECEFCoordinate alloc];
    objc_msgSend(v17, "x");
    v27 = v26;
    objc_msgSend(v17, "y");
    v29 = v28;
    objc_msgSend(v17, "z");
    v31 = -[ECEFCoordinate initWithX:y:z:](v25, "initWithX:y:z:", v27, v29, v30);
    centerECEF = v20->_centerECEF;
    v20->_centerECEF = v31;

    v33 = -[GeographicCoordinate initFromECEFCoordinate:]([GeographicCoordinate alloc], "initFromECEFCoordinate:", v20->_centerECEF);
    centerLatLon = v20->_centerLatLon;
    v20->_centerLatLon = v33;

    v20->_tolerance = a8;
    if (&v19->_wifiOnlyDownloadLocIdxs != a6)
      sub_10009CE4C((uint64_t **)&v19->_wifiOnlyDownloadLocIdxs, *(_QWORD **)a6, (_QWORD *)a6 + 1);
    v20->_locationContext = a7;
    operator new();
  }

  return 0;
}

+ (vector<std::string,)stringVectorFromNSArray:(id)a2
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  _QWORD *end;
  size_t v16;
  size_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  vector<std::string, std::allocator<std::string>> *result;
  id v23;
  id v24;
  id v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v23 = v5;
  sub_10009CD18((char **)retstr, (unint64_t)objc_msgSend(v5, "count"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v23;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    v24 = v6;
    do
    {
      v9 = 0;
      v25 = v7;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v6);
        v10 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = objc_retainAutorelease(v10);
        v13 = (const char *)objc_msgSend(v12, "UTF8String");
        v14 = v13;
        v26 = v13;
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          v19 = sub_1001D1208(&retstr->__begin_, &v26);
          goto LABEL_17;
        }
        v16 = strlen(v13);
        if (v16 >= 0x7FFFFFFFFFFFFFF8)
          sub_1000CDE30();
        v17 = v16;
        if (v16 >= 0x17)
        {
          v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17)
            v20 = v16 | 7;
          v21 = v20 + 1;
          v18 = operator new(v20 + 1);
          end[1] = v17;
          end[2] = v21 | 0x8000000000000000;
          *end = v18;
          v6 = v24;
        }
        else
        {
          *((_BYTE *)end + 23) = v16;
          v18 = end;
          if (!v16)
            goto LABEL_16;
        }
        memmove(v18, v14, v17);
LABEL_16:
        *((_BYTE *)v18 + v17) = 0;
        v19 = (char *)(end + 3);
        retstr->__end_ = end + 3;
        v7 = v25;
LABEL_17:
        retstr->__end_ = v19;
        objc_autoreleasePoolPop(v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  return result;
}

- (const)getVertices
{
  return &self->vertices;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 88;
  return self;
}

- (CLLocationGroup)init
{
  id v3;
  ECEFCoordinate *v4;
  CLLocationGroup *v5;
  _QWORD **v7;
  _QWORD *v8[2];

  v3 = objc_alloc_init((Class)NSArray);
  v4 = objc_alloc_init(ECEFCoordinate);
  v8[0] = 0;
  v8[1] = 0;
  v7 = v8;
  v5 = -[CLLocationGroup initWithGroupId:locationIds:center:wifiOnlyDownloadLocIdxs:locationContext:andTolerance:](self, "initWithGroupId:locationIds:center:wifiOnlyDownloadLocIdxs:locationContext:andTolerance:", &stru_100409048, v3, v4, &v7, 0, 0.0);
  sub_10004AAA0((uint64_t)&v7, v8[0]);

  return v5;
}

- (vector<std::string,)locationIds
{
  vector<std::string, std::allocator<std::string>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_locationIds, (void (__cdecl *)(void *, const void *))sub_1001D0384);
  return result;
}

- (set<unsigned)wifiOnlyDownloadLocIdxs
{
  set<unsigned long, std::less<unsigned long>, std::allocator<unsigned long>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_wifiOnlyDownloadLocIdxs, (void (__cdecl *)(void *, const void *))sub_1001D03C0);
  return result;
}

- (void)setWifiOnlyDownloadLocIdxs:(set<unsigned)long
{
  objc_copyCppObjectAtomic(&self->_wifiOnlyDownloadLocIdxs, a3, (void (__cdecl *)(void *, const void *))sub_1001D0424);
}

@end
