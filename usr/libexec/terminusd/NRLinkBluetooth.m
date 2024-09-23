@implementation NRLinkBluetooth

- (id)copyStatusString
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  NEVirtualInterface_s *virtualInterface;
  void *v8;
  uint64_t v9;
  void *IPv6AddrString;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v5 = objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "nrUUID", self->super._nrUUID);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "bluetoothUUID", *(_QWORD *)((char *)&self->_handledUrgentLinkReadBufferBytes + 3));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "pipe", *(NSUUID **)((char *)&self->_bluetoothUUID + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "urgentPipe", *(unint64_t *)((char *)&self->_lastReadDatagramLinkOutputActivityCounter + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "datagramPipe", *(unint64_t *)((char *)&self->_lastReadLinkOutputActivityCounter + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "linkChannel", *(unint64_t *)((char *)&self->_writeCounter + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "linkInputRing", *(channel **)((char *)&self->_linkChannel + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "linkOutputRing", *(channel_ring_desc **)((char *)&self->_linkInputRing + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "dLinkInputSource", *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "dLinkOutputSource", *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "datagramLinkChannel", *(CBScalablePipe **)((char *)&self->_datagramPipe + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "datagramLinkInputRing", *(channel **)((char *)&self->_datagramLinkChannel + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "datagramLinkOutputRing", *(channel_ring_desc **)((char *)&self->_datagramLinkInputRing + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "dDatagramLinkInputSource", *(channel_ring_desc **)((char *)&self->_datagramLinkOutputRing + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %p"), "dDatagramLinkOutputSource", *(OS_dispatch_source **)((char *)&self->_dDatagramLinkInputSource + 7));
  if (self->_datagramPipeNeeded)
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "datagramPipeNeeded", v6);
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v8 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "virtualInterfaceName", v8);

  }
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassD", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassC", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassA", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7));
  IPv6AddrString = (void *)createIPv6AddrString((char *)&self->_ntlULogTokenList + 7, v9);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "localAddrClassD", IPv6AddrString);

  v12 = (void *)createIPv6AddrString((char *)&self->_localAddrClassD.__u6_addr32[3] + 3, v11);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "remoteAddrClassD", v12);

  v14 = (void *)createIPv6AddrString((char *)&self->_remoteAddrClassD.__u6_addr32[3] + 3, v13);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "localAddrClassC", v14);

  v16 = (void *)createIPv6AddrString((char *)&self->_localAddrClassC.__u6_addr32[3] + 3, v15);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "remoteAddrClassC", v16);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "packetsFromNexus", *(unint64_t *)((char *)&self->_syncNexusOutput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "packetsToNexus", *(unint64_t *)((char *)&self->_packetsFromNexus + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesFromNexus", *(unint64_t *)((char *)&self->_packetsToNexus + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToNexus", *(unint64_t *)((char *)&self->_bytesFromNexus + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesFromNexusVO", *(unint64_t *)((char *)&self->_packetsToNexusVO + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToNexusVO", *(unint64_t *)((char *)&self->_bytesFromNexusVO + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesFromNexusVI", *(unint64_t *)((char *)&self->_packetsToNexusVI + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToNexusVI", *(unint64_t *)((char *)&self->_bytesFromNexusVI + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesFromNexusBK", *(unint64_t *)((char *)&self->_packetsToNexusBK + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToNexusBK", *(unint64_t *)((char *)&self->_bytesFromNexusBK + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesFromLink", *(NSString **)((char *)&self->_jointUUIDHash + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToLink", *(unint64_t *)((char *)&self->_bytesFromLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "datagramBytesFromLink", *(unint64_t *)((char *)&self->_bytesToLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "datagramBytesToLink", *(unint64_t *)((char *)&self->_datagramBytesFromLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "urgentBytesFromLink", *(unint64_t *)((char *)&self->_datagramBytesToLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "urgentBytesToLink", *(unint64_t *)((char *)&self->_urgentBytesFromLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncNexusInput", *(unint64_t *)((char *)&self->_nexusOutputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncNexusOutput", *(unint64_t *)((char *)&self->_syncNexusInput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncNexusVOInput", *(unint64_t *)((char *)&self->_nexusVOOutputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncNexusVOOutput", *(unint64_t *)((char *)&self->_syncNexusVOInput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncNexusVIInput", *(unint64_t *)((char *)&self->_nexusVIOutputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncNexusVIOutput", *(unint64_t *)((char *)&self->_syncNexusVIInput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncNexusBKInput", *(unint64_t *)((char *)&self->_nexusBKOutputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncNexusBKOutput", *(unint64_t *)((char *)&self->_syncNexusBKInput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncLinkInput", *(unint64_t *)((char *)&self->_urgentBytesToLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncLinkOutput", *(unint64_t *)((char *)&self->_syncLinkInput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncDatagramLinkInput", *(unint64_t *)((char *)&self->_syncLinkOutput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncDatagramLinkOutput", *(unint64_t *)((char *)&self->_syncDatagramLinkInput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncUrgentLinkInput", *(unint64_t *)((char *)&self->_syncDatagramLinkOutput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "syncUrgentLinkOutput", *(unint64_t *)((char *)&self->_syncUrgentLinkInput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %u"), "filledInLinkWriteBufferBytes", *(unsigned int *)((char *)&self->_urgentLinkWriteBufferLength + 3));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %u"), "handledLinkWriteBufferBytes", *(unsigned int *)((char *)&self->_filledInLinkWriteBufferBytes + 3));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %u"), "filledInUrgentLinkWriteBufferBytes", *(unsigned int *)((char *)&self->_controlPacketCounter + 3));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %u"), "handledUrgentLinkWriteBufferBytes", *(unsigned int *)((char *)&self->_filledInUrgentLinkWriteBufferBytes + 3));
  if (self->_hasUrgentPrelude)
    v17 = "YES";
  else
    v17 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "hasUrgentPrelude", v17);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "linkInputAvailWake", *(unint64_t *)((char *)&self->_syncUrgentLinkOutput + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "linkOutputAvailWake", *(unint64_t *)((char *)&self->_linkInputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "datagramLinkInputAvailWake", *(unint64_t *)((char *)&self->_linkOutputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "datagramLinkOutputAvailWake", *(unint64_t *)((char *)&self->_datagramLinkInputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusInputAvailWake", *(char **)((char *)&self->_linkWriteBuffer + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusOutputAvailWake", *(unint64_t *)((char *)&self->_nexusInputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusVOInputAvailWake", *(unint64_t *)((char *)&self->_lastReadNexusVOOutputActivityCounter + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusVOOutputAvailWake", *(unint64_t *)((char *)&self->_nexusVOInputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusVIInputAvailWake", *(unint64_t *)((char *)&self->_lastReadNexusVIOutputActivityCounter + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusVIOutputAvailWake", *(unint64_t *)((char *)&self->_nexusVIInputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusBKInputAvailWake", *(unint64_t *)((char *)&self->_lastReadNexusBKOutputActivityCounter + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusBKOutputAvailWake", *(unint64_t *)((char *)&self->_nexusBKInputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "pendingBytesToLink", objc_msgSend(*(id *)((char *)&self->_urgentLinkReadBuffer + 7), "length"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %lld (%u - %u)"), "pendingBytesFromLink", *(unsigned int *)((char *)&self->_controlDataSendQueueLen + 3)- (unint64_t)*(unsigned int *)((char *)&self->_filledInLinkReadBufferBytes + 3), *(unsigned int *)((char *)&self->_controlDataSendQueueLen + 3), *(unsigned int *)((char *)&self->_filledInLinkReadBufferBytes + 3));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentUncompressedIP", *(unint64_t *)((char *)&self->_urgentLinkOutputAvailWake + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentEncapsulated6LoWPAN", *(unint64_t *)((char *)&self->_sentUncompressedIP + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_ESP", *(unint64_t *)((char *)&self->_sentEncapsulated6LoWPAN + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_ESP_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_ESP_ClassC", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ECT0 + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_ESP_ClassC_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_TCP", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC_ECT0 + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_TCP_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "sentIKEv2PointToPoint", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP_ECT0 + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvUncompressedIP", *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvEncapsulated6LoWPAN", *(unint64_t *)((char *)&self->_recvUncompressedIP + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_ESP", *(unint64_t *)((char *)&self->_recvEncapsulated6LoWPAN + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_ESP_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_ESP_ClassC", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ECT0 + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_ESP_ClassC_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_TCP", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC_ECT0 + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_TCP_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "recvIKEv2PointToPoint", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7));
  v18 = (void *)_NRCopyTimeStringForDate(*(unint64_t *)((char *)&self->_recvIKEv2PointToPoint + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "lastReadNexus", v18);

  v19 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastReadNexus + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "lastWrittenNexus", v19);

  v20 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastWrittenNexus + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "lastReadLink", v20);

  v21 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastReadLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "lastWrittenLink", v21);

  v22 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastWrittenDatagramLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "lastReadUrgentLink", v22);

  v23 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastReadUrgentLink + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "lastWrittenUrgentLink", v23);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %u"), "nexusRecvWindow", objc_msgSend(*(id *)((char *)&self->_dummyPacketNexus + 7), "receiveWindowPacketCount"));
  if (self->_dLinkInputSourceSuspended)
    v24 = "YES";
  else
    v24 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dLinkInputSourceSuspended", v24);
  if (self->_dLinkOutputSourceSuspended)
    v25 = "YES";
  else
    v25 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dLinkOutputSourceSuspended", v25);
  if (self->_dUrgentLinkInputSourceSuspended)
    v26 = "YES";
  else
    v26 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dUrgentLinkInputSourceSuspended", v26);
  if (self->_dUrgentLinkOutputSourceSuspended)
    v27 = "YES";
  else
    v27 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dUrgentLinkOutputSourceSuspended", v27);
  if (self->_dDatagramLinkInputSourceSuspended)
    v28 = "YES";
  else
    v28 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dDatagramLinkInputSourceSuspended", v28);
  if (self->_dDatagramLinkOutputSourceSuspended)
    v29 = "YES";
  else
    v29 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dDatagramLinkOutputSourceSuspended", v29);
  if (self->_dNexusInputSourceSuspended)
    v30 = "YES";
  else
    v30 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusInputSourceSuspended", v30);
  if (self->_dNexusOutputSourceSuspended)
    v31 = "YES";
  else
    v31 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusOutputSourceSuspended", v31);
  if (self->_dNexusVOInputSourceSuspended)
    v32 = "YES";
  else
    v32 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusVOInputSourceSuspended", v32);
  if (self->_dNexusVOOutputSourceSuspended)
    v33 = "YES";
  else
    v33 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusVOOutputSourceSuspended", v33);
  if (self->_dNexusVIInputSourceSuspended)
    v34 = "YES";
  else
    v34 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusVIInputSourceSuspended", v34);
  if (self->_dNexusVIOutputSourceSuspended)
    v35 = "YES";
  else
    v35 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusVIOutputSourceSuspended", v35);
  if (self->_dNexusBKInputSourceSuspended)
    v36 = "YES";
  else
    v36 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusBKInputSourceSuspended", v36);
  if (self->_dNexusBKOutputSourceSuspended)
    v37 = "YES";
  else
    v37 = "NO";
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusBKOutputSourceSuspended", v37);
  return v5;
}

- (id)copyDescriptionInner
{
  id v3;
  id v4;
  id v5;
  void *StringFromNRLinkType;
  uint64_t v7;
  const char *v8;
  objc_super v10;

  v3 = objc_alloc((Class)NSMutableString);
  v10.receiver = self;
  v10.super_class = (Class)NRLinkBluetooth;
  v4 = -[NRLink copyDescriptionInner](&v10, "copyDescriptionInner");
  v5 = objc_msgSend(v3, "initWithString:", v4);

  StringFromNRLinkType = (void *)createStringFromNRLinkType(-[NRLink type](self, "type"));
  objc_msgSend(v5, "appendFormat:", CFSTR(", %@"), StringFromNRLinkType);

  if (self)
    v7 = *(uint64_t *)((char *)&self->_pipe + 7);
  else
    v7 = 0;
  objc_msgSend(v5, "appendFormat:", CFSTR(", %@"), v7);
  if (objc_msgSend(*(id *)((char *)&self->_randomUUID + 7), "length"))
  {
    if (self->_isResponder)
      v8 = " R";
    else
      v8 = " I";
  }
  else
  {
    v8 = "";
  }
  objc_msgSend(v5, "appendFormat:", CFSTR(", %s"), v8);
  objc_msgSend(v5, "appendFormat:", CFSTR(", %@"), *(NSUUID **)((char *)&self->_randomUUID + 7));
  return v5;
}

- (id)copyShortDescriptionInner
{
  id v3;
  id v4;
  uint64_t v5;
  const char *v6;
  id v7;
  objc_super v9;

  v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)NRLinkBluetooth;
  v4 = -[NRLink copyShortDescriptionInner](&v9, "copyShortDescriptionInner");
  v5 = *(uint64_t *)((char *)&self->_pipe + 7);
  if (objc_msgSend(*(id *)((char *)&self->_randomUUID + 7), "length"))
  {
    if (self->_isResponder)
      v6 = " R";
    else
      v6 = " I";
  }
  else
  {
    v6 = "";
  }
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@%s%@"), v4, v5, v6, *(NSUUID **)((char *)&self->_randomUUID + 7));

  return v7;
}

- (BOOL)start
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NRLinkBluetooth *v6;
  void *v7;
  void *v9;
  int *sentPreludeState;
  unsigned int v11;
  uint64_t v12;
  NWRemotePacketProxy *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSData *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NRLinkBluetooth *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSString *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  id v58;
  NSObject *queue;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t fd;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t attr;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  int v84;
  uint64_t v85;
  void *v86;
  int v87;
  uint64_t v88;
  void *v89;
  int v90;
  uint64_t v91;
  void *v92;
  int v93;
  uint64_t v94;
  void *v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  int v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  int v112;
  uint64_t v113;
  int v114;
  uint64_t v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  id v123;
  int v124;
  id v125;
  int *v126;
  uint64_t v127;
  id v128;
  int v129;
  id v130;
  char *v131;
  int *v132;
  uint64_t v133;
  id v134;
  int v135;
  uint64_t v136;
  void *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  uint64_t v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  void *v149;
  int IsLevelEnabled;
  uint64_t v151;
  void *v152;
  id v153;
  int v154;
  uint64_t v155;
  id v156;
  id v157;
  int v158;
  id v159;
  id v160;
  int v161;
  id v162;
  int *v163;
  uint64_t v164;
  id v165;
  int v166;
  id v167;
  int *v168;
  uint64_t v169;
  id v170;
  int v171;
  uint64_t v172;
  void *v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  int v179;
  uint64_t v180;
  int v181;
  uint64_t v182;
  void *v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  int v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  void *v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  int v199;
  uint64_t v200;
  int v201;
  uint64_t v202;
  void *v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  int v209;
  uint64_t v210;
  int v211;
  uint64_t v212;
  void *v213;
  id v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  int v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  void *v223;
  id v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  int v229;
  uint64_t v230;
  int v231;
  uint64_t v232;
  void *v233;
  id v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  int v239;
  uint64_t v240;
  id v241;
  int v242;
  id v243;
  int *v244;
  uint64_t v245;
  int v246;
  uint64_t v247;
  void *v248;
  id v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  int v254;
  uint64_t v255;
  int v256;
  uint64_t v257;
  void *v258;
  id v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  int v264;
  uint64_t v265;
  int v266;
  uint64_t v267;
  void *v268;
  id v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  int v274;
  uint64_t v275;
  int v276;
  uint64_t v277;
  void *v278;
  id v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  int v284;
  uint64_t v285;
  int v286;
  uint64_t v287;
  void *v288;
  id v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  int v294;
  uint64_t v295;
  int v296;
  uint64_t v297;
  void *v298;
  id v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  int v304;
  uint64_t v305;
  int v306;
  uint64_t v307;
  void *v308;
  id v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  int v314;
  uint64_t v315;
  int v316;
  uint64_t v317;
  void *v318;
  id v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  int v324;
  uint64_t v325;
  int v326;
  uint64_t v327;
  void *v328;
  id v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  int v334;
  uint64_t v335;
  unint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  int v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  int v347;
  uint64_t v348;
  uint64_t v349;
  void *v350;
  int v351;
  uint64_t v352;
  void *v353;
  id v354;
  NSObject *v355;
  dispatch_source_t v356;
  void *v357;
  uint64_t v358;
  NSObject *v359;
  NSObject *v360;
  dispatch_source_t v361;
  void *v362;
  uint64_t v363;
  NSObject *v364;
  NSObject *v365;
  void *v366;
  int v367;
  uint64_t v368;
  void *v369;
  int v370;
  uint64_t v371;
  void *v372;
  id v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uintptr_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  _QWORD block[5];
  _QWORD v383[4];
  id v384;
  _QWORD v385[5];
  _QWORD v386[4];
  id v387;
  _QWORD handler[5];
  void *memptr[2];

  v6 = self;
  if (self->super._state == 8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    objc_msgSend(v7, "linkIsReady:", v6);

    LOBYTE(v6) = 1;
    return (char)v6;
  }
  if (-[NRLink state](self, "state") != 9)
  {
    if (v6->super._state >= 2u)
    {
      if (qword_1001E46D8 != -1)
        dispatch_once(&qword_1001E46D8, &stru_1001B6D98);
      if (_NRLogIsLevelEnabled(qword_1001E46D0, 17))
      {
        if (qword_1001E46D8 != -1)
          dispatch_once(&qword_1001E46D8, &stru_1001B6D98);
        _NRLogWithArgs(qword_1001E46D0, 17, "Cannot start link: %@", v6);
        LOBYTE(v6) = 0;
      }
      else
      {
        LOBYTE(v6) = 0;
      }
      return (char)v6;
    }
    -[NRLink reportEvent:](v6, "reportEvent:", 3001);
    -[NRLink updateIKEv2Role:](v6, "updateIKEv2Role:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](v6, "queue"));

    if (v9)
    {
      sentPreludeState = &OBJC_IVAR___NRLinkUpgradeReport__timeOfLinkUpgrade;
      if (*(NSUUID **)((char *)&v6->_bluetoothUUID + 7))
      {
        if (*(_QWORD *)((char *)&v6->_handledUrgentLinkReadBufferBytes + 3))
        {
          if (*(CBScalablePipe **)((char *)&v6->_pipe + 7))
          {
            if (-[NRLink ikev2Role](v6, "ikev2Role") == 2 || -[NRLink ikev2Role](v6, "ikev2Role") == 1)
            {
              v11 = -[NRLink ikev2Role](v6, "ikev2Role");
              v12 = 255;
              if (v11 != 1)
                v12 = 0;
              memptr[0] = (void *)(0x101010101010101 * v12);
              memptr[1] = 0;
              arc4random_buf(&memptr[1], 8uLL);
              v13 = (NWRemotePacketProxy *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", memptr);
            }
            else
            {
              v13 = (NWRemotePacketProxy *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
            }
            v14 = *(NWRemotePacketProxy **)((char *)&v6->_remotePacketProxy + 7);
            *(NWRemotePacketProxy **)((char *)&v6->_remotePacketProxy + 7) = v13;

            v15 = *(NSUUID **)((char *)&v6->_randomUUID + 7);
            *(NSUUID **)((char *)&v6->_randomUUID + 7) = (NSUUID *)&stru_1001B95A0;

            v16 = *(unsigned int *)((char *)&v6->_remoteInnerLinkVersionHBO + 3);
            if ((_DWORD)v16)
            {
              v17 = (NSData *)malloc_type_malloc(*(unsigned int *)((char *)&v6->_remoteInnerLinkVersionHBO + 3), 0xA172743EuLL);
              if (!v17)
                goto LABEL_85;
              *(NSData **)((char *)&v6->_localPublicClassAKeysEncryptedWithIDS + 7) = v17;
              *(int *)((char *)&v6->_controlDataSendQueueLen + 3) = 0;
              *(unsigned int *)((char *)&v6->_filledInLinkReadBufferBytes + 3) = 0;
              v2 = (uint64_t)&gNRPacketLoggingEnabled;
              if (gNRPacketLoggingEnabled)
              {
                v149 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v18);
                IsLevelEnabled = _NRLogIsLevelEnabled(v149, 1);

                if (IsLevelEnabled)
                {
                  v152 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v151);
                  v153 = -[NRLink copyDescription](v6, "copyDescription");
                  _NRLogWithArgs(v152, 1, "%s%.30s:%-4d %@: Initialized linkReadBuffer with size %u", ", "-[NRLinkBluetooth start]", 1150, v153, *(unsigned int *)((char *)&v6->_remoteInnerLinkVersionHBO + 3));

                }
              }
              v19 = 279;
              v16 = *(unsigned int *)((char *)&v6->_urgentLinkReadBufferMoveThreshold + 3);
              if ((_DWORD)v16)
              {
                v20 = malloc_type_malloc(*(unsigned int *)((char *)&v6->_urgentLinkReadBufferMoveThreshold + 3), 0xA172743EuLL);
                if (v20)
                {
                  v3 = 447;
                  *(unint64_t *)((char *)&v6->_lastReadNexusOutputActivityCounter + 7) = (unint64_t)v20;
                  v4 = 287;
                  *(unsigned int *)((char *)&v6->_urgentLinkWriteBufferLength + 3) = 0;
                  v5 = 291;
                  *(unsigned int *)((char *)&v6->_filledInLinkWriteBufferBytes + 3) = 0;
                  if (gNRPacketLoggingEnabled)
                  {
                    v2 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v21);
                    v154 = _NRLogIsLevelEnabled(v2, 1);

                    if (v154)
                    {
                      v2 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v155);
                      v156 = -[NRLink copyDescription](v6, "copyDescription");
                      _NRLogWithArgs(v2, 1, "%s%.30s:%-4d %@: Initialized linkWriteBuffer with size %u", ", "-[NRLinkBluetooth start]", 1154, v156, *(unsigned int *)((char *)&v6->_urgentLinkReadBufferMoveThreshold + 3));

                    }
                  }
                  v22 = (char *)objc_alloc_init((Class)NSMutableArray);
                  v23 = *(char **)((char *)&v6->_urgentLinkWriteBuffer + 7);
                  *(char **)((char *)&v6->_urgentLinkWriteBuffer + 7) = v22;

                  v6->_linkLogTokenListCount = 10;
                  memptr[0] = 0;
                  if (malloc_type_posix_memalign(memptr, 8uLL, 0x50uLL, 0xD5FEC036uLL) || !memptr[0])
                  {
                    v157 = sub_100070AC8();
                    v158 = _NRLogIsLevelEnabled(v157, 16);

                    if (v158)
                    {
                      v159 = sub_100070AC8();
                      _NRLogWithArgs(v159, 16, "%s%.30s:%-4d ABORTING: posix_memalign(..., %zu, %zu) failed", ", "strict_memalign", 183, 8uLL, 0x50uLL);

                    }
                  }
                  else
                  {
                    *(void **)((char *)&v6->_linkLogToken + 7) = memptr[0];
                    v6->_ntlLogTokenListCount = 10;
                    memptr[0] = 0;
                    if (!malloc_type_posix_memalign(memptr, 8uLL, 0x50uLL, 0xD5FEC036uLL) && memptr[0])
                    {
                      *(void **)((char *)&v6->_ntlLogToken + 7) = memptr[0];
                      v24 = *(id *)((char *)&v6->_bluetoothUUID + 7);
                      v16 = (uint64_t)v24;
                      v25 = 246;
                      if (v6->_enableBluetoothPacketParser)
                      {
                        while (1)
                        {
                          v379 = v5;
                          v5 = v4;
                          v381 = v25;
                          v380 = v16;
                          v4 = (uint64_t)&v375;
                          sentPreludeState = (int *)v6->_sentPreludeState;
                          v26 = v6;
                          v27 = (char *)malloc_type_malloc(0x21uLL, 0xA172743EuLL);
                          if (v27)
                          {
                            v2 = (uint64_t)v27;
                            *(_QWORD *)v27 = 0x53554E494D524554;
                            v27[8] = 1;
                            v27[9] = (char)sentPreludeState;
                            *((_WORD *)v27 + 5) = 4864;
                            v27[12] = 4;
                            *(_WORD *)(v27 + 13) = 4096;
                            memptr[0] = 0;
                            memptr[1] = 0;
                            objc_msgSend(*(id *)((char *)&v6->_remotePacketProxy + 7), "getUUIDBytes:", memptr);
                            *(_OWORD *)(v2 + 15) = *(_OWORD *)memptr;
                            *(_WORD *)(v2 + 31) = ~(unsigned __int16)os_inet_checksum(v2, 31, 0);

                            if (*(_DWORD *)((char *)&v6->super.super.isa + v19) > 0x20u)
                            {
                              if (*(NSString **)((char *)&v26->_remoteDeviceName + 7))
                              {
                                v29 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v28);
                                v30 = _NRLogIsLevelEnabled(v29, 17);

                                if (v30)
                                {
                                  v32 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v31);
                                  v33 = -[NRLink copyDescription](v26, "copyDescription");
                                  _NRLogWithArgs(v32, 17, "%@: Sending prelude but sentPrelude is %@", v33, *(NSString **)((char *)&v26->_remoteDeviceName + 7));

                                }
                              }
                              v34 = (NSString *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v2, 33);
                              v35 = *(NSString **)((char *)&v26->_remoteDeviceName + 7);
                              *(NSString **)((char *)&v26->_remoteDeviceName + 7) = v34;

                              v36 = *(uint64_t *)((char *)&v6->super.super.isa + v3);
                              v37 = *(_OWORD *)v2;
                              v38 = *(_OWORD *)(v2 + 16);
                              *(_BYTE *)(v36 + 32) = *(_BYTE *)(v2 + 32);
                              *(_OWORD *)v36 = v37;
                              *(_OWORD *)(v36 + 16) = v38;
                              free((void *)v2);
                              *(_DWORD *)((char *)&v6->super.super.isa + v5) += 33;
                              v40 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v39);
                              v41 = _NRLogIsLevelEnabled(v40, 1);

                              if (v41)
                              {
                                v43 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v42);
                                v44 = -[NRLink copyDescription](v26, "copyDescription");
                                v45 = *(unsigned int *)((char *)&v6->super.super.isa + v5);
                                v46 = *(unsigned int *)((char *)&v6->super.super.isa + v379);
                                v47 = (void *)_NRCreateDataString(*(NSString **)((char *)&v26->_remoteDeviceName + 7));
                                _NRLogWithArgs(v43, 1, "%s%.30s:%-4d %@: Sending prelude %u bytes filledIn=%u handled=%u %@", ", "-[NRLinkBluetooth start]", 1380, v44, 33, v45, v46, v47);

                              }
                              -[NRLink changeStateTo:](v26, "changeStateTo:", 2);
                              v49 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v48);
                              v50 = _NRLogIsLevelEnabled(v49, 1);

                              if (v50)
                              {
                                v52 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v51);
                                v53 = -[NRLink copyDescription](v26, "copyDescription");
                                _NRLogWithArgs(v52, 1, "%s%.30s:%-4d %@: Created new link", ", "-[NRLinkBluetooth start]", 1383, v53);

                              }
                              if (*((_BYTE *)&v6->super.super.isa + v381))
                                sub_10007118C((uint64_t)v26, *(void **)((char *)&v26->_remoteDeviceName + 7), &off_1001C46D8);
                              v54 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v51);
                              v55 = _NRLogIsLevelEnabled(v54, 1);

                              if (v55)
                              {
                                v57 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v56);
                                v58 = -[NRLink copyDescription](v26, "copyDescription");
                                _NRLogWithArgs(v57, 1, "%s%.30s:%-4d %@: NtL LOOP async start before async", ", "-[NRLinkBluetooth start]", 1390, v58);

                              }
                              queue = v26->super._queue;
                              block[0] = _NSConcreteStackBlock;
                              block[1] = 3221225472;
                              block[2] = sub_10009E928;
                              block[3] = &unk_1001B8AE0;
                              block[4] = v26;
                              dispatch_async(queue, block);
                              if (!v26->_addedHostStateObserver)
                              {
                                v60 = *(id *)((char *)&v26->_bluetoothUUID + 7);
                                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "peer"));
                                objc_msgSend(v61, "addObserver:forKeyPath:options:context:", v26, CFSTR("hostState"), 5, 0);

                                v26->_addedHostStateObserver = 1;
                              }
                              LOBYTE(v6) = 1;
                              v16 = v380;
                              goto LABEL_201;
                            }
                            v241 = sub_100070AC8();
                            v242 = _NRLogIsLevelEnabled(v241, 16);

                            if (v242)
                            {
                              v243 = sub_100070AC8();
                              _NRLogWithArgs(v243, 16, "%s%.30s:%-4d ABORTING: well this is absurd %u", ", "-[NRLinkBluetooth start]", 1369, 33);

                            }
                            v16 = _os_log_pack_size(18);
                            v6 = (NRLinkBluetooth *)((char *)&v375 - ((__chkstk_darwin(v16) + 15) & 0xFFFFFFFFFFFFFFF0));
                            v244 = __error();
                            v245 = _os_log_pack_fill(v6, v16, *v244, &_mh_execute_header, "%{public}s well this is absurd %u");
                            *(_DWORD *)v245 = 136446466;
                            *(_QWORD *)(v245 + 4) = "-[NRLinkBluetooth start]";
                            *(_WORD *)(v245 + 12) = 1024;
                            *(_DWORD *)(v245 + 14) = 33;
                          }
                          else
                          {
                            v165 = sub_100070AC8();
                            v166 = _NRLogIsLevelEnabled(v165, 16);

                            if (v166)
                            {
                              v167 = sub_100070AC8();
                              _NRLogWithArgs(v167, 16, "%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", ", "strict_malloc", 79, 0x21uLL);

                            }
                            v16 = _os_log_pack_size(22);
                            v6 = (NRLinkBluetooth *)((char *)&v375 - ((__chkstk_darwin(v16) + 15) & 0xFFFFFFFFFFFFFFF0));
                            v168 = __error();
                            v169 = _os_log_pack_fill(v6, v16, *v168, &_mh_execute_header, "%{public}s strict_malloc(%zu) failed");
                            *(_DWORD *)v169 = 136446466;
                            *(_QWORD *)(v169 + 4) = "strict_malloc";
                            *(_WORD *)(v169 + 12) = 2048;
                            *(_QWORD *)(v169 + 14) = 33;
                          }
LABEL_115:
                          v170 = sub_100070AC8();
                          v141 = _NRLogAbortWithPack(v170, v6);
LABEL_116:
                          v171 = _NRLogIsLevelEnabled(v141, 2);

                          if (v171)
                          {
                            v173 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v172);
                            v174 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v173, 2, "%s%.30s:%-4d %@: Link Channel RX_SLOTS = %llu", ", "-[NRLinkBluetooth start]", 1218, v174, memptr[0]);

                          }
                          memptr[0] = 0;
                          v175 = os_channel_attr_get(v376, 4, memptr);
                          v177 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v176);
                          v178 = (void *)v177;
                          if ((_DWORD)v175)
                          {
                            v179 = _NRLogIsLevelEnabled(v177, 17);

                            if (!v179)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v180);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(SLOT_BUF_SIZE) returned %d", v82, v175);
                            goto LABEL_199;
                          }
                          v181 = _NRLogIsLevelEnabled(v177, 2);

                          if (v181)
                          {
                            v183 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v182);
                            v184 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v183, 2, "%s%.30s:%-4d %@: Link Channel SLOT_BUF_SIZE = %llu", ", "-[NRLinkBluetooth start]", 1219, v184, memptr[0]);

                          }
                          memptr[0] = 0;
                          v185 = os_channel_attr_get(v376, 5, memptr);
                          v187 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v186);
                          v188 = (void *)v187;
                          if ((_DWORD)v185)
                          {
                            v189 = _NRLogIsLevelEnabled(v187, 17);

                            if (!v189)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v190);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(SLOT_META_SIZE) returned %d", v82, v185);
                            goto LABEL_199;
                          }
                          v191 = _NRLogIsLevelEnabled(v187, 2);

                          if (v191)
                          {
                            v193 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v192);
                            v194 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v193, 2, "%s%.30s:%-4d %@: Link Channel SLOT_META_SIZE = %llu", ", "-[NRLinkBluetooth start]", 1220, v194, memptr[0]);

                          }
                          memptr[0] = 0;
                          v195 = os_channel_attr_get(v376, 6, memptr);
                          v197 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v196);
                          v198 = (void *)v197;
                          if ((_DWORD)v195)
                          {
                            v199 = _NRLogIsLevelEnabled(v197, 17);

                            if (!v199)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v200);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(EXCLUSIVE) returned %d", v82, v195);
                            goto LABEL_199;
                          }
                          v201 = _NRLogIsLevelEnabled(v197, 2);

                          if (v201)
                          {
                            v203 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v202);
                            v204 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v203, 2, "%s%.30s:%-4d %@: Link Channel EXCLUSIVE = %llu", ", "-[NRLinkBluetooth start]", 1221, v204, memptr[0]);

                          }
                          memptr[0] = 0;
                          v205 = os_channel_attr_get(v376, 7, memptr);
                          v207 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v206);
                          v208 = (void *)v207;
                          if ((_DWORD)v205)
                          {
                            v209 = _NRLogIsLevelEnabled(v207, 17);

                            if (!v209)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v210);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(NO_AUTO_SYNC) returned %d", v82, v205);
                            goto LABEL_199;
                          }
                          v211 = _NRLogIsLevelEnabled(v207, 2);

                          if (v211)
                          {
                            v213 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v212);
                            v214 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v213, 2, "%s%.30s:%-4d %@: Link Channel NO_AUTO_SYNC = %llu", ", "-[NRLinkBluetooth start]", 1222, v214, memptr[0]);

                          }
                          memptr[0] = 0;
                          v215 = os_channel_attr_get(v376, 8, memptr);
                          v217 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v216);
                          v218 = (void *)v217;
                          if ((_DWORD)v215)
                          {
                            v219 = _NRLogIsLevelEnabled(v217, 17);

                            if (!v219)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v220);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(MONITOR) returned %d", v82, v215);
                            goto LABEL_199;
                          }
                          v221 = _NRLogIsLevelEnabled(v217, 2);

                          if (v221)
                          {
                            v223 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v222);
                            v224 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v223, 2, "%s%.30s:%-4d %@: Link Channel MONITOR = %llu", ", "-[NRLinkBluetooth start]", 1223, v224, memptr[0]);

                          }
                          memptr[0] = 0;
                          v225 = os_channel_attr_get(v376, 9, memptr);
                          v227 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v226);
                          v228 = (void *)v227;
                          if ((_DWORD)v225)
                          {
                            v229 = _NRLogIsLevelEnabled(v227, 17);

                            if (!v229)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v230);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(TX_LOWAT_UNIT) returned %d", v82, v225);
                            goto LABEL_199;
                          }
                          v231 = _NRLogIsLevelEnabled(v227, 2);

                          if (v231)
                          {
                            v233 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v232);
                            v234 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v233, 2, "%s%.30s:%-4d %@: Link Channel TX_LOWAT_UNIT = %llu", ", "-[NRLinkBluetooth start]", 1224, v234, memptr[0]);

                          }
                          memptr[0] = 0;
                          v235 = os_channel_attr_get(v376, 10, memptr);
                          v237 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v236);
                          v238 = (void *)v237;
                          if ((_DWORD)v235)
                          {
                            v239 = _NRLogIsLevelEnabled(v237, 17);

                            if (!v239)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v240);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(TX_LOWAT_VALUE) returned %d", v82, v235);
                            goto LABEL_199;
                          }
                          v246 = _NRLogIsLevelEnabled(v237, 2);

                          if (v246)
                          {
                            v248 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v247);
                            v249 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v248, 2, "%s%.30s:%-4d %@: Link Channel TX_LOWAT_VALUE = %llu", ", "-[NRLinkBluetooth start]", 1225, v249, memptr[0]);

                          }
                          memptr[0] = 0;
                          v250 = os_channel_attr_get(v376, 11, memptr);
                          v252 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v251);
                          v253 = (void *)v252;
                          if ((_DWORD)v250)
                          {
                            v254 = _NRLogIsLevelEnabled(v252, 17);

                            if (!v254)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v255);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(RX_LOWAT_UNIT) returned %d", v82, v250);
                            goto LABEL_199;
                          }
                          v256 = _NRLogIsLevelEnabled(v252, 2);

                          if (v256)
                          {
                            v258 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v257);
                            v259 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v258, 2, "%s%.30s:%-4d %@: Link Channel RX_LOWAT_UNIT = %llu", ", "-[NRLinkBluetooth start]", 1226, v259, memptr[0]);

                          }
                          memptr[0] = 0;
                          v260 = os_channel_attr_get(v376, 12, memptr);
                          v262 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v261);
                          v263 = (void *)v262;
                          if ((_DWORD)v260)
                          {
                            v264 = _NRLogIsLevelEnabled(v262, 17);

                            if (!v264)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v265);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(RX_LOWAT_VALUE) returned %d", v82, v260);
                            goto LABEL_199;
                          }
                          v266 = _NRLogIsLevelEnabled(v262, 2);

                          if (v266)
                          {
                            v268 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v267);
                            v269 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v268, 2, "%s%.30s:%-4d %@: Link Channel RX_LOWAT_VALUE = %llu", ", "-[NRLinkBluetooth start]", 1227, v269, memptr[0]);

                          }
                          memptr[0] = 0;
                          v270 = os_channel_attr_get(v376, 13, memptr);
                          v272 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v271);
                          v273 = (void *)v272;
                          if ((_DWORD)v270)
                          {
                            v274 = _NRLogIsLevelEnabled(v272, 17);

                            if (!v274)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v275);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(NEXUS_TYPE) returned %d", v82, v270);
                            goto LABEL_199;
                          }
                          v276 = _NRLogIsLevelEnabled(v272, 2);

                          if (v276)
                          {
                            v278 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v277);
                            v279 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v278, 2, "%s%.30s:%-4d %@: Link Channel NEXUS_TYPE = %llu", ", "-[NRLinkBluetooth start]", 1228, v279, memptr[0]);

                          }
                          memptr[0] = 0;
                          v280 = os_channel_attr_get(v376, 14, memptr);
                          v282 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v281);
                          v283 = (void *)v282;
                          if ((_DWORD)v280)
                          {
                            v284 = _NRLogIsLevelEnabled(v282, 17);

                            if (!v284)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v285);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(NEXUS_EXTENSIONS) returned %d", v82, v280);
                            goto LABEL_199;
                          }
                          v286 = _NRLogIsLevelEnabled(v282, 2);

                          if (v286)
                          {
                            v288 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v287);
                            v289 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v288, 2, "%s%.30s:%-4d %@: Link Channel NEXUS_EXTENSIONS = %llu", ", "-[NRLinkBluetooth start]", 1229, v289, memptr[0]);

                          }
                          memptr[0] = 0;
                          v290 = os_channel_attr_get(v376, 15, memptr);
                          v292 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v291);
                          v293 = (void *)v292;
                          if ((_DWORD)v290)
                          {
                            v294 = _NRLogIsLevelEnabled(v292, 17);

                            if (!v294)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v295);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(NEXUS_MHINTS) returned %d", v82, v290);
                            goto LABEL_199;
                          }
                          v296 = _NRLogIsLevelEnabled(v292, 2);

                          if (v296)
                          {
                            v298 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v297);
                            v299 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v298, 2, "%s%.30s:%-4d %@: Link Channel NEXUS_MHINTS = %llu", ", "-[NRLinkBluetooth start]", 1230, v299, memptr[0]);

                          }
                          memptr[0] = 0;
                          v300 = os_channel_attr_get(v376, 18, memptr);
                          v302 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v301);
                          v303 = (void *)v302;
                          if ((_DWORD)v300)
                          {
                            v304 = _NRLogIsLevelEnabled(v302, 17);

                            if (!v304)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v305);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(NEXUS_IFINDEX) returned %d", v82, v300);
                            goto LABEL_199;
                          }
                          v306 = _NRLogIsLevelEnabled(v302, 2);

                          if (v306)
                          {
                            v308 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v307);
                            v309 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v308, 2, "%s%.30s:%-4d %@: Link Channel NEXUS_IFINDEX = %llu", ", "-[NRLinkBluetooth start]", 1231, v309, memptr[0]);

                          }
                          memptr[0] = 0;
                          v310 = os_channel_attr_get(v376, 19, memptr);
                          v312 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v311);
                          v313 = (void *)v312;
                          if ((_DWORD)v310)
                          {
                            v314 = _NRLogIsLevelEnabled(v312, 17);

                            if (!v314)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v315);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(NEXUS_STATS_SIZE) returned %d", v82, v310);
                            goto LABEL_199;
                          }
                          v316 = _NRLogIsLevelEnabled(v312, 2);

                          if (v316)
                          {
                            v318 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v317);
                            v319 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v318, 2, "%s%.30s:%-4d %@: Link Channel NEXUS_STATS_SIZE = %llu", ", "-[NRLinkBluetooth start]", 1232, v319, memptr[0]);

                          }
                          memptr[0] = 0;
                          v320 = os_channel_attr_get(v376, 20, memptr);
                          v322 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v321);
                          v323 = (void *)v322;
                          if ((_DWORD)v320)
                          {
                            v324 = _NRLogIsLevelEnabled(v322, 17);

                            if (!v324)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v325);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(NEXUS_FLOWADV_MAX) returned %d", v82, v320);
                            goto LABEL_199;
                          }
                          v326 = _NRLogIsLevelEnabled(v322, 2);

                          if (v326)
                          {
                            v328 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v327);
                            v329 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v328, 2, "%s%.30s:%-4d %@: Link Channel NEXUS_FLOWADV_MAX = %llu", ", "-[NRLinkBluetooth start]", 1233, v329, memptr[0]);

                          }
                          memptr[0] = 0;
                          v330 = os_channel_attr_get(v376, 2, memptr);
                          if ((_DWORD)v330)
                          {
                            v332 = v330;
                            v333 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v331);
                            v334 = _NRLogIsLevelEnabled(v333, 17);

                            if (!v334)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v335);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: link os_channel_attr_get(TX_SLOTS) returned %d", v82, v332);
                            goto LABEL_199;
                          }
                          v336 = (unint64_t)memptr[0] >> 1;
                          v337 = os_channel_attr_set(v376, 10, (unint64_t)memptr[0] >> 1);
                          if ((_DWORD)v337)
                          {
                            v339 = v337;
                            v340 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v338);
                            v341 = _NRLogIsLevelEnabled(v340, 17);

                            if (!v341)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v342);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: link os_channel_attr_set(TX_LOWAT_VALUE, %llu) returned %d", v82, v336, v339);
                            goto LABEL_199;
                          }
                          v343 = os_channel_write_attr(*(Class *)((char *)&v6->super.super.isa + v2), v376);
                          if ((_DWORD)v343)
                          {
                            v345 = v343;
                            v346 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v344);
                            v347 = _NRLogIsLevelEnabled(v346, 17);

                            if (!v347)
                              goto LABEL_200;
                            v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v348);
                            v82 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v81, 17, "%@: link os_channel_write_attr returned %d (linkOutputLowat=%llu)", v82, v345, v336);
                            goto LABEL_199;
                          }
                          os_channel_attr_destroy(v376);
                          v350 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v349);
                          v351 = _NRLogIsLevelEnabled(v350, 1);

                          if (v351)
                          {
                            v353 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v352);
                            v354 = -[NRLink copyDescription](v6, "copyDescription");
                            _NRLogWithArgs(v353, 1, "%s%.30s:%-4d %@: Successfully set linkOutputLowat to %llu (linkOutputSlotCount=%llu)", ", "-[NRLinkBluetooth start]", 1267, v354, v336, memptr[0]);

                          }
                          v355 = v6->super._queue;
                          v378 = v378;
                          v356 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v378, 0, v355);
                          v357 = *(channel_ring_desc **)((char *)&v6->_linkOutputRing + 7);
                          *(channel_ring_desc **)((char *)&v6->_linkOutputRing + 7) = (channel_ring_desc *)v356;

                          v359 = *(NSObject **)((char *)&v6->_linkOutputRing + 7);
                          if (!v359)
                            break;
                          handler[0] = _NSConcreteStackBlock;
                          handler[1] = 3221225472;
                          handler[2] = sub_10009E4B4;
                          handler[3] = &unk_1001B8AE0;
                          handler[4] = v6;
                          dispatch_source_set_event_handler(v359, handler);
                          v360 = *(NSObject **)((char *)&v6->_linkOutputRing + 7);
                          v386[0] = _NSConcreteStackBlock;
                          v386[1] = 3221225472;
                          v386[2] = nullsub_10;
                          v386[3] = &unk_1001B8AE0;
                          v2 = (uint64_t)(id)v16;
                          v387 = (id)v2;
                          dispatch_source_set_cancel_handler(v360, v386);
                          dispatch_activate(*(dispatch_object_t *)((char *)&v6->_linkOutputRing + 7));
                          v361 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, v378, 0, (dispatch_queue_t)v6->super._queue);
                          v362 = *(OS_dispatch_source **)((char *)&v6->_dLinkInputSource + 7);
                          *(OS_dispatch_source **)((char *)&v6->_dLinkInputSource + 7) = (OS_dispatch_source *)v361;

                          v364 = *(NSObject **)((char *)&v6->_dLinkInputSource + 7);
                          if (!v364)
                          {
                            v369 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v363);
                            v370 = _NRLogIsLevelEnabled(v369, 17);

                            if (v370)
                            {
                              v372 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v371);
                              v373 = -[NRLink copyDescription](v6, "copyDescription");
                              _NRLogWithArgs(v372, 17, "%@: _dLinkOutputSource is NULL", v373);

                            }
                            goto LABEL_200;
                          }
                          v385[0] = _NSConcreteStackBlock;
                          v385[1] = 3221225472;
                          v385[2] = sub_10009E6DC;
                          v385[3] = &unk_1001B8AE0;
                          v385[4] = v6;
                          dispatch_source_set_event_handler(v364, v385);
                          v365 = *(NSObject **)((char *)&v6->_dLinkInputSource + 7);
                          v383[0] = _NSConcreteStackBlock;
                          v383[1] = 3221225472;
                          v383[2] = nullsub_11;
                          v383[3] = &unk_1001B8AE0;
                          v384 = (id)v2;
                          dispatch_source_set_cancel_handler(v365, v383);
                          v6->_dLinkOutputSourceSuspended = 1;

                          v25 = v381;
                          v19 = v377;
                        }
                        v366 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v358);
                        v367 = _NRLogIsLevelEnabled(v366, 17);

                        if (!v367)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v368);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: _dLinkInputSource is NULL", v82, v374);
                        goto LABEL_199;
                      }
                      v62 = objc_msgSend(v24, "channel");
                      v2 = 959;
                      *(unint64_t *)((char *)&v6->_writeCounter + 7) = (unint64_t)v62;
                      if (!v62)
                      {
                        v83 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v63);
                        v84 = _NRLogIsLevelEnabled(v83, 17);

                        if (!v84)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v85);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: pipe.channel is NULL", v82);
                        goto LABEL_199;
                      }
                      v64 = os_channel_ring_id(v62, 2);
                      v65 = os_channel_rx_ring(*(unint64_t *)((char *)&v6->_writeCounter + 7), v64);
                      *(channel **)((char *)&v6->_linkChannel + 7) = (channel *)v65;
                      if (!v65)
                      {
                        v86 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v66);
                        v87 = _NRLogIsLevelEnabled(v86, 17);

                        if (!v87)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v88);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: _linkInputRing is NULL", v82);
                        goto LABEL_199;
                      }
                      v67 = os_channel_ring_id(*(unint64_t *)((char *)&v6->_writeCounter + 7), 0);
                      v68 = os_channel_tx_ring(*(unint64_t *)((char *)&v6->_writeCounter + 7), v67);
                      *(channel_ring_desc **)((char *)&v6->_linkInputRing + 7) = (channel_ring_desc *)v68;
                      if (!v68)
                      {
                        v89 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v69);
                        v90 = _NRLogIsLevelEnabled(v89, 17);

                        if (!v90)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v91);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: _linkOutputRing is NULL", v82);
                        goto LABEL_199;
                      }
                      fd = os_channel_get_fd(*(unint64_t *)((char *)&v6->_writeCounter + 7));
                      if ((fd & 0x80000000) != 0)
                      {
                        v92 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v71);
                        v93 = _NRLogIsLevelEnabled(v92, 17);

                        if (!v93)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v94);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: os_channel_get_fd failed", v82);
                        goto LABEL_199;
                      }
                      LODWORD(v378) = fd;
                      v72 = os_channel_attr_create(fd);
                      if (!v72)
                      {
                        v95 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v73);
                        v96 = _NRLogIsLevelEnabled(v95, 17);

                        if (!v96)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v97);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: os_channel_attr_create failed", v82);
                        goto LABEL_199;
                      }
                      v74 = v72;
                      v377 = 279;
                      attr = os_channel_read_attr(*(unint64_t *)((char *)&v6->_writeCounter + 7), v72);
                      if ((_DWORD)attr)
                      {
                        v77 = attr;
                        v78 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v76);
                        v79 = _NRLogIsLevelEnabled(v78, 17);

                        if (!v79)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v80);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: os_channel_read_attr returned %d", v82, v77);
                        goto LABEL_199;
                      }
                      v381 = 246;
                      memptr[0] = 0;
                      v98 = os_channel_attr_get(v74, 0, memptr);
                      v100 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v99);
                      v101 = (void *)v100;
                      if ((_DWORD)v98)
                      {
                        v102 = _NRLogIsLevelEnabled(v100, 17);

                        if (!v102)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v103);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(TX_RINGS) returned %d", v82, v98);
                        goto LABEL_199;
                      }
                      v376 = v74;
                      v104 = _NRLogIsLevelEnabled(v100, 2);

                      if (v104)
                      {
                        v106 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v105);
                        v107 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v106, 2, "%s%.30s:%-4d %@: Link Channel TX_RINGS = %llu", ", "-[NRLinkBluetooth start]", 1215, v107, memptr[0]);

                      }
                      memptr[0] = 0;
                      v108 = os_channel_attr_get(v376, 1, memptr);
                      v110 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v109);
                      v111 = (void *)v110;
                      if ((_DWORD)v108)
                      {
                        v112 = _NRLogIsLevelEnabled(v110, 17);

                        if (!v112)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v113);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(RX_RINGS) returned %d", v82, v108);
                        goto LABEL_199;
                      }
                      v114 = _NRLogIsLevelEnabled(v110, 2);

                      if (v114)
                      {
                        v116 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v115);
                        v117 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v116, 2, "%s%.30s:%-4d %@: Link Channel RX_RINGS = %llu", ", "-[NRLinkBluetooth start]", 1216, v117, memptr[0]);

                      }
                      memptr[0] = 0;
                      v118 = os_channel_attr_get(v376, 2, memptr);
                      v120 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v119);
                      sentPreludeState = (int *)v120;
                      if ((_DWORD)v118)
                      {
                        v121 = _NRLogIsLevelEnabled(v120, 17);

                        if (!v121)
                          goto LABEL_200;
                        v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v122);
                        v82 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(TX_SLOTS) returned %d", v82, v118);
                        goto LABEL_199;
                      }
LABEL_88:
                      v135 = _NRLogIsLevelEnabled(v120, 2);

                      if (v135)
                      {
                        v137 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v136);
                        v138 = -[NRLink copyDescription](v6, "copyDescription");
                        _NRLogWithArgs(v137, 2, "%s%.30s:%-4d %@: Link Channel TX_SLOTS = %llu", ", "-[NRLinkBluetooth start]", 1217, v138, memptr[0]);

                      }
                      memptr[0] = 0;
                      v139 = os_channel_attr_get(v376, 3, memptr);
                      v141 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v140);
                      sentPreludeState = (int *)v141;
                      if (!(_DWORD)v139)
                        goto LABEL_116;
                      v142 = _NRLogIsLevelEnabled(v141, 17);

                      if (!v142)
                      {
LABEL_200:
                        LOBYTE(v6) = 0;
LABEL_201:

                        return (char)v6;
                      }
                      v81 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v143);
                      v82 = -[NRLink copyDescription](v6, "copyDescription");
                      _NRLogWithArgs(v81, 17, "%@: os_channel_attr_get(RX_SLOTS) returned %d", v82, v139);
LABEL_199:

                      goto LABEL_200;
                    }
                    v160 = sub_100070AC8();
                    v161 = _NRLogIsLevelEnabled(v160, 16);

                    if (v161)
                    {
                      v162 = sub_100070AC8();
                      _NRLogWithArgs(v162, 16, "%s%.30s:%-4d ABORTING: posix_memalign(..., %zu, %zu) failed", ", "strict_memalign", 183, 8uLL, 0x50uLL);

                    }
                  }
                  v16 = _os_log_pack_size(32);
                  v6 = (NRLinkBluetooth *)((char *)&v375 - ((__chkstk_darwin(v16) + 15) & 0xFFFFFFFFFFFFFFF0));
                  v163 = __error();
                  v164 = _os_log_pack_fill(v6, v16, *v163, &_mh_execute_header, "%{public}s posix_memalign(..., %zu, %zu) failed");
                  *(_DWORD *)v164 = 136446722;
                  *(_QWORD *)(v164 + 4) = "strict_memalign";
                  *(_WORD *)(v164 + 12) = 2048;
                  *(_QWORD *)(v164 + 14) = 8;
                  *(_WORD *)(v164 + 22) = 2048;
                  *(_QWORD *)(v164 + 24) = 80;
                  goto LABEL_115;
                }
LABEL_85:
                v128 = sub_100070AC8();
                v129 = _NRLogIsLevelEnabled(v128, 16);

                if (v129)
                {
                  v130 = sub_100070AC8();
                  _NRLogWithArgs(v130, 16, "%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", ", "strict_malloc", 79, v16);

                }
                v6 = (NRLinkBluetooth *)_os_log_pack_size(22);
                v131 = (char *)&v375 - ((__chkstk_darwin(v6) + 15) & 0xFFFFFFFFFFFFFFF0);
                v132 = __error();
                v133 = _os_log_pack_fill(v131, v6, *v132, &_mh_execute_header, "%{public}s strict_malloc(%zu) failed");
                *(_DWORD *)v133 = 136446466;
                *(_QWORD *)(v133 + 4) = "strict_malloc";
                *(_WORD *)(v133 + 12) = 2048;
                *(_QWORD *)(v133 + 14) = v16;
                v134 = sub_100070AC8();
                v120 = _NRLogAbortWithPack(v134, v131);
                goto LABEL_88;
              }
            }
            v123 = sub_100070AC8();
            v124 = _NRLogIsLevelEnabled(v123, 16);

            if (v124)
            {
              v125 = sub_100070AC8();
              _NRLogWithArgs(v125, 16, "%s%.30s:%-4d ABORTING: strict_malloc called with size 0", ", "strict_malloc", 74);

            }
            v16 = _os_log_pack_size(12);
            v6 = (NRLinkBluetooth *)((char *)&v375 - ((__chkstk_darwin(v16) + 15) & 0xFFFFFFFFFFFFFFF0));
            v126 = __error();
            v127 = _os_log_pack_fill(v6, v16, *v126, &_mh_execute_header, "%{public}s strict_malloc called with size 0");
            *(_DWORD *)v127 = 136446210;
            *(_QWORD *)(v127 + 4) = "strict_malloc";
            goto LABEL_115;
          }
          v148 = sub_100070AC8();
          LODWORD(v6) = _NRLogIsLevelEnabled(v148, 17);

          if (!(_DWORD)v6)
            return (char)v6;
          v145 = sub_100070AC8();
          _NRLogWithArgs(v145, 17, "%s called with null self.remoteDeviceName");
        }
        else
        {
          v147 = sub_100070AC8();
          LODWORD(v6) = _NRLogIsLevelEnabled(v147, 17);

          if (!(_DWORD)v6)
            return (char)v6;
          v145 = sub_100070AC8();
          _NRLogWithArgs(v145, 17, "%s called with null self.bluetoothUUID");
        }
      }
      else
      {
        v146 = sub_100070AC8();
        LODWORD(v6) = _NRLogIsLevelEnabled(v146, 17);

        if (!(_DWORD)v6)
          return (char)v6;
        v145 = sub_100070AC8();
        _NRLogWithArgs(v145, 17, "%s called with null self.pipe");
      }
    }
    else
    {
      v144 = sub_100070AC8();
      LODWORD(v6) = _NRLogIsLevelEnabled(v144, 17);

      if (!(_DWORD)v6)
        return (char)v6;
      v145 = sub_100070AC8();
      _NRLogWithArgs(v145, 17, "%s called with null self.queue");
    }

    LOBYTE(v6) = 0;
    return (char)v6;
  }
  return -[NRLinkBluetooth resume](v6, "resume");
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NRLinkBluetooth;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", sub_100077D08((uint64_t)self, v3));
}

- (void)invalidateLink
{
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NRCompanionProxyAgent *companionProxyAgent;
  NRCompanionProxyAgent *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  id v94;
  void *v95;
  int v96;
  uint64_t v97;
  void *v98;
  id v99;
  void *v100;
  int v101;
  uint64_t v102;
  void *v103;
  id v104;
  objc_super v105;

  v3 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0);

  if (IsLevelEnabled)
  {
    v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
    v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v6, 0, "%s%.30s:%-4d %@: Invalidating", ", "-[NRLinkBluetooth invalidateLink]", 1566, v7);

  }
  v105.receiver = self;
  v105.super_class = (Class)NRLinkBluetooth;
  -[NRLink invalidateLink](&v105, "invalidateLink");
  v9 = *(NSData **)((char *)&self->_localPublicClassAKeysEncryptedWithIDS + 7);
  if (v9)
  {
    free(v9);
    *(NSData **)((char *)&self->_localPublicClassAKeysEncryptedWithIDS + 7) = 0;
  }
  v10 = *(void **)((char *)&self->_lastReadNexusOutputActivityCounter + 7);
  if (v10)
  {
    free(v10);
    *(unint64_t *)((char *)&self->_lastReadNexusOutputActivityCounter + 7) = 0;
  }
  if (self->_addedHostStateObserver)
  {
    v11 = *(id *)((char *)&self->_bluetoothUUID + 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peer"));
    objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("hostState"), 0);

    self->_addedHostStateObserver = 0;
  }
  v13 = *(NSObject **)((char *)&self->_nexusOutputRing + 7);
  if (v13)
  {
    if (self->_dNexusInputSourceSuspended)
    {
      self->_dNexusInputSourceSuspended = 0;
      ++*(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
      if (gNRPacketLoggingEnabled)
      {
        v55 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v56 = _NRLogIsLevelEnabled(v55, 1);

        if (v56)
        {
          v58 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v57);
          v59 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v58, 1, "%s%.30s:%-4d %@: source-resume: NexusInput", ", "NRLinkResumeNexusInputSource", 842, v59);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
      v13 = *(NSObject **)((char *)&self->_nexusOutputRing + 7);
    }
    dispatch_source_cancel(v13);
    v14 = *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7) = 0;

  }
  v15 = *(NSObject **)((char *)&self->_dNexusInputSource + 7);
  if (v15)
  {
    if (self->_dNexusOutputSourceSuspended)
    {
      self->_dNexusOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        v60 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v61 = _NRLogIsLevelEnabled(v60, 1);

        if (v61)
        {
          v63 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v62);
          v64 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v63, 1, "%s%.30s:%-4d %@: source-resume: NexusOutput", ", "NRLinkResumeNexusOutputSource", 843, v64);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusInputSource + 7));
      v15 = *(NSObject **)((char *)&self->_dNexusInputSource + 7);
    }
    dispatch_source_cancel(v15);
    v16 = *(OS_dispatch_source **)((char *)&self->_dNexusInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusInputSource + 7) = 0;

  }
  v17 = *(uint64_t *)((char *)&self->_receivedPrelude + 7);
  if (v17)
  {
    if (!*(OS_dispatch_source **)((char *)&self->_dNexusOutputSource + 7))
      os_channel_destroy(v17);
    *(NSData **)((char *)&self->_receivedPrelude + 7) = 0;
  }
  *(channel **)((char *)&self->_nexusChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_nexusInputRing + 7) = 0;
  v18 = *(NSObject **)((char *)&self->_nexusVIOutputRing + 7);
  if (v18)
  {
    if (self->_dNexusVIInputSourceSuspended)
    {
      self->_dNexusVIInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusVIOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        v65 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v66 = _NRLogIsLevelEnabled(v65, 1);

        if (v66)
        {
          v68 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v67);
          v69 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v68, 1, "%s%.30s:%-4d %@: source-resume: NexusVIInput", ", "NRLinkResumeNexusVIInputSource", 846, v69);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusVIOutputRing + 7));
      v18 = *(NSObject **)((char *)&self->_nexusVIOutputRing + 7);
    }
    dispatch_source_cancel(v18);
    v19 = *(channel_ring_desc **)((char *)&self->_nexusVIOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusVIOutputRing + 7) = 0;

  }
  v20 = *(NSObject **)((char *)&self->_dNexusVIInputSource + 7);
  if (v20)
  {
    if (self->_dNexusVIOutputSourceSuspended)
    {
      self->_dNexusVIOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusVIInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        v70 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v71 = _NRLogIsLevelEnabled(v70, 1);

        if (v71)
        {
          v73 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v72);
          v74 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v73, 1, "%s%.30s:%-4d %@: source-resume: NexusVIOutput", ", "NRLinkResumeNexusVIOutputSource", 847, v74);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusVIInputSource + 7));
      v20 = *(NSObject **)((char *)&self->_dNexusVIInputSource + 7);
    }
    dispatch_source_cancel(v20);
    v21 = *(OS_dispatch_source **)((char *)&self->_dNexusVIInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusVIInputSource + 7) = 0;

  }
  v22 = *(uint64_t *)((char *)&self->_nexusVIGroup + 7);
  if (v22)
  {
    if (!*(unint64_t *)((char *)&self->_bytesToNexusVO + 7))
      os_channel_destroy(v22);
    *(OS_dispatch_group **)((char *)&self->_nexusVIGroup + 7) = 0;
  }
  *(channel **)((char *)&self->_nexusVIChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_nexusVIInputRing + 7) = 0;
  v23 = *(NSObject **)((char *)&self->_nexusVOOutputRing + 7);
  if (v23)
  {
    if (self->_dNexusVOInputSourceSuspended)
    {
      self->_dNexusVOInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusVOOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        v75 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v76 = _NRLogIsLevelEnabled(v75, 1);

        if (v76)
        {
          v78 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v77);
          v79 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v78, 1, "%s%.30s:%-4d %@: source-resume: NexusVOInput", ", "NRLinkResumeNexusVOInputSource", 844, v79);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusVOOutputRing + 7));
      v23 = *(NSObject **)((char *)&self->_nexusVOOutputRing + 7);
    }
    dispatch_source_cancel(v23);
    v24 = *(channel_ring_desc **)((char *)&self->_nexusVOOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusVOOutputRing + 7) = 0;

  }
  v25 = *(NSObject **)((char *)&self->_dNexusVOInputSource + 7);
  if (v25)
  {
    if (self->_dNexusVOOutputSourceSuspended)
    {
      self->_dNexusVOOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusVOInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        v80 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v81 = _NRLogIsLevelEnabled(v80, 1);

        if (v81)
        {
          v83 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v82);
          v84 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v83, 1, "%s%.30s:%-4d %@: source-resume: NexusVOOutput", ", "NRLinkResumeNexusVOOutputSource", 845, v84);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusVOInputSource + 7));
      v25 = *(NSObject **)((char *)&self->_dNexusVOInputSource + 7);
    }
    dispatch_source_cancel(v25);
    v26 = *(OS_dispatch_source **)((char *)&self->_dNexusVOInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusVOInputSource + 7) = 0;

  }
  v27 = *(uint64_t *)((char *)&self->_nexusVOGroup + 7);
  if (v27)
  {
    if (!*(unint64_t *)((char *)&self->_bytesToNexus + 7))
      os_channel_destroy(v27);
    *(OS_dispatch_group **)((char *)&self->_nexusVOGroup + 7) = 0;
  }
  *(channel **)((char *)&self->_nexusVOChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_nexusVOInputRing + 7) = 0;
  v28 = *(NSObject **)((char *)&self->_nexusBKOutputRing + 7);
  if (v28)
  {
    if (self->_dNexusBKInputSourceSuspended)
    {
      self->_dNexusBKInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusBKOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        v85 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v86 = _NRLogIsLevelEnabled(v85, 1);

        if (v86)
        {
          v88 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v87);
          v89 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v88, 1, "%s%.30s:%-4d %@: source-resume: NexusBKInput", ", "NRLinkResumeNexusBKInputSource", 848, v89);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusBKOutputRing + 7));
      v28 = *(NSObject **)((char *)&self->_nexusBKOutputRing + 7);
    }
    dispatch_source_cancel(v28);
    v29 = *(channel_ring_desc **)((char *)&self->_nexusBKOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusBKOutputRing + 7) = 0;

  }
  v30 = *(NSObject **)((char *)&self->_dNexusBKInputSource + 7);
  if (v30)
  {
    if (self->_dNexusBKOutputSourceSuspended)
    {
      self->_dNexusBKOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusBKInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        v90 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v91 = _NRLogIsLevelEnabled(v90, 1);

        if (v91)
        {
          v93 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v92);
          v94 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v93, 1, "%s%.30s:%-4d %@: source-resume: NexusBKOutput", ", "NRLinkResumeNexusBKOutputSource", 849, v94);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusBKInputSource + 7));
      v30 = *(NSObject **)((char *)&self->_dNexusBKInputSource + 7);
    }
    dispatch_source_cancel(v30);
    v31 = *(OS_dispatch_source **)((char *)&self->_dNexusBKInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusBKInputSource + 7) = 0;

  }
  v32 = *(uint64_t *)((char *)&self->_nexusBKGroup + 7);
  if (v32)
  {
    if (!*(unint64_t *)((char *)&self->_bytesToNexusVI + 7))
      os_channel_destroy(v32);
    *(OS_dispatch_group **)((char *)&self->_nexusBKGroup + 7) = 0;
  }
  *(channel **)((char *)&self->_nexusBKChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_nexusBKInputRing + 7) = 0;
  v33 = *(NSObject **)((char *)&self->_linkOutputRing + 7);
  if (v33)
  {
    if (self->_dLinkInputSourceSuspended)
    {
      self->_dLinkInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dLinkOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        v95 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v96 = _NRLogIsLevelEnabled(v95, 1);

        if (v96)
        {
          v98 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v97);
          v99 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v98, 1, "%s%.30s:%-4d %@: source-resume: LinkInput", ", "NRLinkResumeLinkInputSource", 822, v99);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_linkOutputRing + 7));
      v33 = *(NSObject **)((char *)&self->_linkOutputRing + 7);
    }
    dispatch_source_cancel(v33);
    v34 = *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7) = 0;

  }
  v35 = *(NSObject **)((char *)&self->_dLinkInputSource + 7);
  if (v35)
  {
    if (self->_dLinkOutputSourceSuspended)
    {
      self->_dLinkOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dLinkInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        v100 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v101 = _NRLogIsLevelEnabled(v100, 1);

        if (v101)
        {
          v103 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v102);
          v104 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v103, 1, "%s%.30s:%-4d %@: source-resume: LinkOutput", ", "NRLinkResumeLinkOutputSource", 823, v104);

        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dLinkInputSource + 7));
      v35 = *(NSObject **)((char *)&self->_dLinkInputSource + 7);
    }
    dispatch_source_cancel(v35);
    v36 = *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7) = 0;

  }
  v37 = *(NSObject **)((char *)&self->_lastWrittenUrgentLink + 7);
  if (v37)
  {
    dispatch_source_cancel(v37);
    v38 = *(NSDate **)((char *)&self->_lastWrittenUrgentLink + 7);
    *(NSDate **)((char *)&self->_lastWrittenUrgentLink + 7) = 0;

  }
  *(unint64_t *)((char *)&self->_writeCounter + 7) = 0;
  *(channel **)((char *)&self->_linkChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_linkInputRing + 7) = 0;
  v39 = *(void **)((char *)&self->_linkLogToken + 7);
  if (v39)
  {
    free(v39);
    *(unint64_t *)((char *)&self->_linkLogToken + 7) = 0;
  }
  v40 = *(void **)((char *)&self->_ntlLogToken + 7);
  if (v40)
  {
    free(v40);
    *(unint64_t *)((char *)&self->_ntlLogToken + 7) = 0;
  }
  -[NRLink setVirtualInterface:](self, "setVirtualInterface:", 0);
  v41 = *(NSMutableData **)((char *)&self->_linkOutgoingData + 7);
  if (v41)
  {
    objc_msgSend(v41, "setAvailability:", 0);
    objc_msgSend(*(id *)((char *)&self->_linkOutgoingData + 7), "cancel");
    v42 = *(NSMutableData **)((char *)&self->_linkOutgoingData + 7);
    *(NSMutableData **)((char *)&self->_linkOutgoingData + 7) = 0;

  }
  v43 = *(NEIPsecNexus **)((char *)&self->_dummyPacketNexus + 7);
  *(NEIPsecNexus **)((char *)&self->_dummyPacketNexus + 7) = 0;

  v44 = *(NSUUID **)((char *)&self->_bluetoothUUID + 7);
  *(NSUUID **)((char *)&self->_bluetoothUUID + 7) = 0;

  sub_1000802A0((uint64_t)self, 0);
  sub_1000812F0((char *)self, 0);
  -[NRLinkBluetooth invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4);
  -[NRLinkBluetooth invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3);
  -[NRLinkBluetooth invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 1);
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", (char *)&self->_ikeSessionClassA + 7);
  v46 = *(NSMutableArray **)((char *)&self->_latencyContexts + 7);
  if (v46)
  {
    objc_msgSend(v46, "cancel");
    v47 = *(NSMutableArray **)((char *)&self->_latencyContexts + 7);
    *(NSMutableArray **)((char *)&self->_latencyContexts + 7) = 0;

  }
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_10005DA9C((uint64_t)companionProxyAgent, v45);
    v49 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0;

  }
  v50 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v45);
  v51 = _NRLogIsLevelEnabled(v50, 0);

  if (v51)
  {
    v53 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v52);
    v54 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v53, 0, "%s%.30s:%-4d %@: Invalidated", ", "-[NRLinkBluetooth invalidateLink]", 1634, v54);

  }
}

- (void)refreshCompanionProxyAgent
{
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  id v6;
  id v7;

  if (self->super._state == 255)
  {
    v3 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1);

    if (IsLevelEnabled)
    {
      v7 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
      v6 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v7, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'refreshCompanionProxyAgent'", ", "-[NRLinkBluetooth refreshCompanionProxyAgent]", 1640, v6);

    }
  }
  else
  {
    sub_10005F064((uint64_t)self->super._companionProxyAgent, (uint64_t)a2);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("hostState")) & 1) != 0)
  {
    v10 = v9;
    if (qword_1001E46D8 != -1)
      dispatch_once(&qword_1001E46D8, &stru_1001B6D98);
    if (_NRLogIsLevelEnabled(qword_1001E46D0, 2))
    {
      if (qword_1001E46D8 != -1)
        dispatch_once(&qword_1001E46D8, &stru_1001B6D98);
      v11 = (id)qword_1001E46D0;
      v12 = objc_msgSend(v10, "hostState");
      if ((unint64_t)v12 >= 3)
        v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown(%lld)"), v12);
      else
        v13 = (id)*((_QWORD *)&off_1001B6DB8 + (_QWORD)v12);
      _NRLogWithArgs(v11, 2, "%s%.30s:%-4d Got notification for keyPath: %@, %@ (%@)", ", "-[NRLinkBluetooth observeValueForKeyPath:ofObject:change:context:]", 1659, v8, v10, v13);

    }
    v14 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100080188;
    block[3] = &unk_1001B8778;
    block[4] = self;
    v17 = v10;
    v15 = v10;
    dispatch_async(v14, block);

  }
  else
  {
    if (qword_1001E46D8 != -1)
      dispatch_once(&qword_1001E46D8, &stru_1001B6D98);
    if (_NRLogIsLevelEnabled(qword_1001E46D0, 17))
    {
      if (qword_1001E46D8 != -1)
        dispatch_once(&qword_1001E46D8, &stru_1001B6D98);
      _NRLogWithArgs(qword_1001E46D0, 17, "Unexpected KVO notification for keyPath: %@", v8);
    }
  }

}

- (unsigned)metric
{
  return 10;
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int IsLevelEnabled;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v40;
  int v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t *v48;
  _BYTE v49[128];
  uint64_t v50;

  v4 = a3;
  if (v4)
  {
    v48 = &v50;
    v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v50);
    if (-[NRLink changeStateTo:details:](self, "changeStateTo:details:", 255, v5))
    {
      if (self)
      {
        v7 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v7)
        {
          *(_QWORD *)(v7 + 24) = *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7)
                               + *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP_ECT0 + 7);
          v7 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        }
        if (v7)
        {
          *(_QWORD *)(v7 + 80) = *(unint64_t *)((char *)&self->_packetsToNexusBK + 7)
                               + *(unint64_t *)((char *)&self->_packetsToNexus + 7)
                               + *(unint64_t *)((char *)&self->_packetsToNexusVI + 7)
                               + *(unint64_t *)((char *)&self->_packetsToNexusVO + 7);
          v8 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
          if (v8)
            *(_QWORD *)(v8 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexusBK + 7)
                                 + *(unint64_t *)((char *)&self->_bytesFromNexus + 7)
                                 + *(unint64_t *)((char *)&self->_bytesFromNexusVI + 7)
                                 + *(unint64_t *)((char *)&self->_bytesFromNexusVO + 7);
        }
        -[NRLink linkTotalReadyTimeInSec](self, "linkTotalReadyTimeInSec");
        v10 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v10)
          *(_QWORD *)(v10 + 16) = v9;
      }
      else
      {
        objc_msgSend(0, "linkTotalReadyTimeInSec");
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      objc_msgSend(v11, "linkIsUnavailable:", self);

      v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
      IsLevelEnabled = _NRLogIsLevelEnabled(v13, 16);

      if (IsLevelEnabled)
      {
        v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
        v17 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v16, 16, "%s%.30s:%-4d %@: Cancelling due to %@, dumping last status:", ", "-[NRLinkBluetooth cancelWithReason:]", 1714, v17, v5);

      }
      v43 = v5;
      v42 = -[NRLinkBluetooth copyStatusString](self, "copyStatusString");
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "componentsSeparatedByString:", CFSTR("\n")));
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v19)
      {
        v21 = v19;
        v22 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v22)
              objc_enumerationMutation(v18);
            v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            v25 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
            v26 = _NRLogIsLevelEnabled(v25, 16);

            if (v26)
            {
              v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
              v28 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs(v27, 16, "%s%.30s:%-4d %@: %@", ", "-[NRLinkBluetooth cancelWithReason:]", 1718, v28, v24);

            }
          }
          v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v21);
      }
      -[NRLinkBluetooth invalidateLink](self, "invalidateLink");
      objc_msgSend(*(id *)((char *)&self->_counterForDataStallRemediation + 7), "submit");
      v34 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v33);
      v35 = _NRLogIsLevelEnabled(v34, 1);

      if (v35)
      {
        v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
        v38 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v37, 1, "%s%.30s:%-4d %@: Done cancelling", ", "-[NRLinkBluetooth cancelWithReason:]", 1724, v38);

      }
      v5 = v43;
      v32 = v42;
      goto LABEL_27;
    }
    v29 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    v30 = _NRLogIsLevelEnabled(v29, 0);

    if (v30)
    {
      v32 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
      v18 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v32, 0, "%s%.30s:%-4d %@: link already cancelled", ", "-[NRLinkBluetooth cancelWithReason:]", 1700, v18);
LABEL_27:

    }
  }
  else
  {
    v40 = sub_100070AC8();
    v41 = _NRLogIsLevelEnabled(v40, 17);

    if (!v41)
      goto LABEL_29;
    v5 = sub_100070AC8();
    _NRLogWithArgs(v5, 17, "%s called with null reasonFormat", "-[NRLinkBluetooth cancelWithReason:]");
  }

LABEL_29:
  return v4 != 0;
}

- (BOOL)suspend
{
  uint64_t v3;
  NRCompanionProxyAgent *companionProxyAgent;
  void *v5;
  int IsLevelEnabled;
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NRLinkBluetooth;
  -[NRLink suspend](&v20, "suspend");
  if (self->super._state != 255)
  {
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if ((sub_10005DA9C((uint64_t)companionProxyAgent, v3) & 1) == 0)
      {
        v5 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
        IsLevelEnabled = _NRLogIsLevelEnabled(v5, 16);

        if (IsLevelEnabled)
        {
          v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
          v8 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v7, 16, "%s%.30s:%-4d %@: failed to unregister companion agent", ", "-[NRLinkBluetooth suspend]", 1759, v8);

        }
      }
    }
    if (*(unsigned int *)((char *)&self->_handledUrgentLinkWriteBufferBytes + 3))
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
      v10 = _NRLogIsLevelEnabled(v9, 1);

      if (v10)
      {
        v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v11);
        v13 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v12, 1, "%s%.30s:%-4d %@: Will suspend the link once all the control data is sent", ", "-[NRLinkBluetooth suspend]", 1767, v13);

      }
      self->_shouldSuspend = 1;
    }
    else
    {
      sub_10007FD08((uint64_t)self, 1);
    }
    -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 9, CFSTR("(suspend)"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    objc_msgSend(v17, "linkIsSuspended:", self);
    goto LABEL_14;
  }
  v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
  v15 = _NRLogIsLevelEnabled(v14, 1);

  if (v15)
  {
    v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
    v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v17, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'", ", "-[NRLinkBluetooth suspend]", 1753, v18);

LABEL_14:
  }
  return 1;
}

- (BOOL)resume
{
  uint64_t v3;
  NRCompanionProxyAgent *companionProxyAgent;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  int IsLevelEnabled;
  uint64_t v15;
  void *v16;
  id v17;
  objc_super v19;

  if (self->super._state == 255)
  {
    v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    v12 = 1;
    IsLevelEnabled = _NRLogIsLevelEnabled(v13, 1);

    if (IsLevelEnabled)
    {
      v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
      v17 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v16, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'", ", "-[NRLinkBluetooth resume]", 1781, v17);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NRLinkBluetooth;
    if (-[NRLink resume](&v19, "resume"))
    {
      companionProxyAgent = self->super._companionProxyAgent;
      if (companionProxyAgent)
      {
        if ((sub_10005E5B8((uint64_t)companionProxyAgent, v3) & 1) == 0)
        {
          v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
          v7 = _NRLogIsLevelEnabled(v6, 16);

          if (v7)
          {
            v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
            v10 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v9, 16, "%s%.30s:%-4d %@: failed to register companion agent", ", "-[NRLinkBluetooth resume]", 1792, v10);

          }
        }
      }
      -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 8, CFSTR("(resume)"));
      sub_10007FD08((uint64_t)self, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      objc_msgSend(v11, "linkIsReady:", self);

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v12;
}

- (void)checkProxyAgentWithForceUpdate:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  NRCompanionProxyAgent *companionProxyAgent;
  void *v9;
  NRCompanionProxyAgent *v10;
  void *v11;
  NRCompanionProxyAgent *v12;
  NRCompanionProxyAgent *v13;
  void *v14;
  int IsLevelEnabled;
  void *v16;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NRLinkBluetooth;
  -[NRLink checkProxyAgentWithForceUpdate:](&v18, "checkProxyAgentWithForceUpdate:", a3);
  v4 = objc_claimAutoreleasedReturnValue(-[NRLink proxyAgentRegistration](self, "proxyAgentRegistration"));
  if (v4)
  {
    v6 = (void *)v4;
    v7 = -[NRLink state](self, "state");

    if (v7 == 8)
    {
      if (-[NRLink shouldCreateCompanionProxyAgent](self, "shouldCreateCompanionProxyAgent"))
      {
        companionProxyAgent = self->super._companionProxyAgent;
        if (!companionProxyAgent)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_linkOutgoingData + 7), "interfaceName"));
          if (v9 && *(CBScalablePipe **)((char *)&self->_pipe + 7))
          {
            v10 = [NRCompanionProxyAgent alloc];
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
            v12 = (NRCompanionProxyAgent *)sub_10005E2AC((id *)&v10->super.isa, v11, v9, *(void **)((char *)&self->_pipe + 7), self->super._nrUUID);
            v13 = self->super._companionProxyAgent;
            self->super._companionProxyAgent = v12;

            -[NRLink reportEvent:](self, "reportEvent:", 12001);
          }

          companionProxyAgent = self->super._companionProxyAgent;
        }
        if ((sub_10005E5B8((uint64_t)companionProxyAgent, v5) & 1) == 0)
        {
          v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
          IsLevelEnabled = _NRLogIsLevelEnabled(v14, 16);

          if (IsLevelEnabled)
          {
            v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
            v17 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v16, 16, "%s%.30s:%-4d %@: failed to register companion agent", ", "-[NRLinkBluetooth checkProxyAgentWithForceUpdate:]", 5827, v17);

          }
        }
      }
    }
  }
  sub_10007FE04((uint64_t)self, v5);
}

- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  void *v10;
  id v11;
  void (**v12)(id, _QWORD);

  v12 = (void (**)(id, _QWORD))a5;
  v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  IsLevelEnabled = _NRLogIsLevelEnabled(v7, 1);

  if (IsLevelEnabled)
  {
    v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
    v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@: oh boy got a flow", ", "-[NRLinkBluetooth acceptNewFlow:fromNexus:completionHandler:]", 7171, v11);

  }
  v12[2](v12, 0);

}

- (BOOL)sendControlData:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  int v12;
  id v13;
  id v14;
  int IsLevelEnabled;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  id v20;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NEIKEv2PrivateNotify), "initWithNotifyStatus:notifyData:", 50702, v4);
    v6 = v5 != 0;
    if (v5)
    {
      if (self)
        ++*(unsigned int *)((char *)&self->_handledUrgentLinkWriteBufferBytes + 3);
      objc_initWeak(&location, self);
      v7 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
      v20 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10007FB20;
      v17[3] = &unk_1001B7978;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v7, "sendPrivateNotifies:maxRetries:retryIntervalInMilliseconds:callbackQueue:callback:", v8, 10, 10000, v9, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = sub_100070AC8();
      IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17);

      if (IsLevelEnabled)
      {
        v16 = sub_100070AC8();
        _NRLogWithArgs(v16, 17, "NEIKEv2PrivateNotify init %u %@ failed", 50702, v4);

      }
    }

  }
  else
  {
    v11 = sub_100070AC8();
    v12 = _NRLogIsLevelEnabled(v11, 17);

    if (v12)
    {
      v13 = sub_100070AC8();
      _NRLogWithArgs(v13, 17, "%s called with null data", "-[NRLinkBluetooth sendControlData:]");

    }
    v6 = 0;
  }

  return v6;
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  __objc2_prot *v36;
  __objc2_prot *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  __objc2_meth_list *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  NRLinkBluetooth *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  unsigned int v64;
  id v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  void **v70;
  uint64_t v71;
  void *v72;
  id v73;
  unsigned int v74;
  void **v75;
  char v76;
  int v77;
  int v78;
  NSUUID *nrUUID;
  NSUUID *v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  id v85;
  NSUUID *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  char *v98;
  id v99;
  NEVirtualInterface_s *virtualInterface;
  void *v101;
  id v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  id v107;
  id v108;
  char *v109;
  _QWORD *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  int v115;
  id v116;
  void *v117;
  id v118;
  unsigned int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  id v124;
  id v125;
  id v126;
  int v127;
  id v128;
  void *v129;
  int v130;
  uint64_t v131;
  void *v132;
  id v133;
  void *v134;
  int v135;
  uint64_t v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  int IsLevelEnabled;
  id v142;
  id v143;
  int v144;
  id v145;
  int v146;
  id v147;
  int v148;
  id v149;
  int v150;
  int v151;
  id v152;
  id v153;
  unsigned __int8 v154;
  void *v155;
  void *v156;
  void *v157;
  _QWORD v158[5];
  id v159;
  id v160;
  id v161;
  void (**v162)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v163[5];
  id v164;
  id v165;
  void (**v166)(_QWORD, _QWORD, _QWORD, _QWORD);

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v19;
  if (!v14)
  {
    v140 = sub_100070AC8();
    IsLevelEnabled = _NRLogIsLevelEnabled(v140, 17);

    if (!IsLevelEnabled)
      goto LABEL_36;
    v142 = sub_100070AC8();
    _NRLogWithArgs(v142, 17, "%s called with null listener");
LABEL_109:

    goto LABEL_36;
  }
  if (!v15)
  {
    v143 = sub_100070AC8();
    v144 = _NRLogIsLevelEnabled(v143, 17);

    if (!v144)
      goto LABEL_36;
    v142 = sub_100070AC8();
    _NRLogWithArgs(v142, 17, "%s called with null session");
    goto LABEL_109;
  }
  if (!v16)
  {
    v145 = sub_100070AC8();
    v146 = _NRLogIsLevelEnabled(v145, 17);

    if (!v146)
      goto LABEL_36;
    v142 = sub_100070AC8();
    _NRLogWithArgs(v142, 17, "%s called with null sessionConfig");
    goto LABEL_109;
  }
  if (!v18)
  {
    v147 = sub_100070AC8();
    v148 = _NRLogIsLevelEnabled(v147, 17);

    if (!v148)
      goto LABEL_36;
    v142 = sub_100070AC8();
    _NRLogWithArgs(v142, 17, "%s called with null validateAuthBlock");
    goto LABEL_109;
  }
  if (!v19)
  {
    v149 = sub_100070AC8();
    v150 = _NRLogIsLevelEnabled(v149, 17);

    if (!v150)
      goto LABEL_36;
    v142 = sub_100070AC8();
    _NRLogWithArgs(v142, 17, "%s called with null responseBlock");
    goto LABEL_109;
  }
  v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
  v23 = _NRLogIsLevelEnabled(v22, 0);

  if (v23)
  {
    v25 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
    v26 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v25, 0, "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@", ", "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 9214, v26, v14, v15, v16, v17);

  }
  if (self->super._state == 255)
    goto LABEL_33;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  v28 = objc_msgSend(v27, "identifierType");

  if (v28 != (id)11)
  {
    v52 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v29);
    v53 = _NRLogIsLevelEnabled(v52, 16);

    if (v53)
    {
      v55 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v54);
      v56 = -[NRLink copyDescription](self, "copyDescription");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
      _NRLogWithArgs(v55, 16, "%s%.30s:%-4d %@: Local identifier has wrong type %zu", ", "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 9228, v56, objc_msgSend(v57, "identifierType"));
LABEL_32:

    }
LABEL_33:
    v61 = 0;
    goto LABEL_34;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
  v31 = objc_msgSend(v30, "identifierType");

  if (v31 != (id)11)
  {
    v58 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v32);
    v59 = _NRLogIsLevelEnabled(v58, 16);

    if (v59)
    {
      v55 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v60);
      v56 = -[NRLink copyDescription](self, "copyDescription");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
      _NRLogWithArgs(v55, 16, "%s%.30s:%-4d %@: Remote identifier has wrong type %zu", ", "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 9232, v56, objc_msgSend(v57, "identifierType"));
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v157 = v17;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
  v35 = objc_msgSend(v33, "isEqual:", v34);

  v36 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  v156 = v18;
  v37 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if ((v35 & 1) != 0)
    goto LABEL_20;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  if (qword_1001E4920 != -1)
    dispatch_once(&qword_1001E4920, &stru_1001B7D88);
  v39 = (id)qword_1001E4918;
  if ((objc_msgSend(v38, "isEqual:", v39) & 1) != 0)
    goto LABEL_19;
  v155 = v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  if (qword_1001E4930 != -1)
    dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
  v41 = (id)qword_1001E4928;
  if ((objc_msgSend(v40, "isEqual:", v41) & 1) != 0)
  {

    v38 = v155;
LABEL_19:

    v36 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
    goto LABEL_20;
  }
  v153 = v14;
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  v88 = sub_100111A10();
  v154 = objc_msgSend(v87, "isEqual:", v88);

  v37 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  v14 = v153;

  v36 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if ((v154 & 1) == 0)
  {
    v90 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v89);
    v91 = _NRLogIsLevelEnabled(v90, 16);

    if (v91)
    {
      v93 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v92);
      v94 = -[NRLink copyDescription](self, "copyDescription");
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
      _NRLogWithArgs(v93, 16, "%s%.30s:%-4d %@: Local identifier %@ does not match remote identifier %@", ", "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 9242, v94, v95, v96);

    }
    goto LABEL_71;
  }
LABEL_20:
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  if (v37[32].class_meths != (__objc2_meth_list *)-1)
    dispatch_once(&qword_1001E4920, &stru_1001B7D88);
  v17 = v157;
  v43 = v36[32].inst_meths;
  v44 = objc_msgSend(v42, "isEqual:", v43);

  if (v44)
  {
    v18 = v156;
    if (v157)
    {
      v45 = mach_absolute_time();
      v46 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
      if (v46)
      {
        *(_QWORD *)(v46 + 48) = v45;
        v47 = *(id *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v47)
          ++v47[9];
      }
      else
      {
        v47 = 0;
      }

      v48 = self;
      v49 = v15;
      v50 = v16;
      v51 = 4;
      goto LABEL_58;
    }
    -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassD %@"), v15);
LABEL_112:
    v61 = 0;
    goto LABEL_34;
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  if (qword_1001E4930 != -1)
    dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
  v63 = (id)qword_1001E4928;
  v64 = objc_msgSend(v62, "isEqual:", v63);

  if (!v64)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    if (qword_1001E4940 != -1)
      dispatch_once(&qword_1001E4940, &stru_1001B7DC8);
    v73 = (id)qword_1001E4938;
    v74 = objc_msgSend(v72, "isEqual:", v73);

    if (!v74)
    {
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
      v102 = sub_100111AF8();
      v103 = objc_msgSend(v101, "isEqual:", v102);

      if (v103)
      {
        v104 = mach_absolute_time();
        v105 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v105)
        {
          *(_QWORD *)(v105 + 112) = v104;
          v106 = *(id *)((char *)&self->_counterForDataStallRemediation + 7);
          if (v106)
            ++v106[13];
        }
        else
        {
          v106 = 0;
        }

        objc_storeStrong((id *)((char *)&self->_ikeSessionClassA + 7), a4);
        sub_1000757B4((uint64_t)self);
        v107 = objc_msgSend(objc_alloc((Class)NEIKEv2AuthenticationProtocol), "initWithMethod:", 2);
        v108 = sub_100111AF8();
        v61 = sub_10011268C(0, v108, v107);

        v109 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->super._nrUUID);
        v110 = sub_10013159C(v109);
        v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
        objc_msgSend(v61, "setSharedSecret:", v111);

        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "sharedSecret"));
        v113 = sub_100070AC8();
        v114 = v113;
        if (!v112)
        {
          v151 = _NRLogIsLevelEnabled(v113, 17);

          if (v151)
          {
            v152 = sub_100070AC8();
            _NRLogWithArgs(v152, 17, "Missing out of band key for %@, %@", v109, self);

          }
          goto LABEL_72;
        }
        v115 = _NRLogIsLevelEnabled(v113, 0);

        if (v115)
        {
          v116 = sub_100070AC8();
          _NRLogWithArgs(v116, 0, "%s%.30s:%-4d Receiving session for pairing with OOBK", ", "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 9304);

        }
        v78 = 0;
        v76 = 1;
        v77 = 1;
      }
      else
      {
        v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
        v118 = sub_100111A84();
        v119 = objc_msgSend(v117, "isEqual:", v118);

        if (!v119)
        {
          v134 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v120);
          v135 = _NRLogIsLevelEnabled(v134, 16);

          if (v135)
          {
            v137 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v136);
            v138 = -[NRLink copyDescription](self, "copyDescription");
            v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
            _NRLogWithArgs(v137, 16, "%s%.30s:%-4d %@: Unrecognized IKEv2 identifier %@", ", "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 9319, v138, v139);

          }
          v61 = 0;
          v18 = v156;
          goto LABEL_34;
        }
        v121 = mach_absolute_time();
        v122 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v122)
        {
          *(_QWORD *)(v122 + 112) = v121;
          v123 = *(id *)((char *)&self->_counterForDataStallRemediation + 7);
          if (v123)
            ++v123[13];
        }
        else
        {
          v123 = 0;
        }

        objc_storeStrong((id *)((char *)&self->_ikeSessionClassA + 7), a4);
        sub_1000757B4((uint64_t)self);
        v124 = objc_msgSend(objc_alloc((Class)NEIKEv2AuthenticationProtocol), "initWithNonStandardDigitalSignature:", 2);
        v125 = sub_100111A84();
        v61 = sub_10011268C(0, v125, v124);

        v126 = sub_100070AC8();
        v127 = _NRLogIsLevelEnabled(v126, 0);

        if (v127)
        {
          v128 = sub_100070AC8();
          _NRLogWithArgs(v128, 0, "%s%.30s:%-4d Receiving session for pairing from IDS", ", "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 9317);

        }
        v77 = 0;
        v76 = 1;
        v78 = 1;
      }
      v18 = v156;
      if (self->super._virtualInterface)
        goto LABEL_60;
      goto LABEL_94;
    }
    if (v157)
    {
      v48 = self;
      v49 = v15;
      v50 = v16;
      v51 = 1;
      v18 = v156;
LABEL_58:
      v75 = sub_100074FEC((void **)&v48->super.super.isa, v49, v50, v51, v18);
      v61 = (id)objc_claimAutoreleasedReturnValue(v75);
      goto LABEL_59;
    }
    -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassA %@"), v15);
LABEL_71:
    v61 = 0;
LABEL_72:
    v18 = v156;
    v17 = v157;
    goto LABEL_34;
  }
  v18 = v156;
  if (!v157)
  {
    -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassC %@"), v15);
    goto LABEL_112;
  }
  objc_opt_self(NRDKeyManager);
  if (qword_1001E4AD8 != -1)
    dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
  v65 = (id)qword_1001E4AD0;
  v66 = v65;
  if (!v65)
    goto LABEL_83;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v65 + 2));
  if (!v66[10])
  {
    v66[10] = 1;
    if (v66[8] == 4)
    {
      sub_10014A63C((uint64_t)v66);
      if (v66[9])
      {
        v66[8] = 3;
        sub_10014A8AC((uint64_t)v66);
      }
    }
  }
  if ((v66[8] & 0xFD) != 1)
  {
LABEL_83:
    -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3020, CFSTR("ClassC %@"), v15);

    v61 = 0;
    goto LABEL_34;
  }
  v67 = mach_absolute_time();
  v68 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
  if (v68)
  {
    *(_QWORD *)(v68 + 32) = v67;
    v69 = *(id *)((char *)&self->_counterForDataStallRemediation + 7);
    if (v69)
      ++v69[8];
  }
  else
  {
    v69 = 0;
  }

  v70 = sub_100074FEC((void **)&self->super.super.isa, v15, v16, 3, v156);
  v61 = (id)objc_claimAutoreleasedReturnValue(v70);

LABEL_59:
  v76 = 0;
  v77 = 0;
  v78 = 0;
  if (!self->super._virtualInterface)
  {
LABEL_94:
    v129 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v71);
    v130 = _NRLogIsLevelEnabled(v129, 17);

    if (v130)
    {
      v132 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v131);
      v133 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v132, 17, "%@: virtualInterface is NULL", v133);

    }
    goto LABEL_72;
  }
LABEL_60:
  if (v61)
  {
    if (v77)
    {
      nrUUID = self->super._nrUUID;
      v163[0] = _NSConcreteStackBlock;
      v163[1] = 3221225472;
      v163[2] = sub_100075C30;
      v163[3] = &unk_1001B6D50;
      v163[4] = self;
      v61 = v61;
      v164 = v61;
      v166 = v21;
      v17 = v157;
      v165 = v157;
      v80 = nrUUID;
      v18 = v156;
      sub_1001385D4((uint64_t)NRDLocalDevice, v80, 1, v163);

    }
    else if (v78)
    {
      v81 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v71);
      v82 = _NRLogIsLevelEnabled(v81, 0);

      if (v82)
      {
        v84 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v83);
        v85 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v84, 0, "%s%.30s:%-4d %@: Responder %@ querying IDS keys for pairing", ", "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 9388, v85, v15);

      }
      v86 = self->super._nrUUID;
      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472;
      v158[2] = sub_100075F88;
      v158[3] = &unk_1001B6D78;
      v158[4] = self;
      v162 = v21;
      v159 = v15;
      v61 = v61;
      v160 = v61;
      v17 = v157;
      v161 = v157;
      sub_1001390B8((uint64_t)NRDLocalDevice, v86, 4, v158);

      v18 = v156;
    }
    else
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
      v98 = sub_10012FFF4((uint64_t)NRDLocalDevice, v97);

      v99 = sub_100112420();
      objc_msgSend(v99, "setSequencePerTrafficClass:", 1);
      objc_msgSend(v99, "setReplayWindowSize:", 16);
      if ((v76 & 1) != 0)
        virtualInterface = 0;
      else
        virtualInterface = self->super._virtualInterface;
      v18 = v156;
      ((void (**)(_QWORD, id, id, NEVirtualInterface_s *))v21)[2](v21, v61, v99, virtualInterface);

      v17 = v157;
    }
    goto LABEL_35;
  }
  v17 = v157;
LABEL_34:
  v21[2](v21, 0, 0, 0);
LABEL_35:

LABEL_36:
}

- (BOOL)sendPacketData:(id)a3
{
  uint64_t v4;
  id v5;
  int state;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v19;
  int IsLevelEnabled;
  id v21;

  v5 = a3;
  if (!v5)
  {
    v19 = sub_100070AC8();
    IsLevelEnabled = _NRLogIsLevelEnabled(v19, 17);

    if (IsLevelEnabled)
    {
      v21 = sub_100070AC8();
      _NRLogWithArgs(v21, 17, "%s called with null data", "-[NRLinkBluetooth sendPacketData:]");

    }
    goto LABEL_8;
  }
  state = self->super._state;
  v7 = _NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
  v8 = (void *)v7;
  if (state == 255)
  {
    v14 = _NRLogIsLevelEnabled(v7, 16);

    if (v14)
    {
      v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
      v17 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v16, 16, "%s%.30s:%-4d %@: Asked to send IKEv2 data but cancelled", ", "-[NRLinkBluetooth sendPacketData:]", 9471, v17);

    }
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v9 = _NRLogIsLevelEnabled(v7, 0);

  if (v9)
  {
    v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
    v12 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v11, 0, "%s%.30s:%-4d %@: Sending IKEv2 data of length %llu", ", "-[NRLinkBluetooth sendPacketData:]", 9475, v12, objc_msgSend(v5, "length"));

  }
  v13 = sub_100070B38((uint64_t)self, v5);
LABEL_9:

  return v13;
}

- (void)setPacketReceiver:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  id v23;
  int v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a3;
  if (v6)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0);

    if (IsLevelEnabled)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v10, 0, "%s%.30s:%-4d %@: Setting IKEv2 packet receiver", ", "-[NRLinkBluetooth setPacketReceiver:]", 9482, v11);

    }
    objc_storeStrong((id *)((char *)&self->_ikeSessionPairing + 7), a3);
    if (objc_msgSend(*(id *)((char *)&self->_urgentLinkWriteBuffer + 7), "count"))
    {
      v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
      v14 = _NRLogIsLevelEnabled(v13, 1);

      if (v14)
      {
        v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
        v17 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v16, 1, "%s%.30s:%-4d %@: processing %llu previously received IKE packets", ", "-[NRLinkBluetooth setPacketReceiver:]", 9486, v17, objc_msgSend(*(id *)((char *)&self->_urgentLinkWriteBuffer + 7), "count"));

      }
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = *(id *)((char *)&self->_urgentLinkWriteBuffer + 7);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)((char *)&self->_ikeSessionPairing + 7), "receivePacketData:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    objc_msgSend(*(id *)((char *)&self->_urgentLinkWriteBuffer + 7), "removeAllObjects");
  }
  else
  {
    v23 = sub_100070AC8();
    v24 = _NRLogIsLevelEnabled(v23, 17);

    if (v24)
    {
      v25 = sub_100070AC8();
      _NRLogWithArgs(v25, 17, "%s called with null receiver", "-[NRLinkBluetooth setPacketReceiver:]");

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_counterForDataStallRemediation + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastWrittenUrgentLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadUrgentLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastWrittenDatagramLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadDatagramLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastWrittenLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastWrittenNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_recvIKEv2PointToPoint + 7), 0);
  objc_storeStrong((id *)((char *)&self->_randomUUID + 7), 0);
  objc_storeStrong((id *)((char *)&self->_remotePacketProxy + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dummyPacketNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_packetNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_linkOutgoingData + 7), 0);
  objc_storeStrong((id *)((char *)&self->_urgentLinkReadBuffer + 7), 0);
  objc_storeStrong((id *)((char *)&self->_localPublicClassCKeysEncryptedWithIDS + 7), 0);
  objc_storeStrong((id *)((char *)&self->_initiatorLocalPublicClassDKeysEncryptedWithIDS + 7), 0);
  objc_storeStrong((id *)((char *)&self->_initiatorLocalPublicClassAKeys + 7), 0);
  objc_storeStrong((id *)((char *)&self->_initiatorLocalPublicClassCKeys + 7), 0);
  objc_storeStrong((id *)((char *)&self->_initiatorLocalPublicClassDKeys + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikePacketReceiver + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionPairing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassA + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_latencyContexts + 7), 0);
  objc_storeStrong((id *)((char *)&self->_receivedIKEPackets + 7), 0);
  objc_storeStrong((id *)((char *)&self->_urgentLinkWriteBuffer + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dUrgentLinkInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_urgentLinkOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadDatagramLinkOutputActivityCounter + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dDatagramLinkInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_datagramLinkOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadLinkOutputActivityCounter + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dLinkInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_linkOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusBKInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusBKOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_bytesToNexusVI + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusVIInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusVIOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_bytesToNexusVO + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusVOInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusVOOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_bytesToNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusOutputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_sentPrelude + 7), 0);
  objc_storeStrong((id *)((char *)&self->_remoteDeviceName + 7), 0);
  objc_storeStrong((id *)((char *)&self->_pipe + 7), 0);
  objc_storeStrong((id *)((char *)&self->_bluetoothUUID + 7), 0);
  objc_storeStrong((id *)((char *)&self->_handledUrgentLinkReadBufferBytes + 3), 0);
}

@end
