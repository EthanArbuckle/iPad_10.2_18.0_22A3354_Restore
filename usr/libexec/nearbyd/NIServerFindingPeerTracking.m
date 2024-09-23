@implementation NIServerFindingPeerTracking

+ (NIServerFindingPeerTracking)peerTrackingWithDiscoveryState:(int)a3 advertisingState:(int)a4 rangingState:(int)a5 algorithmOutputFlags:(unsigned __int8)a6 receivedSignalFlags:(unsigned __int8)a7 tellClientAboutPeer:(BOOL)a8 clientWantsUpdates:(BOOL)a9 nbUwbAcquisitionChannelIdx:(id)a10
{
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NIServerFindingPeerTracking *v17;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = *(_QWORD *)&a5;
  v14 = *(_QWORD *)&a4;
  v15 = *(_QWORD *)&a3;
  v16 = a10;
  v17 = objc_alloc_init(NIServerFindingPeerTracking);
  -[NIServerFindingPeerTracking setDiscoveryState:](v17, "setDiscoveryState:", v15);
  -[NIServerFindingPeerTracking setAdvertisingState:](v17, "setAdvertisingState:", v14);
  -[NIServerFindingPeerTracking setRangingState:](v17, "setRangingState:", v13);
  -[NIServerFindingPeerTracking setAlgorithmOutputFlags:](v17, "setAlgorithmOutputFlags:", v12);
  -[NIServerFindingPeerTracking setReceivedSignalFlags:](v17, "setReceivedSignalFlags:", v11);
  -[NIServerFindingPeerTracking setTellClientAboutPeer:](v17, "setTellClientAboutPeer:", v10);
  -[NIServerFindingPeerTracking setClientWantsUpdates:](v17, "setClientWantsUpdates:", a9);
  -[NIServerFindingPeerTracking setNbUwbAcquisitionChannelIdx:](v17, "setNbUwbAcquisitionChannelIdx:", v16);

  return v17;
}

+ (id)peerTrackingInitialState
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return +[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:](NIServerFindingPeerTracking, "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:", 0, 0, 0, 0, 0, 0, v3, 0);
}

+ (id)peerTrackingTerminalState
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return +[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:](NIServerFindingPeerTracking, "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:", 4, 2, 4, 0, 0, 0, v3, 0);
}

- (BOOL)isDoingAnything
{
  return (self->_discoveryState - 1) < 3
      || self->_advertisingState == 1
      || (self->_rangingState - 1) < 3;
}

- (BOOL)isAttemptingToRange
{
  return (self->_rangingState - 1) < 3;
}

- (BOOL)hasReceivedRangingData
{
  return (self->_rangingState & 0xFFFFFFFE) == 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  LOBYTE(v4) = self->_clientWantsUpdates;
  return (id)objc_claimAutoreleasedReturnValue(+[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:](NIServerFindingPeerTracking, "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:", self->_discoveryState, self->_advertisingState, self->_rangingState, self->_algorithmOutputFlags, self->_receivedSignalFlags, self->_tellClientAboutPeer, v4, self->_nbUwbAcquisitionChannelIdx));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIServerFindingPeerTracking *v7;
  NIServerFindingPeerTracking *v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  NSNumber *nbUwbAcquisitionChannelIdx;
  void *v14;
  unsigned __int8 v15;
  int discoveryState;
  int advertisingState;
  int rangingState;
  int algorithmOutputFlags;
  int receivedSignalFlags;
  _BOOL4 tellClientAboutPeer;
  _BOOL4 clientWantsUpdates;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIServerFindingPeerTracking *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v10 = 1;
LABEL_22:

      goto LABEL_23;
    }
    if (self->_nbUwbAcquisitionChannelIdx)
    {
      v9 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingPeerTracking nbUwbAcquisitionChannelIdx](v7, "nbUwbAcquisitionChannelIdx"));
      v9 = v11 == 0;

      if (!self->_nbUwbAcquisitionChannelIdx)
      {
        v15 = 0;
LABEL_12:
        discoveryState = self->_discoveryState;
        if (discoveryState == -[NIServerFindingPeerTracking discoveryState](v8, "discoveryState")
          && (advertisingState = self->_advertisingState,
              advertisingState == -[NIServerFindingPeerTracking advertisingState](v8, "advertisingState"))
          && (rangingState = self->_rangingState,
              rangingState == -[NIServerFindingPeerTracking rangingState](v8, "rangingState"))
          && (algorithmOutputFlags = self->_algorithmOutputFlags,
              algorithmOutputFlags == -[NIServerFindingPeerTracking algorithmOutputFlags](v8, "algorithmOutputFlags"))
          && (receivedSignalFlags = self->_receivedSignalFlags,
              receivedSignalFlags == -[NIServerFindingPeerTracking receivedSignalFlags](v8, "receivedSignalFlags"))
          && (tellClientAboutPeer = self->_tellClientAboutPeer,
              tellClientAboutPeer == -[NIServerFindingPeerTracking tellClientAboutPeer](v8, "tellClientAboutPeer")))
        {
          clientWantsUpdates = self->_clientWantsUpdates;
          if (clientWantsUpdates == -[NIServerFindingPeerTracking clientWantsUpdates](v8, "clientWantsUpdates"))
            v10 = v9 | v15;
          else
            v10 = 0;
        }
        else
        {
          v10 = 0;
        }
        goto LABEL_22;
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingPeerTracking nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
    if (v12)
    {
      nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingPeerTracking nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
      v15 = -[NSNumber isEqualToNumber:](nbUwbAcquisitionChannelIdx, "isEqualToNumber:", v14);

    }
    else
    {
      v15 = 0;
    }

    goto LABEL_12;
  }
  v10 = 0;
LABEL_23:

  return v10;
}

- (id)description
{
  id v3;
  uint64_t discoveryState;
  const char *v5;
  uint64_t advertisingState;
  const char *v7;
  uint64_t rangingState;
  const char *v9;
  uint64_t algorithmOutputFlags;
  uint64_t receivedSignalFlags;
  _BOOL8 tellClientAboutPeer;
  _BOOL8 clientWantsUpdates;
  NSNumber *nbUwbAcquisitionChannelIdx;
  std::string *v15;
  id v16;
  std::string v18;

  v3 = objc_alloc((Class)NSMutableString);
  discoveryState = self->_discoveryState;
  if (discoveryState > 4)
    v5 = "Unkn";
  else
    v5 = off_100812EC8[discoveryState];
  advertisingState = self->_advertisingState;
  if (advertisingState > 2)
    v7 = "Unkn ";
  else
    v7 = off_100812EF0[advertisingState];
  rangingState = self->_rangingState;
  if (rangingState > 4)
    v9 = "Unkn ";
  else
    v9 = off_100812F08[rangingState];
  algorithmOutputFlags = self->_algorithmOutputFlags;
  receivedSignalFlags = self->_receivedSignalFlags;
  tellClientAboutPeer = self->_tellClientAboutPeer;
  clientWantsUpdates = self->_clientWantsUpdates;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  if (nbUwbAcquisitionChannelIdx)
  {
    std::to_string(&v18, -[NSNumber intValue](nbUwbAcquisitionChannelIdx, "intValue"));
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &v18;
    else
      v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
  }
  else
  {
    v15 = (std::string *)"---";
  }
  v16 = objc_msgSend(v3, "initWithFormat:", CFSTR("[ D:%s | A:%s | R:%s | G:%02X | S:%02X | N:%d | U:%d | C:%-3s ]"), v5, v7, v9, algorithmOutputFlags, receivedSignalFlags, tellClientAboutPeer, clientWantsUpdates, v15);
  if (nbUwbAcquisitionChannelIdx && SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  return v16;
}

- (int)discoveryState
{
  return self->_discoveryState;
}

- (void)setDiscoveryState:(int)a3
{
  self->_discoveryState = a3;
}

- (int)advertisingState
{
  return self->_advertisingState;
}

- (void)setAdvertisingState:(int)a3
{
  self->_advertisingState = a3;
}

- (int)rangingState
{
  return self->_rangingState;
}

- (void)setRangingState:(int)a3
{
  self->_rangingState = a3;
}

- (unsigned)algorithmOutputFlags
{
  return self->_algorithmOutputFlags;
}

- (void)setAlgorithmOutputFlags:(unsigned __int8)a3
{
  self->_algorithmOutputFlags = a3;
}

- (unsigned)receivedSignalFlags
{
  return self->_receivedSignalFlags;
}

- (void)setReceivedSignalFlags:(unsigned __int8)a3
{
  self->_receivedSignalFlags = a3;
}

- (BOOL)tellClientAboutPeer
{
  return self->_tellClientAboutPeer;
}

- (void)setTellClientAboutPeer:(BOOL)a3
{
  self->_tellClientAboutPeer = a3;
}

- (BOOL)clientWantsUpdates
{
  return self->_clientWantsUpdates;
}

- (void)setClientWantsUpdates:(BOOL)a3
{
  self->_clientWantsUpdates = a3;
}

- (NSNumber)nbUwbAcquisitionChannelIdx
{
  return self->_nbUwbAcquisitionChannelIdx;
}

- (void)setNbUwbAcquisitionChannelIdx:(id)a3
{
  objc_storeStrong((id *)&self->_nbUwbAcquisitionChannelIdx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nbUwbAcquisitionChannelIdx, 0);
}

@end
