@implementation NetworkOperationURLSessionDelegate

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  _TtC13TeaFoundation34NetworkOperationURLSessionDelegate *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  NetworkOperationURLSessionDelegate.urlSession(_:didBecomeInvalidWithError:)(v6, a4);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC13TeaFoundation34NetworkOperationURLSessionDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  NetworkOperationURLSessionDelegate.urlSession(_:task:didCompleteWithError:)((uint64_t)v11, v9, a5);

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13TeaFoundation34NetworkOperationURLSessionDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  NetworkOperationURLSessionDelegate.urlSession(_:task:didFinishCollecting:)((NSURLSession)v11, (NSURLSessionTask)v9, (NSURLSessionTaskMetrics)v10);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _TtC13TeaFoundation34NetworkOperationURLSessionDelegate *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = self;
  v11 = sub_190BE46F4();
  v13 = v12;

  NetworkOperationURLSessionDelegate.urlSession(_:dataTask:didReceive:)(v14, v9, v11, v13);
  sub_190AEF3F4(v11, v13);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC13TeaFoundation34NetworkOperationURLSessionDelegate *v14;
  uint64_t v15;

  v8 = sub_190BE4628();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_190BE45C8();
  v12 = a3;
  v13 = a4;
  v14 = self;
  NetworkOperationURLSessionDelegate.urlSession(_:downloadTask:didFinishDownloadingTo:)((uint64_t)v14, v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4;
  _TtC13TeaFoundation34NetworkOperationURLSessionDelegate *v5;

  v4 = a3;
  v5 = self;
  NetworkOperationURLSessionDelegate.urlSessionDidFinishEvents(forBackgroundURLSession:)((NSURLSession)v4);

}

- (_TtC13TeaFoundation34NetworkOperationURLSessionDelegate)init
{
  return (_TtC13TeaFoundation34NetworkOperationURLSessionDelegate *)NetworkOperationURLSessionDelegate.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
