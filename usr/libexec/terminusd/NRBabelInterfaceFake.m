@implementation NRBabelInterfaceFake

- (NRBabelInterfaceFake)initWithInstance:(id)a3 link:(id)a4
{
  id v6;
  id v7;
  NRBabelInterfaceFake *v8;
  NRBabelInterfaceFake *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NRBabelInterfaceFake *v15;
  NRBabelInterfaceFake *v16;
  _QWORD block[4];
  id v19;
  NRBabelInterfaceFake *v20;
  id v21;
  uint64_t v22;
  int v23;
  __int16 v24;
  __int16 v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NRBabelInterfaceFake;
  v8 = -[NRBabelInterface initWithInstance:](&v26, "initWithInstance:", v6);
  v9 = v8;
  if (v8)
  {
    -[NRBabelInterface setInstance:](v8, "setInstance:", v6);
    objc_storeStrong((id *)&v9->_link, a4);
    v22 = 33022;
    v23 = 0;
    v24 = __rev16(objc_msgSend(v7, "fakeLinkIndex"));
    v25 = (unint64_t)objc_msgSend(v6, "routerID") >> 48;
    -[NRBabelInterface setLocalAddress:](v9, "setLocalAddress:", &v22);
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v10 = (id)qword_1001E4740;
      v12 = (void *)createIPv6AddrString(&v22, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@attached via %@ to [%@]", ", "-[NRBabelInterfaceFake initWithInstance:link:]", 3909, v6, v12, v13);

    }
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C07C8;
    block[3] = &unk_1001B87A0;
    v19 = v6;
    v15 = v9;
    v20 = v15;
    v21 = v7;
    dispatch_async(v14, block);

    v16 = v15;
  }
  else
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "[super initWithInstance:] failed");
    }
  }

  return v9;
}

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  const double *p_iov_len;
  int32x4_t v13;
  uint64_t v14;
  int32x4_t v15;
  const double *v16;
  unsigned __int128 v17;
  const double *v18;
  unsigned __int128 v19;
  const double *v20;
  const double *v21;
  unsigned __int128 v22;
  unsigned __int128 v23;
  uint64_t v24;
  size_t *v25;
  int v26;
  char *v27;
  char *v28;
  int v29;
  size_t *v30;
  int v31;
  size_t v32;
  unint64_t v33;
  unint64_t v34;
  NRBabelInterfaceFake *v35;
  int v36;
  __objc2_prot *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  NRBabelInterfaceFake *v43;
  in6_addr *v44;
  void *v46;
  NSObject *v47;
  void *j;
  NRBabelInterfaceFake *v49;
  void *v50;
  NSObject *v51;
  id v52;
  int IsLevelEnabled;
  id v54;
  char *v55;
  int *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  NRBabelInterfaceFake *v61;
  void **v62;
  uint64_t v63;
  void (*v64)(uint64_t);
  void *v65;
  id v66;
  NRBabelInterfaceFake *v67;
  NRBabelInterfaceFake *v68;
  const in6_addr *v69;
  int v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];

  if (a4)
  {
    v8 = a4;
    if (a4 > 8)
    {
      v11 = a4 & 7;
      if (!v11)
        v11 = 8;
      v9 = a4 - v11;
      p_iov_len = (const double *)&a3[4].iov_len;
      v13 = 0uLL;
      v14 = v9;
      v15 = 0uLL;
      do
      {
        v16 = p_iov_len - 8;
        v17 = (unsigned __int128)vld2q_f64(v16);
        v18 = p_iov_len - 4;
        v19 = (unsigned __int128)vld2q_f64(v18);
        v20 = p_iov_len + 16;
        v22 = (unsigned __int128)vld2q_f64(p_iov_len);
        v21 = p_iov_len + 4;
        v23 = (unsigned __int128)vld2q_f64(v21);
        v13 = vaddq_s32(v13, vuzp1q_s32((int32x4_t)v17, (int32x4_t)v19));
        v15 = vaddq_s32(v15, vuzp1q_s32((int32x4_t)v22, (int32x4_t)v23));
        p_iov_len = v20;
        v14 -= 8;
      }
      while (v14);
      LODWORD(v10) = vaddvq_s32(vaddq_s32(v15, v13));
    }
    else
    {
      v9 = 0;
      LODWORD(v10) = 0;
    }
    v24 = a4 - v9;
    v25 = &a3[v9].iov_len;
    do
    {
      v26 = *(_DWORD *)v25;
      v25 += 2;
      v10 = (v10 + v26);
      --v24;
    }
    while (v24);
    if ((_DWORD)v10)
    {
      v27 = (char *)malloc_type_malloc(v10, 0xA172743EuLL);
      if (v27)
      {
        v28 = v27;
        v61 = self;
        v29 = 0;
        v30 = &a3->iov_len;
        do
        {
          v31 = v29;
          v32 = *v30;
          memcpy(&v28[v29], (const void *)*(v30 - 1), *v30);
          v29 = v32 + v31;
          v30 += 2;
          --v8;
        }
        while (v8);
        v33 = bswap64(*(_QWORD *)a5->__u6_addr8);
        v34 = 0xFF02000000000000;
        if (v33 == 0xFF02000000000000)
        {
          v34 = 65542;
          v33 = bswap64(*(_QWORD *)&a5->__u6_addr32[2]);
          v35 = v61;
          if (v33 == 65542)
          {
            v36 = 0;
LABEL_27:
            v60 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v28, v10, 1);
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v38 = (id)objc_claimAutoreleasedReturnValue(-[NRBabelLinkFake fakeInterfaces](v35->_link, "fakeInterfaces"));
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v72;
              if (v36)
              {
                do
                {
                  for (i = 0; i != v40; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v72 != v41)
                      objc_enumerationMutation(v38);
                    v43 = *(NRBabelInterfaceFake **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
                    v44 = -[NRBabelInterface localAddress](v43, "localAddress");
                    if (*(_QWORD *)v44->__u6_addr8 == *(_QWORD *)a5->__u6_addr8
                      && *(_QWORD *)&v44->__u6_addr32[2] == *(_QWORD *)&a5->__u6_addr32[2])
                    {
                      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterface instance](v43, "instance"));
                      v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "queue"));
                      v62 = _NSConcreteStackBlock;
                      v63 = 3221225472;
                      v64 = sub_1000C072C;
                      v65 = &unk_1001B7138;
                      v66 = v60;
                      v67 = v61;
                      v70 = v10;
                      v68 = v43;
                      v69 = a5;
                      dispatch_async(v47, &v62);

                    }
                  }
                  v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
                }
                while (v40);
              }
              else
              {
                v59 = v38;
                do
                {
                  for (j = 0; j != v40; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v72 != v41)
                      objc_enumerationMutation(v59);
                    v49 = *(NRBabelInterfaceFake **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)j);
                    if (v49 != v61)
                    {
                      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1)
                                                                                         + 8 * (_QWORD)j), "instance"));
                      v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "queue"));
                      v62 = _NSConcreteStackBlock;
                      v63 = 3221225472;
                      v64 = sub_1000C072C;
                      v65 = &unk_1001B7138;
                      v66 = v60;
                      v67 = v61;
                      v70 = v10;
                      v68 = v49;
                      v69 = a5;
                      dispatch_async(v51, &v62);

                    }
                  }
                  v40 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
                  v38 = v59;
                }
                while (v40);
              }
            }

            return;
          }
        }
        else
        {
          v35 = v61;
        }
        if (v34 < v33)
          v36 = -1;
        else
          v36 = 1;
        goto LABEL_27;
      }
      v52 = sub_1000B093C();
      IsLevelEnabled = _NRLogIsLevelEnabled(v52, 16);

      if (IsLevelEnabled)
      {
        v54 = sub_1000B093C();
        _NRLogWithArgs(v54, 16, "%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", ", "strict_malloc", 79, v10);

      }
      v37 = (__objc2_prot *)_os_log_pack_size(22);
      v55 = (char *)&v59 - ((__chkstk_darwin(v37) + 15) & 0xFFFFFFFFFFFFFFF0);
      v56 = __error();
      v57 = _os_log_pack_fill(v55, v37, *v56, &_mh_execute_header, "%{public}s strict_malloc(%zu) failed");
      *(_DWORD *)v57 = 136446466;
      *(_QWORD *)(v57 + 4) = "strict_malloc";
      *(_WORD *)(v57 + 12) = 2048;
      *(_QWORD *)(v57 + 14) = v10;
      v58 = sub_1000B093C();
      _NRLogAbortWithPack(v58, v55);
      goto LABEL_52;
    }
  }
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  v37 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
  {
    if (qword_1001E4748 == -1)
    {
LABEL_22:
      _NRLogWithArgs(v37[25].inst_props, 17, "fullLen is 0");
      return;
    }
LABEL_52:
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
    goto LABEL_22;
  }
}

- (id)description
{
  return -[NRBabelLinkFake name](self->_link, "name");
}

- (NRBabelLinkFake)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
}

@end
