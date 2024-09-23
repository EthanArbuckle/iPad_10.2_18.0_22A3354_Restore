@implementation SidecarDisplayConfig

- (SidecarDisplayConfig)initWithCoder:(id)a3
{
  id v4;
  SidecarDisplayConfig *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSNumber *cipher;
  uint64_t v11;
  NSNumber *codec;
  uint64_t v13;
  NSNumber *configureDisplayExclusiveMode;
  uint64_t v15;
  SidecarDevice *device;
  uint64_t v17;
  NSNumber *displayID;
  uint64_t v19;
  NSNumber *framerate;
  uint64_t v21;
  NSNumber *hdr;
  uint64_t v23;
  NSNumber *keyFrameInterval;
  uint64_t v25;
  NSNumber *lowLatency;
  uint64_t v27;
  NSNumber *rtcp;
  uint64_t v29;
  NSNumber *rtcpTimeoutInterval;
  uint64_t v31;
  NSString *service;
  uint64_t v33;
  NSNumber *enableTimeSync;
  uint64_t v35;
  NSNumber *showTouchBar;
  uint64_t v37;
  NSNumber *showSideBar;
  uint64_t v39;
  NSNumber *tilesPerFrame;
  uint64_t v41;
  NSNumber *dataLink;
  uint64_t v43;
  NSNumber *txMinBitrate;
  uint64_t v45;
  NSNumber *txMaxBitrate;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SidecarDisplayConfig;
  v5 = -[SidecarDisplayConfig init](&v48, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    validateXPCCoder(v5, v4, (void *)*MEMORY[0x24BDD0E20]);
    decodeObject(v4, CFSTR("cipher"), v7);
    v9 = objc_claimAutoreleasedReturnValue();
    cipher = v5->_cipher;
    v5->_cipher = (NSNumber *)v9;

    decodeObject(v4, CFSTR("codec"), v7);
    v11 = objc_claimAutoreleasedReturnValue();
    codec = v5->_codec;
    v5->_codec = (NSNumber *)v11;

    decodeObject(v4, CFSTR("configureDisplayExclusiveMode"), v7);
    v13 = objc_claimAutoreleasedReturnValue();
    configureDisplayExclusiveMode = v5->_configureDisplayExclusiveMode;
    v5->_configureDisplayExclusiveMode = (NSNumber *)v13;

    decodeObject(v4, CFSTR("device"), v6);
    v15 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (SidecarDevice *)v15;

    decodeObject(v4, CFSTR("displayID"), v7);
    v17 = objc_claimAutoreleasedReturnValue();
    displayID = v5->_displayID;
    v5->_displayID = (NSNumber *)v17;

    decodeObject(v4, CFSTR("framerate"), v7);
    v19 = objc_claimAutoreleasedReturnValue();
    framerate = v5->_framerate;
    v5->_framerate = (NSNumber *)v19;

    decodeObject(v4, CFSTR("hdr"), v7);
    v21 = objc_claimAutoreleasedReturnValue();
    hdr = v5->_hdr;
    v5->_hdr = (NSNumber *)v21;

    decodeObject(v4, CFSTR("keyFrameInterval"), v7);
    v23 = objc_claimAutoreleasedReturnValue();
    keyFrameInterval = v5->_keyFrameInterval;
    v5->_keyFrameInterval = (NSNumber *)v23;

    decodeObject(v4, CFSTR("lowLatency"), v7);
    v25 = objc_claimAutoreleasedReturnValue();
    lowLatency = v5->_lowLatency;
    v5->_lowLatency = (NSNumber *)v25;

    decodeObject(v4, CFSTR("rtcp"), v7);
    v27 = objc_claimAutoreleasedReturnValue();
    rtcp = v5->_rtcp;
    v5->_rtcp = (NSNumber *)v27;

    decodeObject(v4, CFSTR("rtcpTimeoutInterval"), v7);
    v29 = objc_claimAutoreleasedReturnValue();
    rtcpTimeoutInterval = v5->_rtcpTimeoutInterval;
    v5->_rtcpTimeoutInterval = (NSNumber *)v29;

    v5->_scale = decodeDouble(v4, CFSTR("scale"));
    decodeObject(v4, CFSTR("service"), v8);
    v31 = objc_claimAutoreleasedReturnValue();
    service = v5->_service;
    v5->_service = (NSString *)v31;

    v5->_size.width = decodeDouble(v4, CFSTR("size.width"));
    v5->_size.height = decodeDouble(v4, CFSTR("size.height"));
    decodeObject(v4, CFSTR("timeSync"), v7);
    v33 = objc_claimAutoreleasedReturnValue();
    enableTimeSync = v5->_enableTimeSync;
    v5->_enableTimeSync = (NSNumber *)v33;

    decodeObject(v4, CFSTR("touchBar"), v7);
    v35 = objc_claimAutoreleasedReturnValue();
    showTouchBar = v5->_showTouchBar;
    v5->_showTouchBar = (NSNumber *)v35;

    decodeObject(v4, CFSTR("sideBar"), v7);
    v37 = objc_claimAutoreleasedReturnValue();
    showSideBar = v5->_showSideBar;
    v5->_showSideBar = (NSNumber *)v37;

    decodeObject(v4, CFSTR("tiles"), v7);
    v39 = objc_claimAutoreleasedReturnValue();
    tilesPerFrame = v5->_tilesPerFrame;
    v5->_tilesPerFrame = (NSNumber *)v39;

    v5->_transport = decodeInteger(v4, CFSTR("transport"));
    decodeObject(v4, CFSTR("dataLink"), v7);
    v41 = objc_claimAutoreleasedReturnValue();
    dataLink = v5->_dataLink;
    v5->_dataLink = (NSNumber *)v41;

    decodeObject(v4, CFSTR("txMinBitrate"), v7);
    v43 = objc_claimAutoreleasedReturnValue();
    txMinBitrate = v5->_txMinBitrate;
    v5->_txMinBitrate = (NSNumber *)v43;

    decodeObject(v4, CFSTR("txMaxBitrate"), v7);
    v45 = objc_claimAutoreleasedReturnValue();
    txMaxBitrate = v5->_txMaxBitrate;
    v5->_txMaxBitrate = (NSNumber *)v45;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)*MEMORY[0x24BDD0E18];
  v5 = a3;
  validateXPCCoder(self, v5, v4);
  encodeObject(v5, CFSTR("cipher"), self->_cipher);
  encodeObject(v5, CFSTR("codec"), self->_codec);
  encodeObject(v5, CFSTR("configureDisplayExclusiveMode"), self->_configureDisplayExclusiveMode);
  encodeObject(v5, CFSTR("device"), self->_device);
  encodeObject(v5, CFSTR("displayID"), self->_displayID);
  encodeObject(v5, CFSTR("framerate"), self->_framerate);
  encodeObject(v5, CFSTR("hdr"), self->_hdr);
  encodeObject(v5, CFSTR("keyFrameInterval"), self->_keyFrameInterval);
  encodeObject(v5, CFSTR("lowLatency"), self->_lowLatency);
  encodeObject(v5, CFSTR("rtcp"), self->_rtcp);
  encodeObject(v5, CFSTR("rtcpTimeoutInterval"), self->_rtcpTimeoutInterval);
  encodeDouble(v5, CFSTR("scale"), self->_scale);
  encodeObject(v5, CFSTR("service"), self->_service);
  encodeDouble(v5, CFSTR("size.width"), self->_size.width);
  encodeDouble(v5, CFSTR("size.height"), self->_size.height);
  encodeObject(v5, CFSTR("timeSync"), self->_enableTimeSync);
  encodeObject(v5, CFSTR("touchBar"), self->_showTouchBar);
  encodeObject(v5, CFSTR("sideBar"), self->_showSideBar);
  encodeObject(v5, CFSTR("tiles"), self->_tilesPerFrame);
  encodeInteger(v5, CFSTR("transport"), self->_transport);
  encodeObject(v5, CFSTR("dataLink"), self->_dataLink);
  encodeObject(v5, CFSTR("txMinBitrate"), self->_txMinBitrate);
  encodeObject(v5, CFSTR("txMaxBitrate"), self->_txMaxBitrate);

}

- (id)copyWithZone:(_NSZone *)a3
{
  SidecarDisplayConfig *v4;

  v4 = -[SidecarDisplayConfig init](+[SidecarDisplayConfig allocWithZone:](SidecarDisplayConfig, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_cipher, self->_cipher);
  objc_storeStrong((id *)&v4->_codec, self->_codec);
  objc_storeStrong((id *)&v4->_configureDisplayExclusiveMode, self->_configureDisplayExclusiveMode);
  objc_storeStrong((id *)&v4->_device, self->_device);
  objc_storeStrong((id *)&v4->_displayID, self->_displayID);
  objc_storeStrong((id *)&v4->_enableTimeSync, self->_enableTimeSync);
  objc_storeStrong((id *)&v4->_framerate, self->_framerate);
  objc_storeStrong((id *)&v4->_hdr, self->_hdr);
  objc_storeStrong((id *)&v4->_keyFrameInterval, self->_keyFrameInterval);
  objc_storeStrong((id *)&v4->_lowLatency, self->_lowLatency);
  objc_storeStrong((id *)&v4->_rtcp, self->_rtcp);
  objc_storeStrong((id *)&v4->_rtcpTimeoutInterval, self->_rtcpTimeoutInterval);
  v4->_scale = self->_scale;
  objc_storeStrong((id *)&v4->_service, self->_service);
  objc_storeStrong((id *)&v4->_showTouchBar, self->_showTouchBar);
  objc_storeStrong((id *)&v4->_showSideBar, self->_showSideBar);
  v4->_size = self->_size;
  objc_storeStrong((id *)&v4->_tilesPerFrame, self->_tilesPerFrame);
  v4->_transport = self->_transport;
  objc_storeStrong((id *)&v4->_dataLink, self->_dataLink);
  objc_storeStrong((id *)&v4->_txMaxBitrate, self->_txMaxBitrate);
  objc_storeStrong((id *)&v4->_txMinBitrate, self->_txMinBitrate);
  return v4;
}

- (SidecarDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSNumber)cipher
{
  return self->_cipher;
}

- (void)setCipher:(id)a3
{
  objc_storeStrong((id *)&self->_cipher, a3);
}

- (NSNumber)codec
{
  return self->_codec;
}

- (void)setCodec:(id)a3
{
  objc_storeStrong((id *)&self->_codec, a3);
}

- (NSNumber)configureDisplayExclusiveMode
{
  return self->_configureDisplayExclusiveMode;
}

- (void)setConfigureDisplayExclusiveMode:(id)a3
{
  objc_storeStrong((id *)&self->_configureDisplayExclusiveMode, a3);
}

- (NSNumber)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_displayID, a3);
}

- (NSNumber)enableTimeSync
{
  return self->_enableTimeSync;
}

- (void)setEnableTimeSync:(id)a3
{
  objc_storeStrong((id *)&self->_enableTimeSync, a3);
}

- (NSNumber)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(id)a3
{
  objc_storeStrong((id *)&self->_framerate, a3);
}

- (NSNumber)hdr
{
  return self->_hdr;
}

- (void)setHdr:(id)a3
{
  objc_storeStrong((id *)&self->_hdr, a3);
}

- (NSNumber)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(id)a3
{
  objc_storeStrong((id *)&self->_keyFrameInterval, a3);
}

- (NSNumber)lowLatency
{
  return self->_lowLatency;
}

- (void)setLowLatency:(id)a3
{
  objc_storeStrong((id *)&self->_lowLatency, a3);
}

- (NSNumber)rtcp
{
  return self->_rtcp;
}

- (void)setRtcp:(id)a3
{
  objc_storeStrong((id *)&self->_rtcp, a3);
}

- (NSNumber)rtcpTimeoutInterval
{
  return self->_rtcpTimeoutInterval;
}

- (void)setRtcpTimeoutInterval:(id)a3
{
  objc_storeStrong((id *)&self->_rtcpTimeoutInterval, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)showTouchBar
{
  return self->_showTouchBar;
}

- (void)setShowTouchBar:(id)a3
{
  objc_storeStrong((id *)&self->_showTouchBar, a3);
}

- (NSNumber)showSideBar
{
  return self->_showSideBar;
}

- (void)setShowSideBar:(id)a3
{
  objc_storeStrong((id *)&self->_showSideBar, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSNumber)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (void)setTilesPerFrame:(id)a3
{
  objc_storeStrong((id *)&self->_tilesPerFrame, a3);
}

- (int64_t)transport
{
  return self->_transport;
}

- (void)setTransport:(int64_t)a3
{
  self->_transport = a3;
}

- (NSNumber)dataLink
{
  return self->_dataLink;
}

- (void)setDataLink:(id)a3
{
  objc_storeStrong((id *)&self->_dataLink, a3);
}

- (NSNumber)txMinBitrate
{
  return self->_txMinBitrate;
}

- (void)setTxMinBitrate:(id)a3
{
  objc_storeStrong((id *)&self->_txMinBitrate, a3);
}

- (NSNumber)txMaxBitrate
{
  return self->_txMaxBitrate;
}

- (void)setTxMaxBitrate:(id)a3
{
  objc_storeStrong((id *)&self->_txMaxBitrate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txMaxBitrate, 0);
  objc_storeStrong((id *)&self->_txMinBitrate, 0);
  objc_storeStrong((id *)&self->_dataLink, 0);
  objc_storeStrong((id *)&self->_tilesPerFrame, 0);
  objc_storeStrong((id *)&self->_showSideBar, 0);
  objc_storeStrong((id *)&self->_showTouchBar, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_rtcpTimeoutInterval, 0);
  objc_storeStrong((id *)&self->_rtcp, 0);
  objc_storeStrong((id *)&self->_lowLatency, 0);
  objc_storeStrong((id *)&self->_keyFrameInterval, 0);
  objc_storeStrong((id *)&self->_hdr, 0);
  objc_storeStrong((id *)&self->_framerate, 0);
  objc_storeStrong((id *)&self->_enableTimeSync, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_configureDisplayExclusiveMode, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_cipher, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
