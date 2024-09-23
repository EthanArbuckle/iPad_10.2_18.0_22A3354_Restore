@implementation NIServerFindingAdvertisement

- (id)initForFinder:(BOOL)a3 address:(const void *)a4
{
  NIServerFindingAdvertisement *v6;
  NIServerFindingAdvertisement *v7;
  int v8;
  NSNumber *nbUwbAcquisitionChannelIdx;
  NSData *uniqueIdentifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NIServerFindingAdvertisement;
  v6 = -[NIServerFindingAdvertisement init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    v6->_isFinder = a3;
    v8 = *(_DWORD *)a4;
    *(_WORD *)&v6->_address.__elems_[4] = *((_WORD *)a4 + 2);
    v6->_canRange = 1;
    v6->_useCase = 0;
    *(_DWORD *)v6->_address.__elems_ = v8;
    v6->_supportedTechnologies.__end_ = v6->_supportedTechnologies.__begin_;
    nbUwbAcquisitionChannelIdx = v6->_nbUwbAcquisitionChannelIdx;
    v6->_nbUwbAcquisitionChannelIdx = 0;

    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = 0;

    *(_WORD *)&v7->_protocolVersion = 0;
  }
  return v7;
}

+ (id)advertisementForFinder:(BOOL)a3 address:(const void *)a4 statusFlags:(unsigned __int8)a5 payload:(id)a6 uniqueIdentifier:(id)a7
{
  unsigned int v8;
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  _DWORD *v19;
  _BYTE *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  _BYTE *v28;
  int v29;
  void *__p;
  void *v32;
  uint64_t v33;
  void *v34;
  _BYTE *v35;
  char *v36;

  v8 = a5;
  v10 = a3;
  v11 = a6;
  v12 = a7;
  v13 = -[NIServerFindingAdvertisement initForFinder:address:]([NIServerFindingAdvertisement alloc], "initForFinder:address:", v10, a4);
  objc_msgSend(v13, "setUniqueIdentifier:", v12);
  objc_msgSend(v13, "setProtocolVersion:", 0);
  if ((v8 & 1) != 0 && objc_msgSend(v11, "length"))
  {
    v14 = objc_retainAutorelease(v11);
    v15 = v14;
    if (v10)
    {
      v16 = *(unsigned __int8 *)objc_msgSend(v14, "bytes");
      objc_msgSend(v13, "setProtocolVersion:", v16 & 7);
      objc_msgSend(v13, "setNarrowBandMask:", (v16 >> 3) & 3);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)objc_msgSend(v14, "bytes")));
      objc_msgSend(v13, "setNbUwbAcquisitionChannelIdx:", v17);

      if ((unint64_t)objc_msgSend(v15, "length") >= 2)
      {
        v18 = *((unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v15), "bytes") + 1);
        objc_msgSend(v13, "setProtocolVersion:", v18 & 7);
        objc_msgSend(v13, "setNarrowBandMask:", (v18 >> 3) & 3);
      }
    }
  }
  v19 = 0;
  v20 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  if ((v8 & 4) != 0)
  {
    v19 = operator new(4uLL);
    *v19 = 1;
    v20 = v19 + 1;
    v35 = v19 + 1;
    v36 = (char *)(v19 + 1);
    v34 = v19;
  }
  v21 = !+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild");
  if ((v8 & 8) == 0)
    LOBYTE(v21) = 1;
  if ((v21 & 1) == 0)
  {
    v22 = v20 - (_BYTE *)v19;
    v23 = (v20 - (_BYTE *)v19) >> 2;
    v24 = v23 + 1;
    if ((unint64_t)(v23 + 1) >> 62)
      sub_100026E7C();
    if (v22 >> 1 > v24)
      v24 = v22 >> 1;
    if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL)
      v25 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v25 = v24;
    if (v25)
    {
      v26 = (char *)sub_10003B05C((uint64_t)&v36, v25);
      v19 = v34;
      v20 = v35;
    }
    else
    {
      v26 = 0;
    }
    v27 = &v26[4 * v23];
    *(_DWORD *)v27 = 2;
    v28 = v27 + 4;
    while (v20 != (_BYTE *)v19)
    {
      v29 = *((_DWORD *)v20 - 1);
      v20 -= 4;
      *((_DWORD *)v27 - 1) = v29;
      v27 -= 4;
    }
    v34 = v27;
    v35 = v28;
    v36 = &v26[4 * v25];
    if (v19)
      operator delete(v19);
    v35 = v28;
  }
  objc_msgSend(v13, "setUseCase:", (v8 >> 4) & 1);
  __p = 0;
  v32 = 0;
  v33 = 0;
  sub_1002E54F4(&__p, v34, (uint64_t)v35, (v35 - (_BYTE *)v34) >> 2);
  objc_msgSend(v13, "setSupportedTechnologies:", &__p);
  if (__p)
  {
    v32 = __p;
    operator delete(__p);
  }
  objc_msgSend(v13, "setCanRange:", (v8 >> 1) & 1);
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }

  return v13;
}

+ (id)advertisementFromByteRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v27[6];
  int v28;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x65)
  {
    v28 = 0;
    v6 = (void *)OPACKDecodeData(v3, 8, &v28);
    if (!v6 || (v7 = objc_opt_class(NSDictionary, v5), (objc_opt_isKindOfClass(v6, v7) & 1) == 0))
    {
      v22 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003E92EC(&v28, v22);
      v4 = 0;
      goto LABEL_26;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10082C1F0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10082C208));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10082C220));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10082C238));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10082C250));
    if (!v8)
      goto LABEL_24;
    v14 = objc_opt_class(NSNumber, v12);
    if ((objc_opt_isKindOfClass(v8, v14) & (v9 != 0)) == 0)
      goto LABEL_24;
    v16 = objc_opt_class(NSData, v15);
    if ((objc_opt_isKindOfClass(v9, v16) & 1) == 0)
      goto LABEL_24;
    v4 = 0;
    if (objc_msgSend(v9, "length") != (id)6 || !v10)
      goto LABEL_25;
    v18 = objc_opt_class(NSNumber, v17);
    if ((objc_opt_isKindOfClass(v10, v18) & 1) == 0)
      goto LABEL_24;
    if (!v11
      || (v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
          v19,
          v11 == v19))
    {

      v11 = 0;
    }
    else
    {
      v21 = objc_opt_class(NSData, v20);
      if ((objc_opt_isKindOfClass(v11, v21) & 1) == 0)
        goto LABEL_24;
    }
    if (!v13
      || (v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
          v23,
          v13 == v23))
    {

      v13 = 0;
    }
    else
    {
      v25 = objc_opt_class(NSData, v24);
      if ((objc_opt_isKindOfClass(v13, v25) & 1) == 0)
      {
LABEL_24:
        v4 = 0;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
    }
    objc_msgSend(v9, "getBytes:length:", v27, 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingAdvertisement advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:](NIServerFindingAdvertisement, "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:", objc_msgSend(v8, "BOOLValue"), v27, objc_msgSend(v10, "unsignedCharValue"), v11, v13));
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003E92C0();
  v4 = 0;
LABEL_27:

  return v4;
}

- (NSData)byteRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *Data;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &self->_address, 6));
  v14[0] = &off_10082C1F0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isFinder));
  v15[0] = v4;
  v15[1] = v3;
  v14[1] = &off_10082C208;
  v14[2] = &off_10082C220;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[NIServerFindingAdvertisement statusFlags](self, "statusFlags")));
  v15[2] = v5;
  v14[3] = &off_10082C238;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement payload](self, "payload"));
  if (v6)
    v7 = objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement payload](self, "payload"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v8 = (void *)v7;
  v15[3] = v7;
  v14[4] = &off_10082C250;
  v9 = NSRandomData(3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v15[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 5));

  Data = (void *)OPACKEncoderCreateData(v11, 8, 0);
  return (NSData *)Data;
}

+ (array<unsigned)convertCBAddressToRoseAddress:(id)a3
{
  id v3;
  void *v4;
  char *v5;
  char *v6;
  char v7;
  const char *v10;
  int v11;
  unsigned int v12;
  unsigned __int16 v13;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v10 = "cbAddress";
    v11 = 2289;
    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v3, "length") <= 5)
  {
    v10 = "cbAddress.length >= rose::kBtAdvAddressByteLength";
    v11 = 2290;
LABEL_9:
    __assert_rtn("+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:]", "NIServerFindingDiscovery.mm", v11, v10);
  }
  objc_msgSend(v4, "getBytes:length:", &v12, 6);
  v5 = (char *)&v13 + 1;
  v6 = (char *)&v12 + 1;
  do
  {
    v7 = *(v6 - 1);
    *(v6 - 1) = *v5;
    *v5-- = v7;
  }
  while (v6++ < v5);

  return (array<unsigned char, 6UL>)(v12 | ((unint64_t)v13 << 32));
}

- (unsigned)statusFlags
{
  int narrowBandMask;
  int v3;
  int *begin;
  int *i;

  if (self->_nbUwbAcquisitionChannelIdx || self->_protocolVersion || (narrowBandMask = self->_narrowBandMask) != 0)
    narrowBandMask = 1;
  if (self->_canRange)
    narrowBandMask |= 2u;
  if (self->_useCase == 1)
    v3 = narrowBandMask | 0x10;
  else
    v3 = narrowBandMask;
  begin = self->_supportedTechnologies.__begin_;
  for (i = self->_supportedTechnologies.__end_; begin != i; ++begin)
  {
    if (*begin == 2)
    {
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
        v3 |= 8u;
    }
    else if (*begin == 1)
    {
      v3 |= 4u;
    }
  }
  return v3;
}

- (NSData)payload
{
  NSNumber *nbUwbAcquisitionChannelIdx;
  unsigned __int8 v4;
  _BYTE *v5;
  _BYTE *v6;
  unsigned int protocolVersion;
  unsigned int narrowBandMask;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  size_t v13;
  unint64_t v14;
  _BYTE *v15;
  char v16;
  void *v17;
  unint64_t __p;
  _BYTE *v20;

  __p = 0;
  v20 = 0;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  if (nbUwbAcquisitionChannelIdx)
  {
    v4 = -[NSNumber intValue](nbUwbAcquisitionChannelIdx, "intValue");
    v5 = operator new(1uLL);
    *v5 = v4;
    v6 = v5 + 1;
    __p = (unint64_t)v5;
    v20 = v5 + 1;
  }
  else
  {
    v6 = 0;
  }
  protocolVersion = self->_protocolVersion;
  if (self->_protocolVersion)
  {
    if (protocolVersion >= 8)
      __assert_rtn("-[NIServerFindingAdvertisement payload]", "NIServerFindingDiscovery.mm", 2354, "(_protocolVersion & kProtocolVersionMask) == _protocolVersion");
    narrowBandMask = self->_narrowBandMask;
    if (!self->_narrowBandMask)
      goto LABEL_11;
  }
  else
  {
    narrowBandMask = self->_narrowBandMask;
    if (!self->_narrowBandMask)
      goto LABEL_30;
  }
  if (narrowBandMask >= 4)
    __assert_rtn("-[NIServerFindingAdvertisement payload]", "NIServerFindingDiscovery.mm", 2360, "(_narrowBandMask & narrowBandMaskValueMask) == _narrowBandMask");
  LOBYTE(protocolVersion) = protocolVersion | (8 * narrowBandMask);
LABEL_11:
  if (v6 >= v20)
  {
    v10 = &v6[-__p];
    v11 = (uint64_t)&v6[-__p + 1];
    if (v11 < 0)
      sub_100026E7C();
    v12 = (unint64_t)&v20[-__p];
    if (2 * (uint64_t)&v20[-__p] > (unint64_t)v11)
      v11 = 2 * v12;
    if (v12 >= 0x3FFFFFFFFFFFFFFFLL)
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
      v14 = (unint64_t)operator new(v13);
    else
      v14 = 0;
    v10[v14] = protocolVersion;
    v9 = (uint64_t)&v10[v14 + 1];
    if (v6 == (_BYTE *)__p)
    {
      v14 += (unint64_t)v10;
    }
    else
    {
      v15 = &v6[~__p];
      do
      {
        v16 = *--v6;
        (v15--)[v14] = v16;
      }
      while (v6 != (_BYTE *)__p);
      v6 = (_BYTE *)__p;
    }
    __p = v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = protocolVersion;
    v9 = (uint64_t)(v6 + 1);
  }
  v6 = (_BYTE *)v9;
LABEL_30:
  if (v6 == (_BYTE *)__p)
  {
    v17 = 0;
    if (!v6)
      return (NSData *)v17;
    goto LABEL_32;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", __p, &v6[-__p]));
  v6 = (_BYTE *)__p;
  if (__p)
LABEL_32:
    operator delete(v6);
  return (NSData *)v17;
}

- (int)selectedTechnology
{
  int *begin;

  begin = self->_supportedTechnologies.__begin_;
  if ((int *)((char *)self->_supportedTechnologies.__end_ - (char *)begin) == (int *)4)
    return *begin;
  else
    return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *__p;
  void *v8;
  uint64_t v9;

  v4 = -[NIServerFindingAdvertisement initForFinder:address:]([NIServerFindingAdvertisement alloc], "initForFinder:address:", self->_isFinder, &self->_address);
  v5 = v4;
  if (!v4)
    __assert_rtn("-[NIServerFindingAdvertisement copyWithZone:]", "NIServerFindingDiscovery.mm", 2385, "advertisement");
  objc_msgSend(v4, "setCanRange:", self->_canRange);
  objc_msgSend(v5, "setUseCase:", self->_useCase);
  __p = 0;
  v8 = 0;
  v9 = 0;
  sub_1002E54F4(&__p, self->_supportedTechnologies.__begin_, (uint64_t)self->_supportedTechnologies.__end_, self->_supportedTechnologies.__end_ - self->_supportedTechnologies.__begin_);
  objc_msgSend(v5, "setSupportedTechnologies:", &__p);
  if (__p)
  {
    v8 = __p;
    operator delete(__p);
  }
  objc_msgSend(v5, "setNbUwbAcquisitionChannelIdx:", self->_nbUwbAcquisitionChannelIdx);
  objc_msgSend(v5, "setProtocolVersion:", self->_protocolVersion);
  objc_msgSend(v5, "setNarrowBandMask:", self->_narrowBandMask);
  objc_msgSend(v5, "setUniqueIdentifier:", self->_uniqueIdentifier);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIServerFindingAdvertisement *v7;
  NIServerFindingAdvertisement *v8;
  unsigned int v9;
  BOOL v10;
  id v11;
  int v12;
  int v13;
  int canRange;
  void *v15;
  uint64_t v16;
  int *end;
  int *begin;
  int *v19;
  int *v20;
  int v21;
  int v22;
  _BOOL4 v23;
  void *v25;
  void *v26;
  NSNumber *nbUwbAcquisitionChannelIdx;
  void *v28;
  unsigned int v29;
  NSData *uniqueIdentifier;
  void *v31;
  void *v32;
  unsigned int v33;
  int narrowBandMask;
  unsigned int v35;
  int v36;
  unsigned int v39;
  int protocolVersion;
  _BOOL4 v41;
  _BOOL4 v42;
  unsigned int v43;
  int useCase;
  unsigned int v45;
  int v46;
  int v47;
  id v48;
  void *v49;
  uint64_t v50;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIServerFindingAdvertisement *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v10 = 1;
LABEL_56:

      goto LABEL_57;
    }
    v48 = v4;
    if (!self->_isFinder)
      goto LABEL_10;
    if (-[NIServerFindingAdvertisement isFinder](v7, "isFinder"))
    {
      v9 = 0;
      goto LABEL_11;
    }
    if (self->_isFinder)
      v9 = 1;
    else
LABEL_10:
      v9 = -[NIServerFindingAdvertisement isFinder](v8, "isFinder");
LABEL_11:
    v11 = (id)-[NIServerFindingAdvertisement address](v8, "address");
    v12 = (int)v11;
    WORD2(v49) = WORD2(v11);
    v13 = *(_DWORD *)self->_address.__elems_;
    v46 = WORD2(v11);
    v47 = *(unsigned __int16 *)&self->_address.__elems_[4];
    canRange = self->_canRange;
    v45 = -[NIServerFindingAdvertisement canRange](v8, "canRange");
    useCase = self->_useCase;
    v43 = -[NIServerFindingAdvertisement useCase](v8, "useCase");
    if (v8)
    {
      -[NIServerFindingAdvertisement supportedTechnologies](v8, "supportedTechnologies");
      v15 = v49;
      v16 = v50;
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    begin = self->_supportedTechnologies.__begin_;
    end = self->_supportedTechnologies.__end_;
    if ((char *)end - (char *)begin == v16 - (_QWORD)v15)
    {
      if (begin == end)
      {
        v23 = 0;
        if (!v15)
        {
LABEL_26:
          if (self->_nbUwbAcquisitionChannelIdx)
          {
            v42 = 0;
          }
          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
            v42 = v25 == 0;

            if (!self->_nbUwbAcquisitionChannelIdx)
            {
              v29 = 0;
LABEL_33:
              uniqueIdentifier = self->_uniqueIdentifier;
              if (uniqueIdentifier)
              {
                v41 = 0;
              }
              else
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement uniqueIdentifier](v8, "uniqueIdentifier"));
                v41 = v31 == 0;

                uniqueIdentifier = self->_uniqueIdentifier;
              }
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement uniqueIdentifier](v8, "uniqueIdentifier"));
              v33 = -[NSData isEqualToData:](uniqueIdentifier, "isEqualToData:", v32);

              protocolVersion = self->_protocolVersion;
              v39 = -[NIServerFindingAdvertisement protocolVersion](v8, "protocolVersion");
              narrowBandMask = self->_narrowBandMask;
              v35 = -[NIServerFindingAdvertisement narrowBandMask](v8, "narrowBandMask");
              v10 = 0;
              if (v13 ^ v12 | v47 ^ v46)
                v36 = 1;
              else
                v36 = v9;
              if (canRange != v45)
                v36 = 1;
              if (useCase != v43)
                v36 = 1;
              if (((v36 | v23) & 1) != 0)
              {
                v4 = v48;
              }
              else
              {
                v4 = v48;
                if ((((v42 | v29) ^ 1) & 1) == 0 && (((v41 | v33) ^ 1) & 1) == 0)
                  v10 = protocolVersion == v39 && narrowBandMask == v35;
              }
              goto LABEL_56;
            }
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
          if (v26)
          {
            nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
            v29 = -[NSNumber isEqualToNumber:](nbUwbAcquisitionChannelIdx, "isEqualToNumber:", v28);

          }
          else
          {
            v29 = 0;
          }

          goto LABEL_33;
        }
LABEL_25:
        operator delete(v15);
        goto LABEL_26;
      }
      v19 = begin + 1;
      v20 = (int *)v15;
      do
      {
        v21 = *v20++;
        v22 = *(v19 - 1);
        v23 = v22 != v21;
      }
      while (v22 == v21 && v19++ != end);
    }
    else
    {
      v23 = 1;
    }
    if (!v15)
      goto LABEL_26;
    goto LABEL_25;
  }
  v10 = 0;
LABEL_57:

  return v10;
}

- (id)description
{
  id v3;
  uint64_t i;
  id v5;
  int *begin;
  unint64_t v7;
  unint64_t v8;
  const char *v9;
  _BOOL8 canRange;
  const char *v11;
  uint64_t protocolVersion;
  uint64_t narrowBandMask;
  NSData *uniqueIdentifier;
  NSNumber *nbUwbAcquisitionChannelIdx;
  uint64_t v16;
  __CFString *v17;
  void *v18;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("0x"));
  for (i = 0; i != 6; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), self->_address.__elems_[i]);
  v5 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("["));
  begin = self->_supportedTechnologies.__begin_;
  if (self->_supportedTechnologies.__end_ != begin)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("%s"), sub_1002B73E4(begin[v7]));
      begin = self->_supportedTechnologies.__begin_;
      v8 = self->_supportedTechnologies.__end_ - begin;
      if (v8 - 1 > v7)
      {
        objc_msgSend(v5, "appendString:", CFSTR(", "));
        begin = self->_supportedTechnologies.__begin_;
        v8 = self->_supportedTechnologies.__end_ - begin;
      }
      ++v7;
    }
    while (v8 > v7);
  }
  objc_msgSend(v5, "appendString:", CFSTR("]"));
  v9 = sub_1002B69E0(self->_isFinder);
  canRange = self->_canRange;
  v11 = sub_1002B69C4(self->_useCase);
  protocolVersion = self->_protocolVersion;
  narrowBandMask = self->_narrowBandMask;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v16 = CUPrintNSDataHex(uniqueIdentifier, -[NSData length](uniqueIdentifier, "length"), 0);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(v16);
  }
  else
  {
    v17 = CFSTR("-");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%s, addr: %@, canRange:%d, useCase: %s, supportedTech:%@, nbUwbChIdx:%@, protocolVer: %d, nbMask:%hu, ID:0x%@>"), v9, v3, canRange, v11, v5, nbUwbAcquisitionChannelIdx, protocolVersion, narrowBandMask, v17));
  if (uniqueIdentifier)

  return v18;
}

- (BOOL)isFinder
{
  return self->_isFinder;
}

- (array<unsigned)address
{
  unsigned int dest;
  unsigned __int16 v4;

  objc_copyStruct(&dest, &self->_address, 6, 1, 0);
  return (array<unsigned char, 6UL>)(dest | ((unint64_t)v4 << 32));
}

- (void)setAddress:(array<unsigned)char
{
  array<unsigned char, 6UL> src;

  src = a3;
  objc_copyStruct(&self->_address, &src, 6, 1, 0);
}

- (BOOL)canRange
{
  return self->_canRange;
}

- (void)setCanRange:(BOOL)a3
{
  self->_canRange = a3;
}

- (int)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(int)a3
{
  self->_useCase = a3;
}

- (NSNumber)nbUwbAcquisitionChannelIdx
{
  return self->_nbUwbAcquisitionChannelIdx;
}

- (void)setNbUwbAcquisitionChannelIdx:(id)a3
{
  objc_storeStrong((id *)&self->_nbUwbAcquisitionChannelIdx, a3);
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unsigned __int8)a3
{
  self->_protocolVersion = a3;
}

- (unsigned)narrowBandMask
{
  return self->_narrowBandMask;
}

- (void)setNarrowBandMask:(unsigned __int8)a3
{
  self->_narrowBandMask = a3;
}

- (NSData)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (vector<rose::finding::Technology,)supportedTechnologies
{
  vector<rose::finding::Technology, std::allocator<rose::finding::Technology>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_supportedTechnologies, (void (__cdecl *)(void *, const void *))sub_1002E5220);
  return result;
}

- (void)setSupportedTechnologies:()vector<rose:(std::allocator<rose::finding::Technology>> *)a3 :finding::Technology
{
  objc_copyCppObjectAtomic(&self->_supportedTechnologies, a3, (void (__cdecl *)(void *, const void *))sub_1002E5250);
}

- (void).cxx_destruct
{
  int *begin;

  begin = self->_supportedTechnologies.__begin_;
  if (begin)
  {
    self->_supportedTechnologies.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_nbUwbAcquisitionChannelIdx, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
