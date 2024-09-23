@implementation RSDRemoteLoopbackDevice

- (unint64_t)tlsRequirement
{
  uint64_t v2;
  unint64_t v3;
  const char *v4;
  int is_darwinos;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  v2 = sub_100017F38((void *)qword_100057FB0, CFSTR("rsd_loopback_tls_requirement"), CFSTR("loopback-tls-requirement"));
  if (v2)
  {
    v3 = v2;
    v4 = (const char *)&unk_10004A612;
  }
  else
  {
    is_darwinos = os_variant_is_darwinos("com.apple.RemoteServiceDiscovery");
    if (is_darwinos)
      v4 = " by default for darwinOS";
    else
      v4 = " by default for non-darwinOS";
    if (is_darwinos)
      v3 = 2;
    else
      v3 = 1;
  }
  v6 = (void *)qword_100057FB0;
  if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v9 = 136315394;
    v10 = sub_100017A60(v3);
    v11 = 2080;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TLS is %s for loopback%s", (uint8_t *)&v9, 0x16u);

  }
  return v3;
}

- (unsigned)type
{
  return 1;
}

- (BOOL)connectable
{
  objc_super v3;

  if ((byte_100057FD0 & 1) != 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteLoopbackDevice;
  return -[RSDRemoteDevice connectable](&v3, "connectable");
}

- (unsigned)interface_index
{
  unsigned int result;

  result = _os_crash("Not supported on loopback", a2);
  __break(1u);
  return result;
}

- (const)remote_address
{
  const in6_addr *result;

  result = (const in6_addr *)_os_crash("Not supported on loopback", a2);
  __break(1u);
  return result;
}

- (const)local_address
{
  const in6_addr *result;

  result = (const in6_addr *)_os_crash("Not supported on loopback", a2);
  __break(1u);
  return result;
}

- (int)listenForService:(char *)a3 port:(char *)a4
{
  int v5;
  int v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  socklen_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  unsigned int v18;
  sockaddr v19;

  v5 = socket(2, 1, 0);
  if (v5 == -1)
  {
    v9 = (void *)qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C3E4(v9);
    return -1;
  }
  v6 = v5;
  *(_DWORD *)&v19.sa_len = 512;
  *(_DWORD *)&v19.sa_data[2] = inet_addr("127.0.0.1");
  *(_QWORD *)&v19.sa_data[6] = 0;
  if (bind(v6, &v19, 0x10u) == -1)
  {
    v10 = (void *)qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C460(v10);
    goto LABEL_16;
  }
  if (listen(v6, 128) == -1)
  {
    v11 = (void *)qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C4DC(v11);
    goto LABEL_16;
  }
  v14 = 16;
  if (getsockname(v6, &v19, &v14) == -1)
  {
    v12 = (void *)qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C558(v12);
LABEL_16:
    close(v6);
    return -1;
  }
  v7 = bswap32(*(unsigned __int16 *)v19.sa_data) >> 16;
  v8 = qword_100057FB0;
  if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v16 = qword_100057FB8;
    v17 = 1024;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@> Bound to localhost:%d", buf, 0x12u);
  }
  asprintf(a4, "%d", v7);
  return v6;
}

- (int)connectToService:(char *)a3 withTcpOption:(id *)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  sa_endpoints_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  char *v26;
  _WORD v27[2];
  in_addr_t v28;
  uint64_t v29;

  if (byte_100057FD0 == 1)
  {
    v4 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C5D4(v4, v5, v6, v7, v8, v9, v10, v11);
    return -1;
  }
  v13 = socket(2, 1, 0);
  if (v13 == -1)
  {
    v17 = (void *)qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C3E4(v17);
    return -1;
  }
  v14 = v13;
  if (fcntl(v13, 4, 4) == -1)
  {
    v18 = (void *)qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C644(v18);
    goto LABEL_19;
  }
  v15 = strtol(a3, 0, 0);
  if ((unint64_t)(v15 - 0x10000) <= 0xFFFFFFFFFFFF0000)
  {
    v16 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C6C0((uint64_t)a3, v16);
LABEL_19:
    close(v14);
    return -1;
  }
  v27[0] = 512;
  v27[1] = bswap32(v15) >> 16;
  v28 = inet_addr("127.0.0.1");
  v29 = 0;
  memset(&v22, 0, 24);
  v22.sae_dstaddr = (const sockaddr *)v27;
  *(&v22.sae_dstaddrlen + 1) = 0;
  v22.sae_dstaddrlen = 16;
  if (connectx(v14, &v22, 0, 0, 0, 0, 0, 0) && *__error() != 36)
  {
    v20 = (void *)qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C744(v20);
    goto LABEL_19;
  }
  v19 = qword_100057FB0;
  if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v24 = qword_100057FB8;
    v25 = 2080;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@> connectx(2) succeeded to %s", buf, 0x16u);
  }
  return v14;
}

@end
