@implementation NRBabelPrefix

- (NRBabelPrefix)initWithPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4
{
  uint64_t v6;
  const char *v7;
  NRBabelPrefix *result;
  id v9;
  int IsLevelEnabled;
  id v11;
  int *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  objc_super v16;

  v6 = a4;
  if (a4 < 0x81u)
    goto LABEL_8;
  LODWORD(v7) = a4;
  v6 = (uint64_t)&OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if (qword_1001E4748 != -1)
    goto LABEL_26;
  while (1)
  {
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (*(_QWORD *)(v6 + 1864) != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "attempted to create prefix with plen %u > 128", (_DWORD)v7);
    }
    v6 = 128;
LABEL_8:
    if (!a3->__u6_addr32[0] && !a3->__u6_addr32[1] && v6 <= 0x5F && a3->__u6_addr32[2] == -65536)
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 17, "attempted to create v4 prefix with plen %u < 96", v6);
      }
      if (v6 >= 0x21)
        v6 = 128;
      else
        v6 = (v6 + 96);
    }
    v16.receiver = self;
    v16.super_class = (Class)NRBabelPrefix;
    result = -[NRBabelPrefix init](&v16, "init");
    if (result)
      break;
    v9 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v9, 16);

    v7 = "-[NRBabelPrefix initWithPrefix:plen:]";
    if (IsLevelEnabled)
    {
      v11 = sub_1000B093C();
      _NRLogWithArgs(v11, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelPrefix initWithPrefix:plen:]", 558);

    }
    a3 = (const in6_addr *)_os_log_pack_size(12);
    self = (NRBabelPrefix *)((char *)&v15 - ((__chkstk_darwin(a3) + 15) & 0xFFFFFFFFFFFFFFF0));
    v12 = __error();
    v13 = _os_log_pack_fill(self, a3, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "-[NRBabelPrefix initWithPrefix:plen:]";
    v14 = sub_1000B093C();
    _NRLogAbortWithPack(v14, self);
LABEL_26:
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  }
  result->_prefixInner = *a3;
  result->_plen = v6;
  return result;
}

- (BOOL)matchesPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4
{
  unsigned int v4;
  in6_addr *p_prefixInner;
  char v7;
  size_t v8;

  if (self->_plen != a4)
    return 0;
  v4 = a4;
  p_prefixInner = &self->_prefixInner;
  if (a4 >= 0x81u)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "attempted to compare prefixes with plen %u > 128", v4);
    }
    v4 = 128;
  }
  v7 = v4;
  v8 = (unint64_t)v4 >> 3;
  if (memcmp(p_prefixInner, a3, v8))
    return 0;
  if ((v7 & 7) != 0)
  {
    if ((v7 & 0x80) == 0)
      return (a3->__u6_addr8[v8] ^ p_prefixInner->__u6_addr8[v8]) >> (8 - (v7 & 7)) == 0;
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "Invalid plenLastBits %u plenBytes %u", v7 & 7, v8);
    }
  }
  return 1;
}

- (id)description
{
  in6_addr *p_prefixInner;
  unsigned __int8 plen;
  id v4;
  uint64_t v5;
  void *IPv6AddrString;
  id v7;

  p_prefixInner = &self->_prefixInner;
  plen = self->_plen;
  if (!self->_prefixInner.__u6_addr32[0]
    && !self->_prefixInner.__u6_addr32[1]
    && self->_prefixInner.__u6_addr32[2] == -65536)
  {
    plen -= 96;
  }
  v4 = objc_alloc((Class)NSString);
  IPv6AddrString = (void *)createIPv6AddrString(p_prefixInner, v5);
  v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@/%u"), IPv6AddrString, plen);

  return v7;
}

- (id)descriptionWithoutPlen
{
  in6_addr *p_prefixInner;
  __uint32_t v4;
  void *IPv6AddrString;

  v4 = self->_prefixInner.__u6_addr32[0];
  p_prefixInner = &self->_prefixInner;
  if (v4 || self->_prefixInner.__u6_addr32[1] || self->_prefixInner.__u6_addr32[2] != -65536)
    IPv6AddrString = (void *)createIPv6AddrString(p_prefixInner, a2);
  else
    IPv6AddrString = 0;
  return IPv6AddrString;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = objc_opt_class(NRBabelPrefix);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = objc_msgSend(v4, "matchesPrefix:plen:", &self->_prefixInner, self->_plen);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isContainedInPrefix:(id)a3
{
  id v4;
  unsigned int plen;
  unsigned __int8 v6;

  v4 = a3;
  plen = self->_plen;
  if (plen >= objc_msgSend(v4, "plen"))
    v6 = objc_msgSend(v4, "matchesPrefix:plen:", &self->_prefixInner, objc_msgSend(v4, "plen"));
  else
    v6 = 0;

  return v6;
}

- (void)writePrefix:(in6_addr *)a3
{
  *a3 = self->_prefixInner;
}

- (unsigned)writeToAE:(char *)a3 plen:(char *)a4 prefix:(char *)a5
{
  unsigned int plen;
  unsigned int v10;
  in6_addr *p_prefixInner;
  int v12;
  __uint32_t v14;

  *(_QWORD *)a5 = 0;
  *((_QWORD *)a5 + 1) = 0;
  plen = self->_plen;
  if (plen < 0x81)
  {
    if (!self->_plen)
    {
      LOBYTE(v12) = 0;
      *a3 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "internal error plen %u > 128", plen);
    }
    plen = 128;
  }
  v10 = plen + 7;
  p_prefixInner = &self->_prefixInner;
  if (!self->_prefixInner.__u6_addr32[0] && !self->_prefixInner.__u6_addr32[1])
  {
    v14 = self->_prefixInner.__u6_addr32[2];
    if (v14)
    {
      if (v14 == -65536)
      {
        LOBYTE(plen) = plen - 96;
        v12 = (v10 >> 3) - 12;
        *a3 = 1;
        p_prefixInner = (in6_addr *)&self->_prefixInner.__u6_addr32[3];
        goto LABEL_13;
      }
    }
    else if (self->_prefixInner.__u6_addr32[3] == 0x1000000)
    {
      *a3 = 3;
      v12 = (v10 >> 3) - 8;
      p_prefixInner = (in6_addr *)&self->_prefixInner.__u6_addr32[2];
      goto LABEL_13;
    }
  }
  v12 = v10 >> 3;
  *a3 = 2;
LABEL_13:
  memcpy(a5, p_prefixInner, v12);
LABEL_14:
  *a4 = plen;
  return v12;
}

- (in6_addr)prefixInner
{
  uint64_t v2;
  uint64_t v3;
  in6_addr result;

  v2 = *(_QWORD *)&self->_prefixInner.__u6_addr32[2];
  v3 = *(_QWORD *)self->_prefixInner.__u6_addr8;
  *(_QWORD *)&result.__u6_addr32[2] = v2;
  *(_QWORD *)result.__u6_addr8 = v3;
  return result;
}

- (void)setPrefixInner:(in6_addr)a3
{
  self->_prefixInner = a3;
}

- (unsigned)plen
{
  return self->_plen;
}

- (void)setPlen:(unsigned __int8)a3
{
  self->_plen = a3;
}

@end
