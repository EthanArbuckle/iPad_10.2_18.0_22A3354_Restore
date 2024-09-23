@implementation CLSubHarvesterAvengerMotion

- (CLSubHarvesterAvengerMotion)initWithMotion:(CLMotionActivity *)a3 timestamp:(double)a4
{
  CLSubHarvesterAvengerMotion *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CLSubHarvesterAvengerMotion;
  result = -[CLSubHarvesterAvengerMotion init](&v21, "init", a3, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a4, a10);
  if (result)
  {
    *(_OWORD *)&result->_motionActivity.type = *(_OWORD *)&a3->type;
    v15 = *(_OWORD *)&a3->mountedConfidence;
    v16 = *(_OWORD *)&a3->isStanding;
    v17 = *(_OWORD *)&a3->vehicleType;
    *(_OWORD *)&result->_motionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&result->_motionActivity.vehicleType = v17;
    *(_OWORD *)&result->_motionActivity.mountedConfidence = v15;
    *(_OWORD *)&result->_motionActivity.isStanding = v16;
    v18 = *(_OWORD *)&a3[1].type;
    v19 = *(_OWORD *)&a3[1].mountedConfidence;
    v20 = *(_OWORD *)&a3[1].isStanding;
    *(_QWORD *)&result[1]._motionActivity.isStanding = *(_QWORD *)&a3[1].isVehicleConnected;
    *(_OWORD *)&result[1]._motionActivity.type = v19;
    *(_OWORD *)&result[1]._motionActivity.mountedConfidence = v20;
    *(_OWORD *)&result[1].super.isa = v18;
    result->_timestamp = a4;
  }
  return result;
}

- (CLMotionActivity)motionActivity
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v10 = *(_OWORD *)&self[1].isVehicleConnected;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[1].isStanding;
  *(_OWORD *)&retstr[1].isStanding = v10;
  *(_QWORD *)&retstr[1].isVehicleConnected = *(_QWORD *)&self[1].vehicleType;
  v11 = *(_OWORD *)&self->vehicleType;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self->isVehicleConnected;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  v12 = *(_OWORD *)&self[1].mountedConfidence;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[1].type;
  *(_OWORD *)&retstr[1].type = v12;
  v13 = *(_OWORD *)&self->isStanding;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->mountedConfidence;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
