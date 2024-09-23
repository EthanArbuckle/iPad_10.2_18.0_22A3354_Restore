@implementation NRBabelInterfaceSocket

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  uint64_t v6;
  int fd;
  ssize_t v10;
  ssize_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  const double *p_iov_len;
  int32x4_t v17;
  uint64_t v18;
  int32x4_t v19;
  const double *v20;
  unsigned __int128 v21;
  const double *v22;
  unsigned __int128 v23;
  const double *v24;
  const double *v25;
  unsigned __int128 v26;
  unsigned __int128 v27;
  uint64_t v28;
  size_t *v29;
  int v30;
  id v31;
  uint64_t v32;
  void *IPv6AddrString;
  msghdr v34;
  uint64_t v35;
  in6_addr v36;
  unsigned int ifIndex;
  char __strerrbuf[128];

  v6 = *(_QWORD *)&a4;
  if (-[NRBabelInterface viable](self, "viable"))
  {
    fd = self->_fd;
    v35 = 672800284;
    ifIndex = self->_ifIndex;
    v36 = *a5;
    v34.msg_name = &v35;
    *(&v34.msg_namelen + 1) = 0;
    v34.msg_namelen = 28;
    v34.msg_iov = a3;
    memset(&v34.msg_iovlen + 1, 0, 20);
    v34.msg_iovlen = v6;
    v10 = sendmsg(fd, &v34, 0);
    if (v10 < 0)
    {
      v14 = *__error();
      if (strerror_r(v14, __strerrbuf, 0x80uLL))
        __strerrbuf[0] = 0;
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 17, "sendmsg failed: [%d] %s", v14, __strerrbuf);
      }
    }
    else
    {
      v11 = v10;
      if ((_DWORD)v6)
      {
        v12 = v6;
        if (v6 > 8)
        {
          v15 = v6 & 7;
          if (!v15)
            v15 = 8;
          v13 = v6 - v15;
          p_iov_len = (const double *)&a3[4].iov_len;
          v17 = 0uLL;
          v18 = v13;
          v19 = 0uLL;
          do
          {
            v20 = p_iov_len - 8;
            v21 = (unsigned __int128)vld2q_f64(v20);
            v22 = p_iov_len - 4;
            v23 = (unsigned __int128)vld2q_f64(v22);
            v24 = p_iov_len + 16;
            v26 = (unsigned __int128)vld2q_f64(p_iov_len);
            v25 = p_iov_len + 4;
            v27 = (unsigned __int128)vld2q_f64(v25);
            v17 = vaddq_s32(v17, vuzp1q_s32((int32x4_t)v21, (int32x4_t)v23));
            v19 = vaddq_s32(v19, vuzp1q_s32((int32x4_t)v26, (int32x4_t)v27));
            p_iov_len = v24;
            v18 -= 8;
          }
          while (v18);
          LODWORD(v6) = vaddvq_s32(vaddq_s32(v19, v17));
        }
        else
        {
          v13 = 0;
          LODWORD(v6) = 0;
        }
        v28 = v12 - v13;
        v29 = &a3[v13].iov_len;
        do
        {
          v30 = *(_DWORD *)v29;
          v29 += 2;
          v6 = (v6 + v30);
          --v28;
        }
        while (v28);
      }
      if ((_DWORD)v6 != (_DWORD)v10)
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          v31 = (id)qword_1001E4740;
          IPv6AddrString = (void *)createIPv6AddrString(a5, v32);
          _NRLogWithArgs(v31, 16, "%s%.30s:%-4d sent %zd instead of %u to %@", ", "-[NRBabelInterfaceSocket sendPacket:iovLen:toAddr:]", 815, v11, v6, IPv6AddrString);

        }
      }
    }
  }
}

- (void)dealloc
{
  NSObject *socketReadSource;
  int fd;
  OS_nw_path_evaluator *pathEvaluator;
  objc_super v6;

  socketReadSource = self->_socketReadSource;
  if (socketReadSource)
    dispatch_source_cancel(socketReadSource);
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
    close(fd);
  pathEvaluator = self->_pathEvaluator;
  if (pathEvaluator)
    nw_path_evaluator_cancel(pathEvaluator, a2);
  v6.receiver = self;
  v6.super_class = (Class)NRBabelInterfaceSocket;
  -[NRBabelInterface dealloc](&v6, "dealloc");
}

- (void)readPackets
{
  NRBabelInterfaceSocket *v2;
  void *v3;
  int fd;
  ssize_t v5;
  unsigned __int8 *msg_name;
  ssize_t v7;
  char *v8;
  void *v9;
  unsigned __int8 v10;
  id v12;
  int IsLevelEnabled;
  id v14;
  uint64_t v15;
  void *IPv6AddrString;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  unsigned int v28;
  id v29;
  char v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  int v42;
  id v43;
  uint64_t v44;
  void *v45;
  int *v46;
  int v47;
  void *v48;
  unint64_t v49;
  unsigned int *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  msghdr v55;
  _QWORD v56[2];
  _QWORD v57[3];
  int v58;
  char v59[128];
  char __strerrbuf[128];
  _BYTE v61[2000];
  _OWORD v62[2];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterface instance](self, "instance"));
  if (!v3)
    goto LABEL_102;
  fd = v2->_fd;
  v49 = (unint64_t)v62 | 0xC;
  memset(v62, 0, sizeof(v62));
  memset(v57, 0, sizeof(v57));
  v58 = 0;
  v56[0] = v61;
  v56[1] = 2000;
  v50 = (unsigned int *)v2;
LABEL_3:
  while (1)
  {
    *(&v55.msg_namelen + 1) = 0;
    *(&v55.msg_iovlen + 1) = 0;
    v55.msg_name = v57;
    v55.msg_namelen = 28;
    v55.msg_iov = (iovec *)v56;
    v55.msg_iovlen = 1;
    v55.msg_control = v62;
    *(_QWORD *)&v55.msg_controllen = 32;
    v5 = recvmsg(fd, &v55, 0);
    if (v5 < 0)
      break;
    if (v55.msg_namelen >= 0x1C && (msg_name = (unsigned __int8 *)v55.msg_name) != 0)
    {
      if (*((_BYTE *)v55.msg_name + 1) == 30)
      {
        if (*(unsigned __int8 *)v55.msg_name <= 0x1Bu)
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d packet source sin6_len too short %u < %zu", ", "-[NRBabelInterfaceSocket readPackets]", 880, *msg_name, 0x1CuLL);
          }
          continue;
        }
        v7 = v5;
        v8 = (char *)v55.msg_name + 8;
        if (*((unsigned __int8 *)v55.msg_name + 8) == 254 && (*((_BYTE *)v55.msg_name + 9) & 0xC0) == 0x80
          || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterfaceSocket ifName](v2, "ifName")),
              v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("ipsec")),
              v9,
              v2 = (NRBabelInterfaceSocket *)v50,
              (v10 & 1) != 0))
        {
          if (*((_WORD *)msg_name + 1) == 10266)
          {
            if (v55.msg_controllen - 33 >= 0xFFFFFFF3 && v55.msg_control == v62)
            {
              if (DWORD2(v62[0]) == 46)
              {
                if (HIDWORD(v62[1]) == v2->_ifIndex)
                {
                  if (-[NRBabelInterface isLocalAddressEqualTo:](v2, "isLocalAddressEqualTo:", v49))
                    goto LABEL_44;
                  if (*(_QWORD *)((char *)v62 + 12) == 767 && *(_QWORD *)((char *)&v62[1] + 4) == 0x600010000000000)
                    goto LABEL_44;
                  if (qword_1001E4748 != -1)
                    dispatch_once(&qword_1001E4748, &stru_1001B7158);
                  v12 = (id)qword_1001E4740;
                  IsLevelEnabled = _NRLogIsLevelEnabled(v12, 1);

                  if (IsLevelEnabled)
                  {
                    v14 = sub_1000B093C();
                    IPv6AddrString = (void *)createIPv6AddrString(v49, v15);
                    _NRLogWithArgs(v14, 1, "%s%.30s:%-4d received packet on wrong local address %@, rechecking", ", "-[NRBabelInterfaceSocket readPackets]", 942, IPv6AddrString);

                  }
                  v2 = (NRBabelInterfaceSocket *)v50;
                  if ((objc_msgSend(v50, "setupLocalAddressCheckAgainst:", v49) & 1) != 0)
                  {
LABEL_44:
                    objc_msgSend(v3, "handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:", v61, v7, msg_name + 8, v49, v2, 0);
                  }
                  else
                  {
                    v41 = sub_1000B093C();
                    v42 = _NRLogIsLevelEnabled(v41, 16);

                    v2 = (NRBabelInterfaceSocket *)v50;
                    if (v42)
                    {
                      v43 = sub_1000B093C();
                      v45 = (void *)createIPv6AddrString(v49, v44);
                      _NRLogWithArgs(v43, 16, "%s%.30s:%-4d packet was sent to wrong local address %@", ", "-[NRBabelInterfaceSocket readPackets]", 945, v45);

                      v2 = (NRBabelInterfaceSocket *)v50;
                    }
                  }
                  continue;
                }
                v48 = v3;
                v53 = 0u;
                v54 = 0u;
                v51 = 0u;
                v52 = 0u;
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interfaces"));
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
                if (!v21)
                {
LABEL_85:

                  if (qword_1001E4748 != -1)
                    dispatch_once(&qword_1001E4748, &stru_1001B7158);
                  v2 = (NRBabelInterfaceSocket *)v50;
                  v3 = v48;
                  if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
                  {
                    if (qword_1001E4748 != -1)
                      dispatch_once(&qword_1001E4748, &stru_1001B7158);
                    v36 = (id)qword_1001E4740;
                    v38 = (void *)createIPv6AddrString(v8, v37);
                    v40 = (void *)createIPv6AddrString(v49, v39);
                    _NRLogWithArgs(v36, 16, "%s%.30s:%-4d packet from %@ to %@ came over wrong interface %u, expected %u", ", "-[NRBabelInterfaceSocket readPackets]", 934, v38, v40, HIDWORD(v62[1]), v50[12]);

                    v2 = (NRBabelInterfaceSocket *)v50;
                  }
                  continue;
                }
                v22 = v21;
                v23 = *(_QWORD *)v52;
LABEL_72:
                v24 = 0;
                while (1)
                {
                  if (*(_QWORD *)v52 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v24);
                  v26 = objc_opt_class(NRBabelInterfaceSocket);
                  if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
                  {
                    v27 = v25;
                    v28 = objc_msgSend(v27, "ifIndex");
                    if (v28 == HIDWORD(v62[1]))
                    {
                      v3 = v48;
                      objc_msgSend(v48, "handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:", v61, v7, v8, v49, v27, 0);

                      if (qword_1001E4748 != -1)
                        dispatch_once(&qword_1001E4748, &stru_1001B7158);
                      v29 = (id)qword_1001E4740;
                      v30 = _NRLogIsLevelEnabled(v29, 2);

                      v2 = (NRBabelInterfaceSocket *)v50;
                      if ((v30 & 1) != 0)
                      {
                        if (qword_1001E4748 != -1)
                          dispatch_once(&qword_1001E4748, &stru_1001B7158);
                        v31 = (id)qword_1001E4740;
                        v33 = (void *)createIPv6AddrString(v8, v32);
                        v35 = (void *)createIPv6AddrString(v49, v34);
                        _NRLogWithArgs(v31, 2, "%s%.30s:%-4d handled packet from %@ to %@ that came over wrong interface %u, expected %u", ", "-[NRBabelInterfaceSocket readPackets]", 930, v33, v35, HIDWORD(v62[1]), v50[12]);

                        v2 = (NRBabelInterfaceSocket *)v50;
                      }
                      goto LABEL_3;
                    }

                  }
                  if (v22 == (id)++v24)
                  {
                    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
                    if (!v22)
                      goto LABEL_85;
                    goto LABEL_72;
                  }
                }
              }
              if (qword_1001E4748 != -1)
                dispatch_once(&qword_1001E4748, &stru_1001B7158);
              if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
              {
                if (qword_1001E4748 != -1)
                  dispatch_once(&qword_1001E4748, &stru_1001B7158);
                _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d Invalid cmsg_type %d", ", "-[NRBabelInterfaceSocket readPackets]", 903, DWORD2(v62[0]));
              }
            }
            else
            {
              if (qword_1001E4748 != -1)
                dispatch_once(&qword_1001E4748, &stru_1001B7158);
              if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
              {
                if (qword_1001E4748 != -1)
                  dispatch_once(&qword_1001E4748, &stru_1001B7158);
                _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d missing control message %u %p %p", ", "-[NRBabelInterfaceSocket readPackets]", 898, v55.msg_controllen, v55.msg_control, v62);
              }
            }
          }
          else
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
            {
              if (qword_1001E4748 != -1)
                dispatch_once(&qword_1001E4748, &stru_1001B7158);
              _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d packet came from wrong source port %u", ", "-[NRBabelInterfaceSocket readPackets]", 892, bswap32(*((unsigned __int16 *)msg_name + 1)) >> 16);
            }
          }
        }
        else
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            v17 = (id)qword_1001E4740;
            v19 = (void *)createIPv6AddrString(msg_name + 8, v18);
            _NRLogWithArgs(v17, 16, "%s%.30s:%-4d packet came from a non-link-local address %@", ", "-[NRBabelInterfaceSocket readPackets]", 887, v19);

            v2 = (NRBabelInterfaceSocket *)v50;
          }
        }
      }
      else
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d packet came from wrong address family %u", ", "-[NRBabelInterfaceSocket readPackets]", 876, msg_name[1]);
        }
      }
    }
    else
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d missing name message %u %p", ", "-[NRBabelInterfaceSocket readPackets]", 870, v55.msg_namelen, v55.msg_name);
      }
    }
  }
  v46 = __error();
  v47 = *v46;
  if (*v46 != 35)
  {
    if (strerror_r(*v46, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "recvmsg failed: [%d] %s", v47, __strerrbuf);
    }
  }
LABEL_102:

}

- (id)description
{
  id v3;
  NSString *ifName;
  unsigned int v5;
  const char *v6;

  v3 = objc_alloc((Class)NSString);
  ifName = self->_ifName;
  v5 = -[NRBabelInterface dtlsEnabled](self, "dtlsEnabled");
  v6 = "";
  if (v5)
    v6 = "_DTLS";
  return objc_msgSend(v3, "initWithFormat:", CFSTR("%@%s"), ifName, v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int ifIndex;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class(NRBabelInterfaceSocket);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    ifIndex = self->_ifIndex;
    v7 = ifIndex == objc_msgSend(v4, "ifIndex");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3
{
  int v5;
  ifaddrs *v6;
  __objc2_prot *v7;
  __objc2_prot *v8;
  sockaddr *ifa_addr;
  NRBabelInterfaceSocket *v10;
  __objc2_prop_list *v11;
  uint64_t v12;
  __objc2_prot *v13;
  void *IPv6AddrString;
  uint64_t v15;
  void *v16;
  in6_addr *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  ifaddrs *v23;
  unsigned int v24;
  __objc2_prop_list *v25;
  in6_addr *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  ifaddrs *v32;
  char __strerrbuf[128];

  v32 = 0;
  if (getifaddrs(&v32))
  {
    v5 = *__error();
    if (strerror_r(v5, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "getifaddrs failed: [%d] %s", v5, __strerrbuf);
    }
LABEL_38:
    LOBYTE(v24) = 0;
    return v24;
  }
  v6 = v32;
  if (!v32)
  {
    v23 = 0;
LABEL_37:
    freeifaddrs(v23);
    goto LABEL_38;
  }
  v7 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  v8 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  while (1)
  {
    ifa_addr = v6->ifa_addr;
    if (ifa_addr->sa_family != 30)
      goto LABEL_13;
    v10 = self;
    if (*(_QWORD *)&v7[25].cb != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(v8[25].inst_props, 2))
    {
      if (*(_QWORD *)&v7[25].cb != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v11 = v8[25].inst_props;
      v13 = v8;
      IPv6AddrString = (void *)createIPv6AddrString(a3, v12);
      v16 = (void *)createIPv6AddrString(&ifa_addr->sa_data[6], v15);
      v17 = -[NRBabelInterface localAddress](v10, "localAddress");
      v19 = (void *)createIPv6AddrString(v17, v18);
      _NRLogWithArgs(v11, 2, "%s%.30s:%-4d %@ checking destination address %@ vs one of local %@, current local %@", ", "-[NRBabelInterfaceSocket setupLocalAddressCheckAgainst:]", 990, v10, IPv6AddrString, v16, v19);

      v8 = v13;
      v7 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterfaceSocket ifName](v10, "ifName"));
    v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("ipsec"));

    if ((v21 & 1) == 0)
      break;
    if (ifa_addr->sa_data[6] == 253 && ifa_addr->sa_data[7] == 116)
      goto LABEL_28;
LABEL_12:

LABEL_13:
    v6 = v6->ifa_next;
    if (!v6)
    {
      v23 = v32;
      goto LABEL_37;
    }
  }
  if (*(_DWORD *)&ifa_addr[1].sa_data[6] != v10->_ifIndex
    || ifa_addr->sa_data[6] != 254
    || (ifa_addr->sa_data[7] & 0xC0) != 0x80)
  {
    goto LABEL_12;
  }
LABEL_28:
  if (a3)
  {
    if (*(_QWORD *)a3->__u6_addr8 != *(_QWORD *)&ifa_addr->sa_data[6]
      || *(_QWORD *)&a3->__u6_addr32[2] != *(_QWORD *)&ifa_addr[1].sa_len)
    {
      goto LABEL_12;
    }
  }
  if (!-[NRBabelInterface isLocalAddressEqualTo:](v10, "isLocalAddressEqualTo:", &ifa_addr->sa_data[6]))
  {
    if (*(_QWORD *)&v7[25].cb != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(v8[25].inst_props, 1))
    {
      if (*(_QWORD *)&v7[25].cb != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v25 = v8[25].inst_props;
      v26 = -[NRBabelInterface localAddress](v10, "localAddress");
      v28 = (void *)createIPv6AddrString(v26, v27);
      v30 = (void *)createIPv6AddrString(&ifa_addr->sa_data[6], v29);
      _NRLogWithArgs(v25, 1, "%s%.30s:%-4d changing %@ address from %@ to %@", ", "-[NRBabelInterfaceSocket setupLocalAddressCheckAgainst:]", 1010, v10, v28, v30);

    }
  }
  -[NRBabelInterface setLocalAddress:](v10, "setLocalAddress:", &ifa_addr->sa_data[6]);

  freeifaddrs(v32);
  if (!a3 || (v24 = -[NRBabelInterface isLocalAddressEqualTo:](v10, "isLocalAddressEqualTo:", a3)) != 0)
    LOBYTE(v24) = 1;
  return v24;
}

- (BOOL)setupLocalAddress
{
  return -[NRBabelInterfaceSocket setupLocalAddressCheckAgainst:](self, "setupLocalAddressCheckAgainst:", 0);
}

- (NRBabelInterfaceSocket)initWithInstance:(id)a3 interface:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NRBabelInterfaceSocket *v7;
  NRBabelInterfaceSocket *v8;
  BOOL v9;
  id v10;
  NSString *v11;
  NSString *ifName;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  id v19;
  int v20;
  id v21;
  int IsLevelEnabled;
  id v23;
  int v24;
  id v25;
  int v26;
  id v27;
  int v28;
  id v29;
  int v30;
  id v31;
  int v32;
  id v33;
  int v34;
  id v35;
  int v36;
  id v37;
  int v38;
  id v39;
  int v40;
  id v41;
  int v42;
  id v43;
  int v44;
  id v45;
  int v46;
  id v47;
  int v48;
  id v49;
  int v50;
  id v51;
  NSObject *v52;
  dispatch_source_t v53;
  OS_dispatch_source *socketReadSource;
  NSObject *v55;
  id v56;
  char v57;
  id v58;
  uint64_t v59;
  OS_nw_interface *nwIf;
  NSObject *v61;
  id v62;
  uint64_t evaluator_for_endpoint;
  OS_nw_path_evaluator *pathEvaluator;
  OS_nw_path_evaluator *v65;
  void *v66;
  unsigned __int8 v67;
  OS_nw_path_evaluator *v68;
  NRBabelInterfaceSocket *v69;
  int v70;
  id v71;
  int v72;
  id v73;
  id v74;
  int v75;
  id v76;
  char v77;
  id v78;
  id v79;
  int v80;
  id v81;
  id v82;
  int v83;
  id v84;
  NRBabelInterfaceSocket *v85;
  _QWORD v87[4];
  id v88;
  _QWORD block[4];
  id v90;
  _QWORD handler[4];
  id v92;
  sockaddr v93[2];
  __int128 v94;
  unsigned int v95;
  objc_super v96;
  unsigned int v97;
  id __strerrbuf[16];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v97 = v4;
  v96.receiver = self;
  v96.super_class = (Class)NRBabelInterfaceSocket;
  v7 = -[NRBabelInterface initWithInstance:](&v96, "initWithInstance:", v6);
  v8 = v7;
  if (!v7)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "[super initWithInstance:] failed");
    }
    goto LABEL_117;
  }
  v7->_ifIndex = v4;
  v9 = if_indextoname(v4, (char *)__strerrbuf) == 0;
  v10 = objc_alloc((Class)NSString);
  if (v9)
    v11 = (NSString *)objc_msgSend(v10, "initWithFormat:", CFSTR("invalid%u"), v4);
  else
    v11 = (NSString *)objc_msgSend(v10, "initWithUTF8String:", __strerrbuf);
  ifName = v8->_ifName;
  v8->_ifName = v11;

  if (-[NSString hasPrefix:](v8->_ifName, "hasPrefix:", CFSTR("en")))
    -[NRBabelInterface setDtlsEnabled:](v8, "setDtlsEnabled:", 1);
  v13 = socket(30, 2, 0);
  if ((v13 & 0x80000000) != 0)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "socket(AF_INET6, SOCK_DGRAM, 0) failed");
    }
    goto LABEL_117;
  }
  if (!-[NRBabelInterfaceSocket setupLocalAddress](v8, "setupLocalAddress"))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d %@ failed to find local address", ", "-[NRBabelInterfaceSocket initWithInstance:interface:]", 1056, v8);
    }
    goto LABEL_116;
  }
  v14 = fcntl(v13, 3, 0);
  if (v14 < 0)
  {
    v17 = *__error();
    if (strerror_r(v17, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "fcntl(%d, F_GETFL, 0): [%d] %s", v13, v17, (const char *)__strerrbuf);
    }
    goto LABEL_116;
  }
  v15 = v14 | 4;
  if (fcntl(v13, 4, v14 | 4u))
  {
    v16 = *__error();
    if (strerror_r(v16, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "fcntl(%d, F_SETFL, %d): [%d] %s", v13, v15, v16, (const char *)__strerrbuf);
    }
    goto LABEL_116;
  }
  v94 = xmmword_10015D020;
  v95 = v97;
  if (setsockopt(v13, 41, 12, &v94, 0x14u))
  {
    v18 = *__error();
    if (strerror_r(v18, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      v19 = sub_1000B093C();
      _NRLogWithArgs(v19, 17, "failed to join mcast group: [%d] %s", v18, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  if (setsockopt(v13, 41, 11, &unk_10015CFFC, 4u))
  {
    v20 = *__error();
    if (strerror_r(v20, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    v21 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v21, 17);

    if (IsLevelEnabled)
    {
      v23 = sub_1000B093C();
      _NRLogWithArgs(v23, 17, "IPV6_MULTICAST_LOOP failed: [%d] %s", v20, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  if (setsockopt(v13, 0xFFFF, 4, &unk_10015D000, 4u))
  {
    v24 = *__error();
    if (strerror_r(v24, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    v25 = sub_1000B093C();
    v26 = _NRLogIsLevelEnabled(v25, 17);

    if (v26)
    {
      v27 = sub_1000B093C();
      _NRLogWithArgs(v27, 17, "SO_REUSEADDR failed: [%d] %s", v24, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  if (setsockopt(v13, 0xFFFF, 512, &unk_10015D000, 4u))
  {
    v28 = *__error();
    if (strerror_r(v28, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    v29 = sub_1000B093C();
    v30 = _NRLogIsLevelEnabled(v29, 17);

    if (v30)
    {
      v31 = sub_1000B093C();
      _NRLogWithArgs(v31, 17, "SO_REUSEPORT failed: [%d] %s", v28, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  if (setsockopt(v13, 41, 125, &v97, 4u))
  {
    v32 = *__error();
    if (strerror_r(v32, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    v33 = sub_1000B093C();
    v34 = _NRLogIsLevelEnabled(v33, 17);

    if (v34)
    {
      v35 = sub_1000B093C();
      _NRLogWithArgs(v35, 17, "IPV6_BOUND_IF %u failed: [%d] %s", v97, v32, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  if (setsockopt(v13, 41, 27, &unk_10015D000, 4u))
  {
    v36 = *__error();
    if (strerror_r(v36, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    v37 = sub_1000B093C();
    v38 = _NRLogIsLevelEnabled(v37, 17);

    if (v38)
    {
      v39 = sub_1000B093C();
      _NRLogWithArgs(v39, 17, "IPV6_V6ONLY failed: [%d] %s", v36, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  if (setsockopt(v13, 0xFFFF, 4130, &unk_10015D000, 4u))
  {
    v40 = *__error();
    if (strerror_r(v40, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    v41 = sub_1000B093C();
    v42 = _NRLogIsLevelEnabled(v41, 17);

    if (v42)
    {
      v43 = sub_1000B093C();
      _NRLogWithArgs(v43, 17, "SO_NOSIGPIPE failed: [%d] %s", v40, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  if (setsockopt(v13, 41, 61, &unk_10015D000, 4u))
  {
    v44 = *__error();
    if (strerror_r(v44, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    v45 = sub_1000B093C();
    v46 = _NRLogIsLevelEnabled(v45, 17);

    if (v46)
    {
      v47 = sub_1000B093C();
      _NRLogWithArgs(v47, 17, "IPV6_RECVPKTINFO failed: [%d] %s", v44, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  v93[0] = (sockaddr)xmmword_10015D004;
  *(_OWORD *)&v93[0].sa_data[10] = *(__int128 *)((char *)&xmmword_10015D004 + 12);
  if (bind(v13, v93, 0x1Cu))
  {
    v48 = *__error();
    if (strerror_r(v48, (char *)__strerrbuf, 0x80uLL))
      LOBYTE(__strerrbuf[0]) = 0;
    v49 = sub_1000B093C();
    v50 = _NRLogIsLevelEnabled(v49, 17);

    if (v50)
    {
      v51 = sub_1000B093C();
      _NRLogWithArgs(v51, 17, "bind failed: [%d] %s", v48, (const char *)__strerrbuf);

    }
    goto LABEL_116;
  }
  v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queue"));
  v53 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v13, 0, v52);
  socketReadSource = v8->_socketReadSource;
  v8->_socketReadSource = (OS_dispatch_source *)v53;

  if (!v8->_socketReadSource)
  {
    v71 = sub_1000B093C();
    v72 = _NRLogIsLevelEnabled(v71, 17);

    if (v72)
    {
      v73 = sub_1000B093C();
      _NRLogWithArgs(v73, 17, "dispatch_source_create failed");

    }
    goto LABEL_116;
  }
  v8->_fd = v13;
  objc_initWeak(__strerrbuf, v8);
  v55 = v8->_socketReadSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B3958;
  handler[3] = &unk_1001B7F28;
  objc_copyWeak(&v92, __strerrbuf);
  dispatch_source_set_event_handler(v55, handler);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B3984;
  block[3] = &unk_1001B7F28;
  objc_copyWeak(&v90, __strerrbuf);
  dispatch_async(v52, block);
  dispatch_activate((dispatch_object_t)v8->_socketReadSource);
  v56 = sub_1000B093C();
  v57 = _NRLogIsLevelEnabled(v56, 1);

  if ((v57 & 1) != 0)
  {
    v58 = sub_1000B093C();
    _NRLogWithArgs(v58, 1, "%s%.30s:%-4d succesfully opened socket fd %d on %@", ", "-[NRBabelInterfaceSocket initWithInstance:interface:]", 1159, v13, v8->_ifName);

  }
  v59 = nw_interface_create_with_index(v97);
  nwIf = v8->_nwIf;
  v8->_nwIf = (OS_nw_interface *)v59;

  if (!v8->_nwIf)
  {
    v74 = sub_1000B093C();
    v75 = _NRLogIsLevelEnabled(v74, 16);

    if (!v75)
    {
      v70 = 6;
      goto LABEL_115;
    }
    v62 = sub_1000B093C();
    _NRLogWithArgs(v62, 16, "%s%.30s:%-4d failed to open interface index %u", ", "-[NRBabelInterfaceSocket initWithInstance:interface:]", 1163, v97);
    goto LABEL_113;
  }
  v61 = nw_parameters_create();
  v62 = v61;
  if (!v61)
  {
    v76 = sub_1000B093C();
    v77 = _NRLogIsLevelEnabled(v76, 17);

    if ((v77 & 1) != 0)
    {
      v78 = sub_1000B093C();
      _NRLogWithArgs(v78, 17, "nw_parameters_create failed");

    }
    v62 = 0;
    goto LABEL_113;
  }
  nw_parameters_require_interface(v61, (nw_interface_t)v8->_nwIf);
  evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(0, v62);
  pathEvaluator = v8->_pathEvaluator;
  v8->_pathEvaluator = (OS_nw_path_evaluator *)evaluator_for_endpoint;

  v65 = v8->_pathEvaluator;
  if (!v65)
  {
    v79 = sub_1000B093C();
    v80 = _NRLogIsLevelEnabled(v79, 17);

    if (v80)
    {
      v81 = sub_1000B093C();
      _NRLogWithArgs(v81, 17, "nw_path_create_evaluator_for_endpoint with ifIndex %u failed", v97);

    }
    goto LABEL_113;
  }
  v66 = (void *)nw_path_evaluator_copy_path(v65);
  v67 = -[NRBabelInterfaceSocket handlePathUpdate:](v8, "handlePathUpdate:", v66);

  if ((v67 & 1) == 0)
  {
    v82 = sub_1000B093C();
    v83 = _NRLogIsLevelEnabled(v82, 16);

    if (v83)
    {
      v84 = sub_1000B093C();
      _NRLogWithArgs(v84, 16, "%s%.30s:%-4d path for ifIndex %u is not satisfied", ", "-[NRBabelInterfaceSocket initWithInstance:interface:]", 1179, v97);

    }
LABEL_113:
    v70 = 6;
    goto LABEL_114;
  }
  v68 = v8->_pathEvaluator;
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_1000B39B0;
  v87[3] = &unk_1001B7850;
  objc_copyWeak(&v88, __strerrbuf);
  nw_path_evaluator_set_update_handler(v68, v52, v87);
  v69 = v8;
  objc_destroyWeak(&v88);
  v70 = 1;
LABEL_114:

LABEL_115:
  objc_destroyWeak(&v90);
  objc_destroyWeak(&v92);
  objc_destroyWeak(__strerrbuf);

  v85 = v8;
  if (v70 == 6)
  {
LABEL_116:
    close(v13);
LABEL_117:
    v85 = 0;
  }

  return v85;
}

- (BOOL)handlePathUpdate:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  NSString *ifName;
  void *v8;
  id v9;
  int mtu;
  int v11;
  BOOL v12;
  id v13;
  uint64_t status;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterface instance](self, "instance"));
  if (v5)
  {
    if (nw_path_get_status(v4) == nw_path_status_satisfied)
    {
      if (!-[NRBabelInterface viable](self, "viable"))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d if %@ is viable again", ", "-[NRBabelInterfaceSocket handlePathUpdate:]", 1207, self);
        }
      }
      -[NRBabelInterface setViable:](self, "setViable:", 1);
      v6 = objc_alloc((Class)NSString);
      ifName = self->_ifName;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addrStr"));
      v9 = objc_msgSend(v6, "initWithFormat:", CFSTR("for addr in $(ifconfig %@ | grep 'inet6 fdfd:' | sed -e 's/^[[:space:]]*//' | cut -d' ' -f2); do ifconfig %@ inet6 -alias $addr ; done ; ifconfig %@ inet6 %@/128"),
             ifName,
             ifName,
             ifName,
             v8);

      system((const char *)objc_msgSend(v9, "UTF8String"));
      mtu = nw_path_get_mtu(v4);
      v11 = mtu - 48;
      if (mtu > 559)
      {
        if (mtu >= 0x10030)
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d MTU for ifIndex %u is high %d", ", "-[NRBabelInterfaceSocket handlePathUpdate:]", 1225, self->_ifIndex, v11);
          }
          v11 = 0xFFFF;
        }
      }
      else
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d MTU for ifIndex %u is low %d", ", "-[NRBabelInterfaceSocket handlePathUpdate:]", 1222, self->_ifIndex, v11);
        }
        v11 = 512;
      }
      if (-[NRBabelInterface mtu](self, "mtu") != (unsigned __int16)v11)
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          v15 = (id)qword_1001E4740;
          _NRLogWithArgs(v15, 1, "%s%.30s:%-4d updating MTU from %u to %d", ", "-[NRBabelInterfaceSocket handlePathUpdate:]", 1229, -[NRBabelInterface mtu](self, "mtu"), v11);

        }
        -[NRBabelInterface setMtu:](self, "setMtu:", (unsigned __int16)v11);
      }

      v12 = 1;
    }
    else
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        v13 = (id)qword_1001E4740;
        status = nw_path_get_status(v4);
        _NRLogWithArgs(v13, 1, "%s%.30s:%-4d canceling if %@ because path not satisfied %u", ", "-[NRBabelInterfaceSocket handlePathUpdate:]", 1201, self, status);

      }
      -[NRBabelInterface setViable:](self, "setViable:", 0);
      objc_msgSend(v5, "purgeInterface:", self);
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)addToProhibited:(id)a3
{
  __objc2_prot *v3;
  void *v5;
  id *v6;
  xpc_object_t v7;
  id v8;
  int IsLevelEnabled;
  id v10;
  int *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a3;
  v5 = (void *)nw_parameters_copy_prohibited_interfaces();
  if (!v5)
  {
    v6 = &v14;
    v7 = xpc_array_create(0, 0);
    if (!v7)
    {
      v8 = sub_1000B093C();
      IsLevelEnabled = _NRLogIsLevelEnabled(v8, 16);

      if (IsLevelEnabled)
      {
        v10 = sub_1000B093C();
        _NRLogWithArgs(v10, 16, "%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", ", "nr_xpc_array_create", 56, 0, 0);

      }
      v5 = (void *)_os_log_pack_size(28);
      self = (NRBabelInterfaceSocket *)((char *)&v14 - ((__chkstk_darwin(v5) + 15) & 0xFFFFFFFFFFFFFFF0));
      v11 = __error();
      v12 = _os_log_pack_fill(self, v5, *v11, &_mh_execute_header, "%{public}s xpc_array_create(%p, %u) failed");
      sub_10005ADB8(v12, (uint64_t)"nr_xpc_array_create");
      v13 = sub_1000B093C();
      _NRLogAbortWithPack(v13, self);
LABEL_15:
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
      goto LABEL_7;
    }
    v5 = v7;
  }
  v6 = (id *)nw_interface_copy_dictionary(self->_nwIf);
  if (v6)
  {
    xpc_array_append_value(v5, v6);
    nw_parameters_set_prohibited_interfaces(v14, v5);
    goto LABEL_11;
  }
  v3 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if (qword_1001E4748 != -1)
    goto LABEL_15;
LABEL_7:
  if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
  {
    if (*(_QWORD *)&v3[25].cb != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 17, "nw_interface_copy_dictionary(%u, %@) failed", self->_ifIndex, self->_ifName);
  }
LABEL_11:

}

- (unsigned)ifIndex
{
  return self->_ifIndex;
}

- (void)setIfIndex:(unsigned int)a3
{
  self->_ifIndex = a3;
}

- (NSString)ifName
{
  return self->_ifName;
}

- (void)setIfName:(id)a3
{
  objc_storeStrong((id *)&self->_ifName, a3);
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (OS_dispatch_source)socketReadSource
{
  return self->_socketReadSource;
}

- (void)setSocketReadSource:(id)a3
{
  objc_storeStrong((id *)&self->_socketReadSource, a3);
}

- (OS_nw_path_evaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_pathEvaluator, a3);
}

- (OS_nw_interface)nwIf
{
  return self->_nwIf;
}

- (void)setNwIf:(id)a3
{
  objc_storeStrong((id *)&self->_nwIf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwIf, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_socketReadSource, 0);
  objc_storeStrong((id *)&self->_ifName, 0);
}

@end
