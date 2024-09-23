@implementation RWIProtocolDOMVideoPlaybackQuality

- (RWIProtocolDOMVideoPlaybackQuality)initWithDisplayCompositedVideoFrames:(int)a3 droppedVideoFrames:(int)a4 totalVideoFrames:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  RWIProtocolDOMVideoPlaybackQuality *v8;
  RWIProtocolDOMVideoPlaybackQuality *v9;
  RWIProtocolDOMVideoPlaybackQuality *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  v8 = -[RWIProtocolJSONObject init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[RWIProtocolDOMVideoPlaybackQuality setDisplayCompositedVideoFrames:](v8, "setDisplayCompositedVideoFrames:", v7);
    -[RWIProtocolDOMVideoPlaybackQuality setDroppedVideoFrames:](v9, "setDroppedVideoFrames:", v6);
    -[RWIProtocolDOMVideoPlaybackQuality setTotalVideoFrames:](v9, "setTotalVideoFrames:", v5);
    v10 = v9;
  }

  return v9;
}

- (void)setDisplayCompositedVideoFrames:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("displayCompositedVideoFrames"));
}

- (int)displayCompositedVideoFrames
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("displayCompositedVideoFrames"));
}

- (void)setDroppedVideoFrames:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("droppedVideoFrames"));
}

- (int)droppedVideoFrames
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("droppedVideoFrames"));
}

- (void)setTotalVideoFrames:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("totalVideoFrames"));
}

- (int)totalVideoFrames
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("totalVideoFrames"));
}

@end
