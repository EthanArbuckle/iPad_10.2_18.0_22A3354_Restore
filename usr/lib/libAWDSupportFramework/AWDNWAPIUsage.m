@implementation AWDNWAPIUsage

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasTimestamp
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setIfFltrAttach:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_ifFltrAttach = a3;
}

- (void)setHasIfFltrAttach:(BOOL)a3
{
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasIfFltrAttach
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIfFltrAttachOs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_ifFltrAttachOs = a3;
}

- (void)setHasIfFltrAttachOs:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasIfFltrAttachOs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIpFltrAdd:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_ipFltrAdd = a3;
}

- (void)setHasIpFltrAdd:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasIpFltrAdd
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIpFltrAddOs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_ipFltrAddOs = a3;
}

- (void)setHasIpFltrAddOs:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasIpFltrAddOs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSockFltrRegister:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_sockFltrRegister = a3;
}

- (void)setHasSockFltrRegister:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasSockFltrRegister
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSockFltrRegisterOs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_sockFltrRegisterOs = a3;
}

- (void)setHasSockFltrRegisterOs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasSockFltrRegisterOs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSockAlloc:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_sockAlloc = a3;
}

- (void)setHasSockAlloc:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasSockAlloc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSockAllocKernel:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_sockAllocKernel = a3;
}

- (void)setHasSockAllocKernel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasSockAllocKernel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSockAllocKernelOs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_sockAllocKernelOs = a3;
}

- (void)setHasSockAllocKernelOs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasSockAllocKernelOs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSockNecpClientuuidCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_sockNecpClientuuidCount = a3;
}

- (void)setHasSockNecpClientuuidCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSockNecpClientuuidCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setSockDomainLocal:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_sockDomainLocal = a3;
}

- (void)setHasSockDomainLocal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSockDomainLocal
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSockDomainRoute:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_sockDomainRoute = a3;
}

- (void)setHasSockDomainRoute:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSockDomainRoute
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSockDomainInet:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_sockDomainInet = a3;
}

- (void)setHasSockDomainInet:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasSockDomainInet
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSockDomainInet6:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_sockDomainInet6 = a3;
}

- (void)setHasSockDomainInet6:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSockDomainInet6
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSockDomainSystem:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_sockDomainSystem = a3;
}

- (void)setHasSockDomainSystem:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasSockDomainSystem
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSockDomainMultipath:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_sockDomainMultipath = a3;
}

- (void)setHasSockDomainMultipath:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasSockDomainMultipath
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSockDomainKey:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_sockDomainKey = a3;
}

- (void)setHasSockDomainKey:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSockDomainKey
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSockDomainNdrv:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_sockDomainNdrv = a3;
}

- (void)setHasSockDomainNdrv:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSockDomainNdrv
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSockDomainOther:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_sockDomainOther = a3;
}

- (void)setHasSockDomainOther:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSockDomainOther
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSockNetInetStream:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_sockNetInetStream = a3;
}

- (void)setHasSockNetInetStream:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetStream
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setSockNetInetDgram:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_sockNetInetDgram = a3;
}

- (void)setHasSockNetInetDgram:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetDgram
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setSockNetInetDgramConnected:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_sockNetInetDgramConnected = a3;
}

- (void)setHasSockNetInetDgramConnected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetDgramConnected
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setSockNetInetDgramDns:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_sockNetInetDgramDns = a3;
}

- (void)setHasSockNetInetDgramDns:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetDgramDns
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setSockNetInetDgramNoData:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_sockNetInetDgramNoData = a3;
}

- (void)setHasSockNetInetDgramNoData:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetDgramNoData
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setSockNetInet6Stream:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_sockNetInet6Stream = a3;
}

- (void)setHasSockNetInet6Stream:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6Stream
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setSockNetInet6Dgram:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_sockNetInet6Dgram = a3;
}

- (void)setHasSockNetInet6Dgram:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6Dgram
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSockNetInet6DgramConnected:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_sockNetInet6DgramConnected = a3;
}

- (void)setHasSockNetInet6DgramConnected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6DgramConnected
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setSockNetInet6DgramDns:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_sockNetInet6DgramDns = a3;
}

- (void)setHasSockNetInet6DgramDns:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6DgramDns
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setSockNetInet6DgramNoData:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_sockNetInet6DgramNoData = a3;
}

- (void)setHasSockNetInet6DgramNoData:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6DgramNoData
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setSockInetMcastJoin:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_sockInetMcastJoin = a3;
}

- (void)setHasSockInetMcastJoin:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSockInetMcastJoin
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSockInetMcastJoinOs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_sockInetMcastJoinOs = a3;
}

- (void)setHasSockInetMcastJoinOs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSockInetMcastJoinOs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setNexusFlowInetStream:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_nexusFlowInetStream = a3;
}

- (void)setHasNexusFlowInetStream:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasNexusFlowInetStream
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setNexusFlowInetDatagram:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_nexusFlowInetDatagram = a3;
}

- (void)setHasNexusFlowInetDatagram:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasNexusFlowInetDatagram
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setNexusFlowInet6Stream:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_nexusFlowInet6Stream = a3;
}

- (void)setHasNexusFlowInet6Stream:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasNexusFlowInet6Stream
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setNexusFlowInet6Datagram:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_nexusFlowInet6Datagram = a3;
}

- (void)setHasNexusFlowInet6Datagram:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasNexusFlowInet6Datagram
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIfnetAlloc:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_ifnetAlloc = a3;
}

- (void)setHasIfnetAlloc:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasIfnetAlloc
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIfnetAllocOs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_ifnetAllocOs = a3;
}

- (void)setHasIfnetAllocOs:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasIfnetAllocOs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPfAddrule:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_pfAddrule = a3;
}

- (void)setHasPfAddrule:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasPfAddrule
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setPfAddruleOs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_pfAddruleOs = a3;
}

- (void)setHasPfAddruleOs:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasPfAddruleOs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setVmnetStart:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_vmnetStart = a3;
}

- (void)setHasVmnetStart:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasVmnetStart
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setIfNetagentEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_ifNetagentEnabled = a3;
}

- (void)setHasIfNetagentEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasIfNetagentEnabled
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setTimeSinceLastReport:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_timeSinceLastReport = a3;
}

- (void)setHasTimeSinceLastReport:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTimeSinceLastReport
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNWAPIUsage;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNWAPIUsage description](&v3, sel_description), -[AWDNWAPIUsage dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ifFltrAttach), CFSTR("if_fltr_attach"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ifFltrAttachOs), CFSTR("if_fltr_attach_os"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ipFltrAdd), CFSTR("ip_fltr_add"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ipFltrAddOs), CFSTR("ip_fltr_add_os"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_8;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockFltrRegister), CFSTR("sock_fltr_register"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockFltrRegisterOs), CFSTR("sock_fltr_register_os"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockAlloc), CFSTR("sock_alloc"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockAllocKernel), CFSTR("sock_alloc_kernel"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockAllocKernelOs), CFSTR("sock_alloc_kernel_os"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNecpClientuuidCount), CFSTR("sock_necp_clientuuid_count"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainLocal), CFSTR("sock_domain_local"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainRoute), CFSTR("sock_domain_route"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainInet), CFSTR("sock_domain_inet"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainInet6), CFSTR("sock_domain_inet6"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainSystem), CFSTR("sock_domain_system"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainMultipath), CFSTR("sock_domain_multipath"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainKey), CFSTR("sock_domain_key"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainNdrv), CFSTR("sock_domain_ndrv"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_22;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockDomainOther), CFSTR("sock_domain_other"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInetStream), CFSTR("sock_net_inet_stream"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_24;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInetDgram), CFSTR("sock_net_inet_dgram"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_25;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInetDgramConnected), CFSTR("sock_net_inet_dgram_connected"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_26;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInetDgramDns), CFSTR("sock_net_inet_dgram_dns"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_27;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInetDgramNoData), CFSTR("sock_net_inet_dgram_no_data"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_28;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInet6Stream), CFSTR("sock_net_inet6_stream"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInet6Dgram), CFSTR("sock_net_inet6_dgram"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInet6DgramConnected), CFSTR("sock_net_inet6_dgram_connected"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInet6DgramDns), CFSTR("sock_net_inet6_dgram_dns"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockNetInet6DgramNoData), CFSTR("sock_net_inet6_dgram_no_data"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockInetMcastJoin), CFSTR("sock_inet_mcast_join"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sockInetMcastJoinOs), CFSTR("sock_inet_mcast_join_os"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_35;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_nexusFlowInetStream), CFSTR("nexus_flow_inet_stream"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_nexusFlowInetDatagram), CFSTR("nexus_flow_inet_datagram"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_nexusFlowInet6Stream), CFSTR("nexus_flow_inet6_stream"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_38;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_nexusFlowInet6Datagram), CFSTR("nexus_flow_inet6_datagram"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_39;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ifnetAlloc), CFSTR("ifnet_alloc"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ifnetAllocOs), CFSTR("ifnet_alloc_os"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_41;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_pfAddrule), CFSTR("pf_addrule"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_pfAddruleOs), CFSTR("pf_addrule_os"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_43;
LABEL_87:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ifNetagentEnabled), CFSTR("if_netagent_enabled"));
    if ((*(_QWORD *)&self->_has & 0x8000000000) == 0)
      return v3;
    goto LABEL_44;
  }
LABEL_86:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_vmnetStart), CFSTR("vmnet_start"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
    goto LABEL_87;
LABEL_43:
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
LABEL_44:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeSinceLastReport), CFSTR("time_since_last_report"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWAPIUsageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_22;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_27;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_28;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_43;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      return;
LABEL_87:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
    goto LABEL_87;
}

- (void)copyTo:(id)a3
{
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    *((_QWORD *)a3 + 41) = self->_timestamp;
    *(_QWORD *)((char *)a3 + 348) |= 0x10000000000uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = self->_ifFltrAttach;
  *(_QWORD *)((char *)a3 + 348) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)a3 + 2) = self->_ifFltrAttachOs;
  *(_QWORD *)((char *)a3 + 348) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)a3 + 5) = self->_ipFltrAdd;
  *(_QWORD *)((char *)a3 + 348) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)a3 + 6) = self->_ipFltrAddOs;
  *(_QWORD *)((char *)a3 + 348) |= 0x20uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)a3 + 25) = self->_sockFltrRegister;
  *(_QWORD *)((char *)a3 + 348) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)a3 + 26) = self->_sockFltrRegisterOs;
  *(_QWORD *)((char *)a3 + 348) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)a3 + 13) = self->_sockAlloc;
  *(_QWORD *)((char *)a3 + 348) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)a3 + 14) = self->_sockAllocKernel;
  *(_QWORD *)((char *)a3 + 348) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)a3 + 15) = self->_sockAllocKernelOs;
  *(_QWORD *)((char *)a3 + 348) |= 0x4000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)a3 + 29) = self->_sockNecpClientuuidCount;
  *(_QWORD *)((char *)a3 + 348) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 19) = self->_sockDomainLocal;
  *(_QWORD *)((char *)a3 + 348) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 23) = self->_sockDomainRoute;
  *(_QWORD *)((char *)a3 + 348) |= 0x400000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)a3 + 16) = self->_sockDomainInet;
  *(_QWORD *)((char *)a3 + 348) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)a3 + 17) = self->_sockDomainInet6;
  *(_QWORD *)((char *)a3 + 348) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)a3 + 24) = self->_sockDomainSystem;
  *(_QWORD *)((char *)a3 + 348) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)a3 + 20) = self->_sockDomainMultipath;
  *(_QWORD *)((char *)a3 + 348) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)a3 + 18) = self->_sockDomainKey;
  *(_QWORD *)((char *)a3 + 348) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)a3 + 21) = self->_sockDomainNdrv;
  *(_QWORD *)((char *)a3 + 348) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_22;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)a3 + 22) = self->_sockDomainOther;
  *(_QWORD *)((char *)a3 + 348) |= 0x200000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)a3 + 39) = self->_sockNetInetStream;
  *(_QWORD *)((char *)a3 + 348) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)a3 + 35) = self->_sockNetInetDgram;
  *(_QWORD *)((char *)a3 + 348) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)a3 + 36) = self->_sockNetInetDgramConnected;
  *(_QWORD *)((char *)a3 + 348) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)a3 + 37) = self->_sockNetInetDgramDns;
  *(_QWORD *)((char *)a3 + 348) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_27;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)a3 + 38) = self->_sockNetInetDgramNoData;
  *(_QWORD *)((char *)a3 + 348) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_28;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)a3 + 34) = self->_sockNetInet6Stream;
  *(_QWORD *)((char *)a3 + 348) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)a3 + 30) = self->_sockNetInet6Dgram;
  *(_QWORD *)((char *)a3 + 348) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)a3 + 31) = self->_sockNetInet6DgramConnected;
  *(_QWORD *)((char *)a3 + 348) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)a3 + 32) = self->_sockNetInet6DgramDns;
  *(_QWORD *)((char *)a3 + 348) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)a3 + 33) = self->_sockNetInet6DgramNoData;
  *(_QWORD *)((char *)a3 + 348) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)a3 + 27) = self->_sockInetMcastJoin;
  *(_QWORD *)((char *)a3 + 348) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)a3 + 28) = self->_sockInetMcastJoinOs;
  *(_QWORD *)((char *)a3 + 348) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)a3 + 10) = self->_nexusFlowInetStream;
  *(_QWORD *)((char *)a3 + 348) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)a3 + 9) = self->_nexusFlowInetDatagram;
  *(_QWORD *)((char *)a3 + 348) |= 0x100uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)a3 + 8) = self->_nexusFlowInet6Stream;
  *(_QWORD *)((char *)a3 + 348) |= 0x80uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  *((_QWORD *)a3 + 7) = self->_nexusFlowInet6Datagram;
  *(_QWORD *)((char *)a3 + 348) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  *((_QWORD *)a3 + 3) = self->_ifnetAlloc;
  *(_QWORD *)((char *)a3 + 348) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  *((_QWORD *)a3 + 4) = self->_ifnetAllocOs;
  *(_QWORD *)((char *)a3 + 348) |= 8uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)a3 + 11) = self->_pfAddrule;
  *(_QWORD *)((char *)a3 + 348) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)a3 + 12) = self->_pfAddruleOs;
  *(_QWORD *)((char *)a3 + 348) |= 0x800uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_43;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)a3 + 42) = self->_vmnetStart;
  *(_QWORD *)((char *)a3 + 348) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      return;
LABEL_87:
    *((_QWORD *)a3 + 40) = self->_timeSinceLastReport;
    *(_QWORD *)((char *)a3 + 348) |= 0x8000000000uLL;
    return;
  }
LABEL_86:
  *((_BYTE *)a3 + 344) = self->_ifNetagentEnabled;
  *(_QWORD *)((char *)a3 + 348) |= 0x40000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
    goto LABEL_87;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    *((_QWORD *)result + 41) = self->_timestamp;
    *(_QWORD *)((char *)result + 348) |= 0x10000000000uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = self->_ifFltrAttach;
  *(_QWORD *)((char *)result + 348) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)result + 2) = self->_ifFltrAttachOs;
  *(_QWORD *)((char *)result + 348) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)result + 5) = self->_ipFltrAdd;
  *(_QWORD *)((char *)result + 348) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)result + 6) = self->_ipFltrAddOs;
  *(_QWORD *)((char *)result + 348) |= 0x20uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_8;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)result + 25) = self->_sockFltrRegister;
  *(_QWORD *)((char *)result + 348) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)result + 26) = self->_sockFltrRegisterOs;
  *(_QWORD *)((char *)result + 348) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)result + 13) = self->_sockAlloc;
  *(_QWORD *)((char *)result + 348) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)result + 14) = self->_sockAllocKernel;
  *(_QWORD *)((char *)result + 348) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)result + 15) = self->_sockAllocKernelOs;
  *(_QWORD *)((char *)result + 348) |= 0x4000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)result + 29) = self->_sockNecpClientuuidCount;
  *(_QWORD *)((char *)result + 348) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)result + 19) = self->_sockDomainLocal;
  *(_QWORD *)((char *)result + 348) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)result + 23) = self->_sockDomainRoute;
  *(_QWORD *)((char *)result + 348) |= 0x400000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)result + 16) = self->_sockDomainInet;
  *(_QWORD *)((char *)result + 348) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)result + 17) = self->_sockDomainInet6;
  *(_QWORD *)((char *)result + 348) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)result + 24) = self->_sockDomainSystem;
  *(_QWORD *)((char *)result + 348) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)result + 20) = self->_sockDomainMultipath;
  *(_QWORD *)((char *)result + 348) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)result + 18) = self->_sockDomainKey;
  *(_QWORD *)((char *)result + 348) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)result + 21) = self->_sockDomainNdrv;
  *(_QWORD *)((char *)result + 348) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_22;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)result + 22) = self->_sockDomainOther;
  *(_QWORD *)((char *)result + 348) |= 0x200000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)result + 39) = self->_sockNetInetStream;
  *(_QWORD *)((char *)result + 348) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_24;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)result + 35) = self->_sockNetInetDgram;
  *(_QWORD *)((char *)result + 348) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_25;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)result + 36) = self->_sockNetInetDgramConnected;
  *(_QWORD *)((char *)result + 348) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_26;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)result + 37) = self->_sockNetInetDgramDns;
  *(_QWORD *)((char *)result + 348) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_27;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)result + 38) = self->_sockNetInetDgramNoData;
  *(_QWORD *)((char *)result + 348) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_28;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)result + 34) = self->_sockNetInet6Stream;
  *(_QWORD *)((char *)result + 348) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)result + 30) = self->_sockNetInet6Dgram;
  *(_QWORD *)((char *)result + 348) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)result + 31) = self->_sockNetInet6DgramConnected;
  *(_QWORD *)((char *)result + 348) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)result + 32) = self->_sockNetInet6DgramDns;
  *(_QWORD *)((char *)result + 348) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)result + 33) = self->_sockNetInet6DgramNoData;
  *(_QWORD *)((char *)result + 348) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)result + 27) = self->_sockInetMcastJoin;
  *(_QWORD *)((char *)result + 348) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)result + 28) = self->_sockInetMcastJoinOs;
  *(_QWORD *)((char *)result + 348) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_35;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)result + 10) = self->_nexusFlowInetStream;
  *(_QWORD *)((char *)result + 348) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)result + 9) = self->_nexusFlowInetDatagram;
  *(_QWORD *)((char *)result + 348) |= 0x100uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_81;
  }
LABEL_80:
  *((_QWORD *)result + 8) = self->_nexusFlowInet6Stream;
  *(_QWORD *)((char *)result + 348) |= 0x80uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_38;
    goto LABEL_82;
  }
LABEL_81:
  *((_QWORD *)result + 7) = self->_nexusFlowInet6Datagram;
  *(_QWORD *)((char *)result + 348) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_39;
    goto LABEL_83;
  }
LABEL_82:
  *((_QWORD *)result + 3) = self->_ifnetAlloc;
  *(_QWORD *)((char *)result + 348) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)result + 4) = self->_ifnetAllocOs;
  *(_QWORD *)((char *)result + 348) |= 8uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_41;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)result + 11) = self->_pfAddrule;
  *(_QWORD *)((char *)result + 348) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)result + 12) = self->_pfAddruleOs;
  *(_QWORD *)((char *)result + 348) |= 0x800uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_43;
    goto LABEL_87;
  }
LABEL_86:
  *((_QWORD *)result + 42) = self->_vmnetStart;
  *(_QWORD *)((char *)result + 348) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      return result;
    goto LABEL_44;
  }
LABEL_87:
  *((_BYTE *)result + 344) = self->_ifNetagentEnabled;
  *(_QWORD *)((char *)result + 348) |= 0x40000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000000000) == 0)
    return result;
LABEL_44:
  *((_QWORD *)result + 40) = self->_timeSinceLastReport;
  *(_QWORD *)((char *)result + 348) |= 0x8000000000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has;
  uint64_t v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *(_QWORD *)((char *)a3 + 348);
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0 || self->_timestamp != *((_QWORD *)a3 + 41))
      goto LABEL_219;
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_ifFltrAttach != *((_QWORD *)a3 + 1))
      goto LABEL_219;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_ifFltrAttachOs != *((_QWORD *)a3 + 2))
      goto LABEL_219;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_ipFltrAdd != *((_QWORD *)a3 + 5))
      goto LABEL_219;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_ipFltrAddOs != *((_QWORD *)a3 + 6))
      goto LABEL_219;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_sockFltrRegister != *((_QWORD *)a3 + 25))
      goto LABEL_219;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_sockFltrRegisterOs != *((_QWORD *)a3 + 26))
      goto LABEL_219;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_sockAlloc != *((_QWORD *)a3 + 13))
      goto LABEL_219;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_sockAllocKernel != *((_QWORD *)a3 + 14))
      goto LABEL_219;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_sockAllocKernelOs != *((_QWORD *)a3 + 15))
      goto LABEL_219;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_sockNecpClientuuidCount != *((_QWORD *)a3 + 29))
      goto LABEL_219;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_sockDomainLocal != *((_QWORD *)a3 + 19))
      goto LABEL_219;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_sockDomainRoute != *((_QWORD *)a3 + 23))
      goto LABEL_219;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_sockDomainInet != *((_QWORD *)a3 + 16))
      goto LABEL_219;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_sockDomainInet6 != *((_QWORD *)a3 + 17))
      goto LABEL_219;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_sockDomainSystem != *((_QWORD *)a3 + 24))
      goto LABEL_219;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_sockDomainMultipath != *((_QWORD *)a3 + 20))
      goto LABEL_219;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_sockDomainKey != *((_QWORD *)a3 + 18))
      goto LABEL_219;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_sockDomainNdrv != *((_QWORD *)a3 + 21))
      goto LABEL_219;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_sockDomainOther != *((_QWORD *)a3 + 22))
      goto LABEL_219;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0 || self->_sockNetInetStream != *((_QWORD *)a3 + 39))
      goto LABEL_219;
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_sockNetInetDgram != *((_QWORD *)a3 + 35))
      goto LABEL_219;
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_sockNetInetDgramConnected != *((_QWORD *)a3 + 36))
      goto LABEL_219;
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_sockNetInetDgramDns != *((_QWORD *)a3 + 37))
      goto LABEL_219;
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0 || self->_sockNetInetDgramNoData != *((_QWORD *)a3 + 38))
      goto LABEL_219;
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_sockNetInet6Stream != *((_QWORD *)a3 + 34))
      goto LABEL_219;
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_sockNetInet6Dgram != *((_QWORD *)a3 + 30))
      goto LABEL_219;
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_sockNetInet6DgramConnected != *((_QWORD *)a3 + 31))
      goto LABEL_219;
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_sockNetInet6DgramDns != *((_QWORD *)a3 + 32))
      goto LABEL_219;
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_sockNetInet6DgramNoData != *((_QWORD *)a3 + 33))
      goto LABEL_219;
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_sockInetMcastJoin != *((_QWORD *)a3 + 27))
      goto LABEL_219;
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_sockInetMcastJoinOs != *((_QWORD *)a3 + 28))
      goto LABEL_219;
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_nexusFlowInetStream != *((_QWORD *)a3 + 10))
      goto LABEL_219;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_nexusFlowInetDatagram != *((_QWORD *)a3 + 9))
      goto LABEL_219;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_nexusFlowInet6Stream != *((_QWORD *)a3 + 8))
      goto LABEL_219;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_nexusFlowInet6Datagram != *((_QWORD *)a3 + 7))
      goto LABEL_219;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_ifnetAlloc != *((_QWORD *)a3 + 3))
      goto LABEL_219;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_ifnetAllocOs != *((_QWORD *)a3 + 4))
      goto LABEL_219;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_pfAddrule != *((_QWORD *)a3 + 11))
      goto LABEL_219;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_pfAddruleOs != *((_QWORD *)a3 + 12))
      goto LABEL_219;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0 || self->_vmnetStart != *((_QWORD *)a3 + 42))
      goto LABEL_219;
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
    if ((v7 & 0x40000000000) != 0)
      goto LABEL_219;
    goto LABEL_215;
  }
  if ((v7 & 0x40000000000) == 0)
    goto LABEL_219;
  if (self->_ifNetagentEnabled)
  {
    if (!*((_BYTE *)a3 + 344))
      goto LABEL_219;
    goto LABEL_215;
  }
  if (*((_BYTE *)a3 + 344))
  {
LABEL_219:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_215:
  LOBYTE(v5) = (v7 & 0x8000000000) == 0;
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_timeSinceLastReport != *((_QWORD *)a3 + 40))
      goto LABEL_219;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    v46 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 1) != 0)
    {
LABEL_3:
      v45 = 2654435761 * self->_ifFltrAttach;
      if ((*(_BYTE *)&has & 2) != 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else
  {
    v46 = 0;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_3;
  }
  v45 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_4:
    v44 = 2654435761 * self->_ifFltrAttachOs;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  v44 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_5:
    v43 = 2654435761 * self->_ipFltrAdd;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  v43 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_6:
    v42 = 2654435761 * self->_ipFltrAddOs;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  v42 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_7:
    v41 = 2654435761 * self->_sockFltrRegister;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  v41 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_8:
    v40 = 2654435761 * self->_sockFltrRegisterOs;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  v40 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_9:
    v39 = 2654435761 * self->_sockAlloc;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_10;
    goto LABEL_53;
  }
LABEL_52:
  v39 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_10:
    v38 = 2654435761 * self->_sockAllocKernel;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_11;
    goto LABEL_54;
  }
LABEL_53:
  v38 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_11:
    v37 = 2654435761 * self->_sockAllocKernelOs;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_12;
    goto LABEL_55;
  }
LABEL_54:
  v37 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_12:
    v36 = 2654435761 * self->_sockNecpClientuuidCount;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_55:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_13:
    v35 = 2654435761 * self->_sockDomainLocal;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_56:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_14:
    v34 = 2654435761 * self->_sockDomainRoute;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  v34 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_15:
    v33 = 2654435761 * self->_sockDomainInet;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_16:
    v32 = 2654435761 * self->_sockDomainInet6;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_17;
    goto LABEL_60;
  }
LABEL_59:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_17:
    v31 = 2654435761 * self->_sockDomainSystem;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_60:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_18:
    v30 = 2654435761 * self->_sockDomainMultipath;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_62;
  }
LABEL_61:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    v3 = 2654435761 * self->_sockDomainKey;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_20;
    goto LABEL_63;
  }
LABEL_62:
  v3 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_20:
    v4 = 2654435761 * self->_sockDomainNdrv;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_21;
    goto LABEL_64;
  }
LABEL_63:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_21:
    v5 = 2654435761 * self->_sockDomainOther;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_22;
    goto LABEL_65;
  }
LABEL_64:
  v5 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_22:
    v6 = 2654435761 * self->_sockNetInetStream;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_23;
    goto LABEL_66;
  }
LABEL_65:
  v6 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_23:
    v7 = 2654435761 * self->_sockNetInetDgram;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  v7 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_24:
    v8 = 2654435761 * self->_sockNetInetDgramConnected;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  v8 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_25:
    v9 = 2654435761 * self->_sockNetInetDgramDns;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  v9 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_26:
    v10 = 2654435761 * self->_sockNetInetDgramNoData;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_27;
    goto LABEL_70;
  }
LABEL_69:
  v10 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_27:
    v11 = 2654435761 * self->_sockNetInet6Stream;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_28;
    goto LABEL_71;
  }
LABEL_70:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_28:
    v12 = 2654435761 * self->_sockNetInet6Dgram;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_29:
    v13 = 2654435761 * self->_sockNetInet6DgramConnected;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_30:
    v14 = 2654435761 * self->_sockNetInet6DgramDns;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  v14 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_31:
    v15 = 2654435761 * self->_sockNetInet6DgramNoData;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_32:
    v16 = 2654435761 * self->_sockInetMcastJoin;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_33:
    v17 = 2654435761 * self->_sockInetMcastJoinOs;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  v17 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_34:
    v18 = 2654435761 * self->_nexusFlowInetStream;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  v18 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_35:
    v19 = 2654435761 * self->_nexusFlowInetDatagram;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  v19 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_36:
    v20 = 2654435761 * self->_nexusFlowInet6Stream;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_37:
    v21 = 2654435761 * self->_nexusFlowInet6Datagram;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  v21 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_38:
    v22 = 2654435761 * self->_ifnetAlloc;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  v22 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_39:
    v23 = 2654435761 * self->_ifnetAllocOs;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  v23 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_40:
    v24 = 2654435761 * self->_pfAddrule;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  v24 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_41:
    v25 = 2654435761 * self->_pfAddruleOs;
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  v25 = 0;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
LABEL_42:
    v26 = 2654435761 * self->_vmnetStart;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
      goto LABEL_43;
LABEL_86:
    v27 = 0;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_44;
LABEL_87:
    v28 = 0;
    return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_85:
  v26 = 0;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
    goto LABEL_86;
LABEL_43:
  v27 = 2654435761 * self->_ifNetagentEnabled;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
    goto LABEL_87;
LABEL_44:
  v28 = 2654435761u * self->_timeSinceLastReport;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x10000000000) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 41);
    *(_QWORD *)&self->_has |= 0x10000000000uLL;
    v3 = *(_QWORD *)((char *)a3 + 348);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_ifFltrAttach = *((_QWORD *)a3 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  self->_ifFltrAttachOs = *((_QWORD *)a3 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  self->_ipFltrAdd = *((_QWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  self->_ipFltrAddOs = *((_QWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  self->_sockFltrRegister = *((_QWORD *)a3 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  self->_sockFltrRegisterOs = *((_QWORD *)a3 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x1000) == 0)
  {
LABEL_9:
    if ((v3 & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_53;
  }
LABEL_52:
  self->_sockAlloc = *((_QWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x2000) == 0)
  {
LABEL_10:
    if ((v3 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_54;
  }
LABEL_53:
  self->_sockAllocKernel = *((_QWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x4000) == 0)
  {
LABEL_11:
    if ((v3 & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_55;
  }
LABEL_54:
  self->_sockAllocKernelOs = *((_QWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_12:
    if ((v3 & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_55:
  self->_sockNecpClientuuidCount = *((_QWORD *)a3 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x40000) == 0)
  {
LABEL_13:
    if ((v3 & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_56:
  self->_sockDomainLocal = *((_QWORD *)a3 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x400000) == 0)
  {
LABEL_14:
    if ((v3 & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  self->_sockDomainRoute = *((_QWORD *)a3 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x8000) == 0)
  {
LABEL_15:
    if ((v3 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  self->_sockDomainInet = *((_QWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x10000) == 0)
  {
LABEL_16:
    if ((v3 & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_60;
  }
LABEL_59:
  self->_sockDomainInet6 = *((_QWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x800000) == 0)
  {
LABEL_17:
    if ((v3 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_60:
  self->_sockDomainSystem = *((_QWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x80000) == 0)
  {
LABEL_18:
    if ((v3 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_62;
  }
LABEL_61:
  self->_sockDomainMultipath = *((_QWORD *)a3 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x20000) == 0)
  {
LABEL_19:
    if ((v3 & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_63;
  }
LABEL_62:
  self->_sockDomainKey = *((_QWORD *)a3 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x100000) == 0)
  {
LABEL_20:
    if ((v3 & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_64;
  }
LABEL_63:
  self->_sockDomainNdrv = *((_QWORD *)a3 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x200000) == 0)
  {
LABEL_21:
    if ((v3 & 0x4000000000) == 0)
      goto LABEL_22;
    goto LABEL_65;
  }
LABEL_64:
  self->_sockDomainOther = *((_QWORD *)a3 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_22:
    if ((v3 & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_66;
  }
LABEL_65:
  self->_sockNetInetStream = *((_QWORD *)a3 + 39);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v3 & 0x800000000) == 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  self->_sockNetInetDgram = *((_QWORD *)a3 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_24:
    if ((v3 & 0x1000000000) == 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  self->_sockNetInetDgramConnected = *((_QWORD *)a3 + 36);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x2000000000) == 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  self->_sockNetInetDgramDns = *((_QWORD *)a3 + 37);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x200000000) == 0)
      goto LABEL_27;
    goto LABEL_70;
  }
LABEL_69:
  self->_sockNetInetDgramNoData = *((_QWORD *)a3 + 38);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_28;
    goto LABEL_71;
  }
LABEL_70:
  self->_sockNetInet6Stream = *((_QWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  self->_sockNetInet6Dgram = *((_QWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  self->_sockNetInet6DgramConnected = *((_QWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  self->_sockNetInet6DgramDns = *((_QWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_31:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  self->_sockNetInet6DgramNoData = *((_QWORD *)a3 + 33);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  self->_sockInetMcastJoin = *((_QWORD *)a3 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_33:
    if ((v3 & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  self->_sockInetMcastJoinOs = *((_QWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x200) == 0)
  {
LABEL_34:
    if ((v3 & 0x100) == 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  self->_nexusFlowInetStream = *((_QWORD *)a3 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x100) == 0)
  {
LABEL_35:
    if ((v3 & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  self->_nexusFlowInetDatagram = *((_QWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x80) == 0)
  {
LABEL_36:
    if ((v3 & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  self->_nexusFlowInet6Stream = *((_QWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x40) == 0)
  {
LABEL_37:
    if ((v3 & 4) == 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  self->_nexusFlowInet6Datagram = *((_QWORD *)a3 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 4) == 0)
  {
LABEL_38:
    if ((v3 & 8) == 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  self->_ifnetAlloc = *((_QWORD *)a3 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 8) == 0)
  {
LABEL_39:
    if ((v3 & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  self->_ifnetAllocOs = *((_QWORD *)a3 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x400) == 0)
  {
LABEL_40:
    if ((v3 & 0x800) == 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  self->_pfAddrule = *((_QWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x800) == 0)
  {
LABEL_41:
    if ((v3 & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  self->_pfAddruleOs = *((_QWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x20000000000) == 0)
  {
LABEL_42:
    if ((v3 & 0x40000000000) == 0)
      goto LABEL_43;
    goto LABEL_86;
  }
LABEL_85:
  self->_vmnetStart = *((_QWORD *)a3 + 42);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 348);
  if ((v3 & 0x40000000000) == 0)
  {
LABEL_43:
    if ((v3 & 0x8000000000) == 0)
      return;
LABEL_87:
    self->_timeSinceLastReport = *((_QWORD *)a3 + 40);
    *(_QWORD *)&self->_has |= 0x8000000000uLL;
    return;
  }
LABEL_86:
  self->_ifNetagentEnabled = *((_BYTE *)a3 + 344);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  if ((*(_QWORD *)((_BYTE *)a3 + 348) & 0x8000000000) != 0)
    goto LABEL_87;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)ifFltrAttach
{
  return self->_ifFltrAttach;
}

- (int64_t)ifFltrAttachOs
{
  return self->_ifFltrAttachOs;
}

- (int64_t)ipFltrAdd
{
  return self->_ipFltrAdd;
}

- (int64_t)ipFltrAddOs
{
  return self->_ipFltrAddOs;
}

- (int64_t)sockFltrRegister
{
  return self->_sockFltrRegister;
}

- (int64_t)sockFltrRegisterOs
{
  return self->_sockFltrRegisterOs;
}

- (int64_t)sockAlloc
{
  return self->_sockAlloc;
}

- (int64_t)sockAllocKernel
{
  return self->_sockAllocKernel;
}

- (int64_t)sockAllocKernelOs
{
  return self->_sockAllocKernelOs;
}

- (int64_t)sockNecpClientuuidCount
{
  return self->_sockNecpClientuuidCount;
}

- (int64_t)sockDomainLocal
{
  return self->_sockDomainLocal;
}

- (int64_t)sockDomainRoute
{
  return self->_sockDomainRoute;
}

- (int64_t)sockDomainInet
{
  return self->_sockDomainInet;
}

- (int64_t)sockDomainInet6
{
  return self->_sockDomainInet6;
}

- (int64_t)sockDomainSystem
{
  return self->_sockDomainSystem;
}

- (int64_t)sockDomainMultipath
{
  return self->_sockDomainMultipath;
}

- (int64_t)sockDomainKey
{
  return self->_sockDomainKey;
}

- (int64_t)sockDomainNdrv
{
  return self->_sockDomainNdrv;
}

- (int64_t)sockDomainOther
{
  return self->_sockDomainOther;
}

- (int64_t)sockNetInetStream
{
  return self->_sockNetInetStream;
}

- (int64_t)sockNetInetDgram
{
  return self->_sockNetInetDgram;
}

- (int64_t)sockNetInetDgramConnected
{
  return self->_sockNetInetDgramConnected;
}

- (int64_t)sockNetInetDgramDns
{
  return self->_sockNetInetDgramDns;
}

- (int64_t)sockNetInetDgramNoData
{
  return self->_sockNetInetDgramNoData;
}

- (int64_t)sockNetInet6Stream
{
  return self->_sockNetInet6Stream;
}

- (int64_t)sockNetInet6Dgram
{
  return self->_sockNetInet6Dgram;
}

- (int64_t)sockNetInet6DgramConnected
{
  return self->_sockNetInet6DgramConnected;
}

- (int64_t)sockNetInet6DgramDns
{
  return self->_sockNetInet6DgramDns;
}

- (int64_t)sockNetInet6DgramNoData
{
  return self->_sockNetInet6DgramNoData;
}

- (int64_t)sockInetMcastJoin
{
  return self->_sockInetMcastJoin;
}

- (int64_t)sockInetMcastJoinOs
{
  return self->_sockInetMcastJoinOs;
}

- (int64_t)nexusFlowInetStream
{
  return self->_nexusFlowInetStream;
}

- (int64_t)nexusFlowInetDatagram
{
  return self->_nexusFlowInetDatagram;
}

- (int64_t)nexusFlowInet6Stream
{
  return self->_nexusFlowInet6Stream;
}

- (int64_t)nexusFlowInet6Datagram
{
  return self->_nexusFlowInet6Datagram;
}

- (int64_t)ifnetAlloc
{
  return self->_ifnetAlloc;
}

- (int64_t)ifnetAllocOs
{
  return self->_ifnetAllocOs;
}

- (int64_t)pfAddrule
{
  return self->_pfAddrule;
}

- (int64_t)pfAddruleOs
{
  return self->_pfAddruleOs;
}

- (int64_t)vmnetStart
{
  return self->_vmnetStart;
}

- (BOOL)ifNetagentEnabled
{
  return self->_ifNetagentEnabled;
}

- (unint64_t)timeSinceLastReport
{
  return self->_timeSinceLastReport;
}

@end
