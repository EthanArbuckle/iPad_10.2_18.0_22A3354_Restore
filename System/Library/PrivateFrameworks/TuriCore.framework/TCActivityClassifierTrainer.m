@implementation TCActivityClassifierTrainer

+ (id)graphsForOptions:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  turi::neural_net::model_spec *v6;
  std::vector<std::string> v8;
  void *__p;
  _QWORD *v10;
  uint64_t v11;
  turi::neural_net::model_spec *v12;
  int v13[8];
  _QWORD **v14;
  _QWORD *v15;
  uint64_t v16;
  std::vector<std::string> *v17;

  v3 = a3;
  v15 = 0;
  v16 = 0;
  v14 = &v15;
  v13[0] = objc_msgSend(v3, "batchSize");
  v13[1] = objc_msgSend(v3, "numFeatures");
  v13[2] = objc_msgSend(v3, "predictionWindow");
  v13[3] = objc_msgSend(v3, "numClasses");
  v13[4] = objc_msgSend(v3, "numPredictionsPerChunk");
  v13[5] = objc_msgSend(v3, "randomSeed");
  std::string::basic_string[abi:ne180100]<0>(&__p, "target");
  std::vector<std::string>::vector(&v8, objc_msgSend(v3, "numFeatures"));
  objc_msgSend(v3, "predictionWindow");
  objc_msgSend(v3, "numClasses");
  objc_msgSend(v3, "randomSeed");
  turi::activity_classification::activity_classifier::init_model((uint64_t)&__p, (uint64_t)&v8);
  v17 = &v8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  if (SHIBYTE(v11) < 0)
    operator delete(__p);
  turi::neural_net::model_spec::export_params_view(v12, (uint64_t)&__p);
  std::__tree<std::__value_type<std::string,turi::neural_net::shared_float_array>,std::__map_value_compare<std::string,std::__value_type<std::string,turi::neural_net::shared_float_array>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,turi::neural_net::shared_float_array>>>::destroy((uint64_t)&v14, v15);
  v4 = v10;
  v14 = (_QWORD **)__p;
  v15 = v10;
  v16 = v11;
  if (v11)
  {
    v10[2] = &v15;
    __p = &v10;
    v10 = 0;
    v11 = 0;
    v4 = 0;
  }
  else
  {
    v14 = &v15;
  }
  std::__tree<std::__value_type<std::string,turi::neural_net::shared_float_array>,std::__map_value_compare<std::string,std::__value_type<std::string,turi::neural_net::shared_float_array>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,turi::neural_net::shared_float_array>>>::destroy((uint64_t)&__p, v4);
  turi::proprietary::neural_net::mlc_activity_classifier_backend::create_graphs(v13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v12 = 0;
  if (v6)
  {
    turi::neural_net::model_spec::~model_spec(v6);
    MEMORY[0x219A19A08]();
  }
  std::__tree<std::__value_type<std::string,turi::neural_net::shared_float_array>,std::__map_value_compare<std::string,std::__value_type<std::string,turi::neural_net::shared_float_array>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,turi::neural_net::shared_float_array>>>::destroy((uint64_t)&v14, v15);

  return v5;
}

@end
