package pe.edu.upeu.calcjc

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import pe.edu.upeu.calcjc.ui.theme.CalcJCTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CalcJCTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    //Greeting("Android")
                    Calculadora()
                }
            }
        }
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

fun isNumeric(toCheck:String):Boolean{
    val regex="-?[0-9]+(\\.[0-9]+)?".toRegex()
    return toCheck.matches(regex)
}

@Composable
fun Calculadora() {
    val (oldVal, setOldVal) = remember { mutableStateOf("") }
    val (operador, setOperador) = remember { mutableStateOf("") }
    val (result, setResult) = remember { mutableStateOf("") }

    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        OutlinedTextField(value = result, onValueChange = {})
        var listA = listOf<String>("AC", ".", "%", "/")
        var listB = listOf<String>("7", "8", "9", "*")
        var listC = listOf<String>("4", "5", "6", "+")
        var listD = listOf<String>("1", "2", "3", "-")
        var listE = listOf<String>("0", "=")
        var listaFinal = listOf<List<String>>(listA, listB, listC, listD, listE)

        listaFinal.forEach {
            var lista=it
            Row() {
                lista.forEach{
                    Button(onClick = {
                        if(isNumeric(it)){
                          setResult(result+it.toString())
                        }

                        if(it.equals("/") || it.equals("*") || it.equals("%") || it.equals("+") || it.equals("-")){
                            setOldVal(result)
                            setResult("")
                            setOperador(it.toString())
                        }

                        if(it.equals("AC")){
                            setResult("")
                        }

                        if(it.equals(".")){
                            if(!result.contains(".")){
                                setResult(result+".")
                            }
                        }

                        if(it.equals("=")){
                            val num1=oldVal.toDouble()
                            val num2=result.toDouble()
                            when(operador){
                                "/"->setResult((num1/num2).toString())
                                "*"->setResult((num1*num2).toString())
                                "+"->setResult((num1+num2).toString())
                                "-"->setResult((num1-num2).toString())
                            }
                        }

                    },
                        modifier = Modifier.padding(4.dp)
                        ) {
                        Text(text = it)
                    }
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    CalcJCTheme {
        //Greeting("Android")
        Calculadora()
    }
}