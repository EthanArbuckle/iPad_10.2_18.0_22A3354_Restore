@implementation _VLLocalizerAltitudeQuery

- (_VLLocalizerAltitudeQuery)init
{
  _VLLocalizerAltitudeQuery *result;

  result = (_VLLocalizerAltitudeQuery *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_VLLocalizerAltitudeQuery)initWithLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v9;
  id v10;
  id v11;
  _VLLocalizerAltitudeQuery *v12;
  _VLLocalizerAltitudeQuery *v13;
  uint64_t v14;
  id callback;
  _VLLocalizerAltitudeQuery *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_VLLocalizerAltitudeQuery;
  v12 = -[_VLLocalizerAltitudeQuery init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_location, a3);
    if (qword_253E9A288 != -1)
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    v13->_signpostID = os_signpost_id_generate((os_log_t)qword_253E9A280);
    objc_storeStrong((id *)&v13->_callbackQueue, a4);
    v14 = objc_msgSend(v11, "copy");
    callback = v13->_callback;
    v13->_callback = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (CLLocation)location
{
  return self->_location;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
