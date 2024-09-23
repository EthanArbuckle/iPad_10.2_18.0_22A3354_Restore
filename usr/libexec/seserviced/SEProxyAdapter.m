@implementation SEProxyAdapter

- (id)transceive:(id)a3 outError:(id *)a4
{
  id v6;
  SEProxyInterface *proxy;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004D21C;
  v21 = sub_10004D22C;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10004D21C;
  v15 = sub_10004D22C;
  v16 = 0;
  proxy = self->_proxy;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004D234;
  v10[3] = &unk_100304AA8;
  v10[4] = &v17;
  v10[5] = &v11;
  -[SEProxyInterface transceive:callback:](proxy, "transceive:callback:", v6, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
