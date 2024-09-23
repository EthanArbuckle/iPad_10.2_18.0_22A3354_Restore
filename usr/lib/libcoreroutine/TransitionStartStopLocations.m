@implementation TransitionStartStopLocations

- (TransitionStartStopLocations)initWithStartLocation:(id)a3 stopLocation:(id)a4
{
  id v7;
  id v8;
  TransitionStartStopLocations *v9;
  TransitionStartStopLocations *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransitionStartStopLocations;
  v9 = -[TransitionStartStopLocations init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startLocation, a3);
    objc_storeStrong((id *)&v10->_stopLocation, a4);
  }

  return v10;
}

- (CLLocation)startLocation
{
  return self->_startLocation;
}

- (CLLocation)stopLocation
{
  return self->_stopLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
}

@end
