import org.apache.spark.{SparkConf, SparkContext}

object PiExample {
  def main(args: Array[String]): Unit = {

    val NUM_SAMPLES= 1000
    val conf = new SparkConf()
    conf.setAppName("Datasets Test")
    conf.setMaster("local[*]")
    val sc = new SparkContext(conf)
    val count = sc.parallelize(1 to NUM_SAMPLES).filter { _ =>
      val x = math.random
      val y = math.random
      x*x + y*y < 1
    }.count()
    println(s"Pi is roughly ${4.0 * count / NUM_SAMPLES}")
  }
}
