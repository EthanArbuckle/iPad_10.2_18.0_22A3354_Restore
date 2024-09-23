@implementation CLDuetNowPlaying

- (CLDuetNowPlaying)initWithBundleId:(id)a3 status:(id)a4 track:(id)a5 outputDeviceIDs:(id)a6
{
  CLDuetNowPlaying *v10;
  CLDuetNowPlaying *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLDuetNowPlaying;
  v10 = -[CLDuetNowPlaying init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[CLDuetNowPlaying setBundleId:](v10, "setBundleId:", a3);
    -[CLDuetNowPlaying setStatus:](v11, "setStatus:", a4);
    -[CLDuetNowPlaying setTrack:](v11, "setTrack:", a5);
    -[CLDuetNowPlaying setOutputDeviceIDs:](v11, "setOutputDeviceIDs:", a6);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[CLDuetNowPlaying setBundleId:](self, "setBundleId:", 0);
  -[CLDuetNowPlaying setStatus:](self, "setStatus:", 0);
  -[CLDuetNowPlaying setTrack:](self, "setTrack:", 0);
  -[CLDuetNowPlaying setOutputDeviceIDs:](self, "setOutputDeviceIDs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLDuetNowPlaying;
  -[CLDuetNowPlaying dealloc](&v3, "dealloc");
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)track
{
  return self->_track;
}

- (void)setTrack:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSDictionary)outputDeviceIDs
{
  return self->_outputDeviceIDs;
}

- (void)setOutputDeviceIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
