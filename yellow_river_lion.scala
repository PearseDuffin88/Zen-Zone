import scala.annotation.tailrec

// Here we will define an abstract data type for a Zen Zone
trait ZenZone {

  sealed trait Zen
 
  // Zen Zones consist of a collection of Zen objects
  val zenObjects: List[Zen]

  // Along with a few methods to interact with them
  def addZenObject(zenObject: Zen): Unit
  def removeZenObject(index: Int): Unit
  def clear(): Unit

}

// Now we will define an implementation of the Zen Zone ADT
class MyZenZone extends ZenZone {

  override val zenObjects: List[Zen] = List.empty

  override def addZenObject(zenObject: Zen): Unit =
    zenObjects :+ zenObject

  override def removeZenObject(index: Int): Unit =
    zenObjects.slice(0, index) ::: zenObjects.slice(index + 1, zenObjects.length)

  override def clear(): Unit =
    zenObjects.clear()

}

// Now we are ready to create and use our own Zen Zone
object MyZenZone {

  def main(args: Array[String]): Unit = {
    val myZenZone = MyZenZone()

    // Here we can add some zen objects to our MyZenZone instance
    myZenZone.addZenObject(ZenObject("Breathing meditation"))
    myZenZone.addZenObject(ZenObject("Mindfulness practice"))
    myZenZone.addZenObject(ZenObject("Yoga"))

    // Here we can remove a specific zen object from our MyZenZone instance
    myZenZone.removeZenObject(1)

    // Here we can clear all zen objects from our MyZenZone instance
    myZenZone.clear()
  }

}

// Let's define our zen objects
case class ZenObject(name: String) extends Zen

// Here we will define a method to create a new MyZenZone instance
object MyZenZone {

  def apply(): MyZenZone =
    new MyZenZone

}

// Now we will define some generic functions that can be used to interact with all Zen Zones
object ZenZone {

  def clear(zenZone: ZenZone): Unit =
    zenZone.clear()

  def addZenObject(zenZone: ZenZone, zenObject: Zen): Unit =
    zenZone.addZenObject(zenObject)

  def removeZenObject(zenZone: ZenZone, index: Int): Unit =
    zenZone.removeZenObject(index)

}